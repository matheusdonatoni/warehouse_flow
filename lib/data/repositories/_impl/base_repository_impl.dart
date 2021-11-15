import 'package:get/get.dart';
import '/data/providers/local_storage.dart';

class BaseRepositoryImpl {
  LocalStorage get localStorage => Get.find();
}
