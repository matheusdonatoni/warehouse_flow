import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../log/log.dart';
import '../../../../routes/routes.dart';

class LogNavigator extends StatelessWidget {
  const LogNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(1),
      initialRoute: Routes.LOG,
      onGenerateInitialRoutes: (navigator, initialRouteName) => [
        GetPageRoute(
          page: () => LogPage(),
        )
      ],
      onGenerateRoute: (settings) {
        return GetPageRoute(
          page: () => LogPage(),
        );
      },
    );
  }
}
