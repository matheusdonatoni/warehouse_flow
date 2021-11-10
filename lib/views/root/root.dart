import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/navigation_services.dart';
import '../home/home.dart';
import '../log/log.dart';
import '../../routes/routes.dart';
import 'widgets/drawer/drawer_tile.dart';
import 'widgets/drawer/persistend_navigation_drawer.dart';

class RootPage extends GetView<NavigationServices> {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle de estoque'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Row(
          children: [
            Obx(
              () => PersistentNavigationDrawer(
                index: controller.index,
                onTap: controller.onItemTapped,
                items: [
                  DrawerTile(
                    icon: Icon(Icons.home),
                    label: 'Início',
                  ),
                  DrawerTile(
                    icon: Icon(Icons.table_chart_outlined),
                    label: 'Registros',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  top: 24.0,
                  right: 24.0,
                ),
                child: Obx(
                  () => IndexedStack(
                    index: controller.index,
                    children: [
                      Navigator(
                        key: Get.nestedKey(0),
                        onGenerateInitialRoutes:
                            (navigator, initialRouteName) => [
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
                        onGenerateInitialRoutes:
                            (navigator, initialRouteName) => [
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
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
