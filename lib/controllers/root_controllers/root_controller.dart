import 'package:get/get.dart';
import 'package:warehouse_flow/views/root/widgets/navigators/products_navigator/bloc.dart';
import '../../views/root/widgets/navigators/home_navigator/bloc.dart';
import '../../views/root/widgets/navigators/register_navigator/bloc.dart';
import '../../data/repositories/product_repository.dart';
import '../../data/repositories/warehouse_repository.dart';
import '../../data/models/product.dart';
import '../../data/models/warehouse.dart';

class RootController extends GetxController {
  WarehouseRepository get _warehouseRepository => Get.find();
  ProductRepository get _productRepository => Get.find();

  HomeNavigatorBloc get _homeNavigatorBloc => Get.find();
  RegisterNavigatorBloc get _registerNavigatorBloc => Get.find();
  ProductsNavigatorBloc get _productNavigatorBloc => Get.find();

  final warehouse = Rx<Warehouse>(Warehouse());
  final products = RxList<Product>();

  @override
  void onInit() async {
    super.onInit();

    warehouse.value = await _warehouseRepository.findEagerLoadRegister(1);

    _homeNavigatorBloc.status = RxStatus.success();
    _registerNavigatorBloc.status = RxStatus.success();

    products.assignAll(await _productRepository.findAll());

    _productNavigatorBloc.status = RxStatus.success();
  }
}
