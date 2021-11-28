import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controllers/_impl/base_getx_controller_impl.dart';
import '../../../../../routes/routes.dart';
import '../../../../../bindings/register_bindings.dart';
import '../../../../register/register.dart';

import 'bloc.dart';

class RegisterNavigator extends GetView<RegisterNavigatorBloc> {
  const RegisterNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => RegisterNavigatorBloc());

    return controller.obx(
      () => Navigator(
        key: Get.nestedKey(1),
        initialRoute: Routes.REGISTER,
        onGenerateInitialRoutes: (navigator, initialRouteName) => [
          GetPageRoute(
            page: () => RegisterPage(),
            binding: RegisterPageBinding(),
          )
        ],
        onGenerateRoute: (settings) {
          return GetPageRoute(
            page: () => RegisterPage(),
            binding: RegisterPageBinding(),
          );
        },
      ),
    );
  }
}
