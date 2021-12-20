import 'dart:io';
import 'dart:typed_data';

import 'package:charset_converter/charset_converter.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:warehouse_flow/views/widgets/info_dialog.dart';

import '../../services/permission_services.dart';

class FileImporter {
  PermissionServices get permissionServices => Get.find();

  Future<String?> pickCsv() async {
    if (await permissionServices.isStorageAccessGuaranteed()) {
      var result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv'],
      );

      if (result != null) {
        File file = await _saveFileLocally(
          File(result.files.single.path!),
        ).then(
          (value) => _convertCsvToTxt(value),
        );

        try {
          return await file.readAsString();
        } catch (e) {
          try {
            return await CharsetConverter.decode(
              "windows1250",
              Uint8List.fromList(await file.readAsBytes()),
            );
          } catch (e) {
            await Get.dialog(
              InfoDialog(
                title: 'Formato inválido',
                message: 'Ao exportar o arquivo CSV, tenha certeza '
                    'que o mesmo seja codificado em UTF8 ou ANSI',
              ),
            );
          }
        }
      }
    }
  }

  Future<File> _convertCsvToTxt(File file) async {
    var path = file.path;

    var filename = file.path.split(Platform.pathSeparator).last;

    var name = filename.split('.').first;

    var lastSeparator = path.lastIndexOf(Platform.pathSeparator);

    var newPath = path.substring(0, lastSeparator + 1) + name + '.txt';

    return file.rename(newPath);
  }

  Future<File> _saveFileLocally(File file) async {
    var dir = await getApplicationDocumentsDirectory();

    var filename = file.path.split(Platform.pathSeparator).last;

    return file.copy(join(dir.path, filename));
  }
}
