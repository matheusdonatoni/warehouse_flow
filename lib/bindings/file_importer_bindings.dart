import 'package:get/get.dart';
import '../data/repositories/csv_repository.dart';
import '../controllers/file_importer_controllers/file_importer_controller.dart';

class FileImporterBinding implements Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => CsvRepository());
    Get.lazyPut(() => FileImporterController());
  }
}
