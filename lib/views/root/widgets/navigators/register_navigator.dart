import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../register/register.dart';
import '../../../../routes/routes.dart';
import '../../../../bindings/register_bindings.dart';

class LogNavigator extends StatelessWidget {
  const LogNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
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
    );
  }
}
