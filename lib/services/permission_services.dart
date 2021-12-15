import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../views/widgets/storage_access_dialog.dart';

class PermissionServices extends GetxService {
  Future<bool> isStorageAccessGuaranteed() async {
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
}
