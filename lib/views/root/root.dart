import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controllers/root_controllers/root_controller.dart';
import '../../services/navigation_services.dart';
import 'widgets/drawer/drawer_tile.dart';
import 'widgets/drawer/navigation_drawer.dart';
import 'widgets/navigators/home_navigator/home_navigator.dart';
import 'widgets/navigators/products_navigator/products_navigator.dart';
import 'widgets/navigators/register_navigator/register_navigator.dart';
import 'widgets/navigators/file_importer_navigator/file_importer_navigator.dart';

class RootPage extends GetResponsiveView<RootController> {
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

  Widget get _drawer => GetX<NavigationServices>(
        builder: (navigator) => NavigationDrawer(
          index: navigator.index,
          onTap: navigator.onItemTapped,
          items: [
            DrawerTile(
              icon: Icon(Icons.home_outlined),
              label: 'Início',
            ),
            DrawerTile(
              icon: Icon(Icons.table_chart_outlined),
              label: 'Registros',
            ),
            DrawerTile(
              icon: Icon(Icons.workspaces_outlined),
              label: 'Produtos',
            ),
            DrawerTile(
              icon: Icon(Icons.file_copy_outlined),
              label: 'Importar',
            ),
          ],
        ),
      );

  Widget get _effectiveBody => GetX<NavigationServices>(
        builder: (navigator) => IndexedStack(
          index: navigator.index,
          children: [
            HomeNavigator(),
            RegisterNavigator(),
            ProductsNavigator(),
            FileImporterNavigator(),
          ],
        ),
      );
}
