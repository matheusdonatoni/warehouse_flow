import 'package:get/get.dart';
import '../data/providers/file_importer.dart';
import '../services/permission_services.dart';
import '../services/file_exporter_services.dart';
import '../services/navigation_services.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => NavigationServices(), fenix: true);
    Get.lazyPut(() => PermissionServices(), fenix: true);
    Get.lazyPut(() => FileExporterServices(), fenix: true);
    Get.lazyPut(() => FileImporter(), fenix: true);
  }
}
