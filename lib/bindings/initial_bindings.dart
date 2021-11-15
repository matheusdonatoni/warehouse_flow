import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../services/navigation_services.dart';
import '../data/providers/local_storage.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => NavigationServices(), fenix: true);

    if (!kIsWeb) await Get.putAsync(() => LocalStorage.init(), permanent: true);
  }
}
