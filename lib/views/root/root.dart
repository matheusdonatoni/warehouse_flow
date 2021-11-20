import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/navigation_services.dart';
import 'widgets/drawer/drawer_tile.dart';
import 'widgets/drawer/navigation_drawer.dart';
import 'widgets/navigators/home_navigator.dart';
import 'widgets/navigators/register_navigator.dart';

class RootPage extends GetResponsiveView<NavigationServices> {
  RootPage({Key? key}) : super(key: key);

  @override
  Widget? phone() => Scaffold(
        appBar: _appbar,
        drawer: _drawer,
        body: _effectiveBody,
      );

  @override
  Widget? desktop() => Scaffold(
        appBar: _appbar,
        body: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: _drawer,
            ),
            Expanded(
              child: _effectiveBody,
            ),
          ],
        ),
      );

  PreferredSizeWidget get _appbar => AppBar(
        title: Text('Controle de Estoque'),
      );

  Widget get _drawer => Obx(
        () => NavigationDrawer(
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
      );

  Widget get _effectiveBody => Obx(
        () => IndexedStack(
          index: controller.index,
          children: [
            HomeNavigator(),
            LogNavigator(),
          ],
        ),
      );
}
