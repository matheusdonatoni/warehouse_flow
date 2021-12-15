import 'dart:io';

import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

import 'permission_services.dart';

class CsvReaderServices extends GetxService {
  PermissionServices get permissionServices => Get.find();

  Future<void> pickCsv() async {
    var result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['csv'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
    }
  }
}
