import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'drawer_tile.dart';

class NavigationDrawer extends GetResponsiveView {
  final int index;
  final List<DrawerTile> items;
  final void Function(int index)? onTap;

  NavigationDrawer({
    Key? key,
    required this.index,
    required this.items,
    this.onTap,
  }) : super(key: key);

  @override
  Widget? phone() => Drawer(
        child: ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              title: Text(
                'Controle de Estoque',
                style: Get.textTheme.headline6,
              ),
            ),
            Divider(),
            ..._tiles,
          ],
        ),
      );

  @override
  Widget? tablet() => Drawer(
        elevation: 0.0,
        child: ListView(
          shrinkWrap: true,
          children: _tiles,
        ),
      );

  @override
  Widget? desktop() => Drawer(
        elevation: 0.0,
        child: ListView(
          shrinkWrap: true,
          children: _tiles,
        ),
      );

  List<Widget> get _tiles {
    final List<Widget> _items = [];

    for (int i = 0; i < items.length; i++) {
      _items.add(
        Builder(
          builder: (context) {
            final _scafoldState = Scaffold.of(context);

            return _DrawerTile(
              icon: items[i].icon,
              label: items[i].label,
              selected: index == i,
              onTap: () async {
                if (_scafoldState.hasDrawer && _scafoldState.isDrawerOpen) {
                  Get.back();
                }

                Future.delayed(Duration(milliseconds: 300)).whenComplete(
                  () => onTap?.call(i),
                );
              },
            );
          },
        ),
      );
    }

    return _items;
  }
}

class _DrawerTile extends StatelessWidget {
  final Widget icon;
  final String label;
  final void Function()? onTap;
  final bool selected;
  const _DrawerTile({
    Key? key,
    required this.icon,
    required this.label,
    this.onTap,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: ListTile(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(
              32,
            ),
          ),
        ),
        title: Text(label),
        leading: icon,
        onTap: onTap,
        selected: selected,
        selectedTileColor: selected
            ? theme.colorScheme.primary.withOpacity(0.12)
            : Colors.transparent,
      ),
    );
  }
}
