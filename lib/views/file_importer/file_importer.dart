import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/_impl/base_getx_controller_impl.dart';
import '../../controllers/file_importer_controllers/file_importer_controller.dart';

class FileImporterPage extends GetWidget<FileImporterController> {
  const FileImporterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: controller.simpleObx(
        () {
          return FloatingActionButton.extended(
            onPressed: controller.clear,
            label: Text('Cancelar'),
            icon: Icon(Icons.clear),
          );
        },
        onEmpty: FloatingActionButton.extended(
          onPressed: controller.importCsv,
          label: Text('Importar'),
          icon: Icon(Icons.add),
        ),
      ),
      body: controller.obx(
        () => Obx(
          () => PaginatedDataTable(
            columns: List.generate(
              controller.rows[0].length,
              (index) => DataColumn(
                label: Text('c$index'),
              ),
            ),
            source: controller.source,
          ),
        ),
      ),
    );
  }
}
