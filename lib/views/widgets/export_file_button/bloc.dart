import 'package:get/get.dart';
import '../../../services/file_exporter_services.dart';

class ExportFileButtonBloc extends GetxController {
  final _exporter = Get.find<FileExporterServices>();

  void saveJson(
    String json,
    String fileName,
  ) async =>
      await _exporter.saveJsonFile(
        json,
        fileName + '.json',
      );
}
