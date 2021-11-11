import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/navigation_services.dart';
import 'widgets/drawer/drawer_tile.dart';
import 'widgets/drawer/persistend_navigation_drawer.dart';
import 'widgets/navigators/home_navigator.dart';
import 'widgets/navigators/log_navigator.dart';

class RootPage extends GetView<NavigationServices> {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle de Estoque'),
      ),
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Obx(
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
          ),
          Expanded(
            child: Obx(
              () => IndexedStack(
                index: controller.index,
                children: [
                  HomeNavigator(),
                  LogNavigator(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
