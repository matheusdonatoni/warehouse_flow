import 'package:get/get.dart';
import '../controllers/products_controller/products_controller.dart';

class ProductsBinding implements Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => ProductsController());
  }
}
