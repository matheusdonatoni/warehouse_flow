import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/file_importer_controllers/file_importer_controller.dart';

class FileImporterPage extends GetWidget<FileImporterController> {
  const FileImporterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('importador'),
    );
  }
}
