import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controllers/_impl/base_getx_controller_impl.dart';
import '../../../../../bindings/home_bindings.dart';
import '../../../../../routes/routes.dart';
import '../../../../home/home.dart';

import 'bloc.dart';

class HomeNavigator extends GetView<HomeNavigatorBloc> {
  const HomeNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeNavigatorBloc());

    return controller.obx(
      () => Navigator(
        key: Get.nestedKey(0),
        initialRoute: Routes.HOME,
        onGenerateInitialRoutes: (navigator, initialRouteName) => [
          GetPageRoute(
            page: () => HomePage(),
            binding: HomeBinding(),
          )
        ],
        onGenerateRoute: (settings) {
          return GetPageRoute(
            page: () => HomePage(),
            binding: HomeBinding(),
          );
        },
      ),
    );
  }
}
