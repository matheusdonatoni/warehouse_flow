import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'drawer_tile.dart';

class NavigationDrawer extends GetResponsiveView {
  final List<DrawerTile> items;
  final void Function(int index)? onTap;
  final double elevation;
  final int index;

  @override
  Widget? phone() => Drawer(
        child: ListView(
          shrinkWrap: true,
          children: _createTiles,
        ),
      );

  NavigationDrawer({
    Key? key,
    required this.items,
    this.index = 0,
    this.onTap,
  })  : this.elevation = 16.0,
        super(key: key);

  List<Widget> get _createTiles {
    final List<Widget> _items = [];

    for (int i = 0; i < items.length; i++) {
      _items.add(
        _DrawerTile(
          icon: items[i].icon,
          label: items[i].label,
          selected: index == i,
          onTap: () => onTap?.call(i),
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
