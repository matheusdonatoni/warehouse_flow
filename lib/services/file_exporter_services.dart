import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

import 'dart:io';

import '../views/widgets/save_file_progress_dialog/save_file_progress_dialog.dart';
import '../views/widgets/storage_access_dialog.dart';
import '../data/utils/constants.dart';

class FileExporterServices extends GetxService {
  Directory _documents = Directory(kDocumentsPath);

  Future<void> saveJsonFile(String json, String fileName) async {
    if (await _isAccessGuaranteed()) {
      await _verifyDirectory();

      var file = File(join(_documents.path, kNowForPath + '_' + fileName));

      await Get.dialog(
        SaveFileProgressDialog(
          () async => await file.writeAsString(json),
        ),
        barrierDismissible: false,
      );
    }
  }

  Future<bool> _isAccessGuaranteed() async {
    var status = await Permission.storage.status;

    if (status.isGranted) return true;

    if (status.isDenied) {
      status = await Permission.storage.request();

      if (status.isPermanentlyDenied) {
        await Get.dialog(StorageAccessDialog());
      }
    }

    return await Permission.storage.status.isGranted;
  }

  Future<void> _verifyDirectory() async {
    if (!await _documents.exists()) {
      _documents = await _documents.create(recursive: true);
    }
  }
}
