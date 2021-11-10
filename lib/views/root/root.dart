import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/navigation_services.dart';
import '../home/home.dart';
import '../log/log.dart';
import '../../routes/routes.dart';

class RootPage extends GetView<NavigationServices> {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: controller.index,
      children: [
        Navigator(
          key: Get.nestedKey(0),
          onGenerateInitialRoutes: (navigator, initialRouteName) => [
            GetPageRoute(
              page: () => HomePage(),
            )
          ],
          initialRoute: Routes.HOME,
          onGenerateRoute: (settings) {
            return GetPageRoute(
              page: () => HomePage(),
            );
          },
        ),
        Navigator(
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
        ),
      ],
    );
  }
}
