import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controllers/_impl/base_getx_controller_impl.dart';
import '../../../../../bindings/products_bindings.dart';
import '../../../../../routes/routes.dart';
import '../../../../products/products.dart';

import 'bloc.dart';

class ProductsNavigator extends GetView<ProductsNavigatorBloc> {
  const ProductsNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProductsNavigatorBloc());

    return controller.obx(
      () => Navigator(
        key: Get.nestedKey(2),
        initialRoute: Routes.PRODUCT,
        onGenerateInitialRoutes: (navigator, initialRouteName) => [
          GetPageRoute(
            page: () => ProductsPage(),
            binding: ProductsBinding(),
          )
        ],
        onGenerateRoute: (settings) {
          return GetPageRoute(
            page: () => ProductsPage(),
            binding: ProductsBinding(),
          );
        },
      ),
    );
  }
}
