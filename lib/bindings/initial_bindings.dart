import 'package:get/get.dart';
import '../services/csv_reader_services.dart';
import '../services/permission_services.dart';
import '../services/file_exporter_services.dart';
import '../services/navigation_services.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => NavigationServices(), fenix: true);
    Get.lazyPut(() => PermissionServices(), fenix: true);
    Get.lazyPut(() => FileExporterServices(), fenix: true);
    Get.lazyPut(() => CsvReaderServices(), fenix: true);
  }
}
