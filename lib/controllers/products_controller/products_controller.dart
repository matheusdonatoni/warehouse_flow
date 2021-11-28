import 'package:get/get.dart';
import '../../data/models/product.dart';
import '../../controllers/root_controllers/root_controller.dart';

import '../_impl/base_getx_controller_impl.dart';

class ProductsController extends BaseGetxControllerImpl {
  RootController get _rootController => Get.find();

  RxList<Product> get products => _rootController.products;
}
