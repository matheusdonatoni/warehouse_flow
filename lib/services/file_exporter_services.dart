import 'dart:io';

import 'package:get/get.dart';
import 'package:path/path.dart';

import '../views/widgets/save_file_progress_dialog/save_file_progress_dialog.dart';
import '../data/utils/constants.dart';
import 'permission_services.dart';

class FileExporterServices extends GetxService {
  Directory _documents = Directory(kDocumentsPath);

  PermissionServices get permissionServices => Get.find();

  Future<void> saveJsonFile(String json, String fileName) async {
    if (await permissionServices.isStorageAccessGuaranteed()) {
      await _verifyDirectory();

      var file = File(join(_documents.path, kNowToPath + '_' + fileName));

      await Get.dialog(
        SaveFileProgressDialog(
          () async => await file.writeAsString(json),
        ),
        barrierDismissible: false,
      );
    }
  }

  Future<void> _verifyDirectory() async {
    if (!await _documents.exists()) {
      _documents = await _documents.create(recursive: true);
    }
  }
}
