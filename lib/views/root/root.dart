import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/navigation_services.dart';
import 'widgets/drawer/drawer_tile.dart';
import 'widgets/drawer/navigation_drawer.dart';
import 'widgets/navigators/home_navigator.dart';
import 'widgets/navigators/log_navigator.dart';

class RootPage extends GetResponsiveView<NavigationServices> {
  RootPage({Key? key}) : super(key: key);

  @override
  Widget? phone() => Scaffold(
        appBar: AppBar(
          title: Text('Controle de Estoque'),
        ),
        drawer: NavigationDrawer(
          index: controller.index,
          onTap: controller.onItemTapped,
          items: _items,
        ),
        body: _body,
      );

  @override
  Widget? desktop() => Scaffold(
        appBar: AppBar(
          title: Text('Controle de Estoque'),
        ),
        body: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Obx(
                () => NavigationDrawer(
                  index: controller.index,
                  onTap: controller.onItemTapped,
                  items: _items,
                ),
              ),
            ),
            Expanded(
              child: _body,
            ),
          ],
        ),
      );

  List<DrawerTile> get _items => [
        DrawerTile(
          icon: Icon(Icons.home),
          label: 'Início',
        ),
        DrawerTile(
          icon: Icon(Icons.table_chart_outlined),
          label: 'Registros',
        ),
      ];

  Widget get _body => Obx(
        () => IndexedStack(
          index: controller.index,
          children: [
            HomeNavigator(),
            LogNavigator(),
          ],
        ),
      );
}
