import 'package:flutter/material.dart';

import 'drawer_tile.dart';

class PersistentNavigationDrawer extends StatelessWidget {
  final List<DrawerTile> items;
  final void Function(int index)? onTap;
  final int index;
  final double width;

  const PersistentNavigationDrawer({
    Key? key,
    required this.items,
    this.index = 0,
    this.onTap,
    this.width = 256,
  }) : super(key: key);

  List<Widget> _createTiles() {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: width,
      child: ListView(
        shrinkWrap: true,
        children: [
          ..._createTiles(),
        ],
      ),
    );
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

    return ListTile(
      shape: RoundedRectangleBorder(
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
    );
  }
}
