import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../home/home.dart';
import '../../../../routes/routes.dart';

class HomeNavigator extends StatelessWidget {
  const HomeNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(0),
      initialRoute: Routes.LOG,
      onGenerateInitialRoutes: (navigator, initialRouteName) => [
        GetPageRoute(
          page: () => HomePage(),
        )
      ],
      onGenerateRoute: (settings) {
        return GetPageRoute(
          page: () => HomePage(),
        );
      },
    );
  }
}
