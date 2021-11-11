import 'package:flutter/material.dart';

class ChamberDropDownButton extends StatelessWidget {
  const ChamberDropDownButton({Key? key}) : super(key: key);

  List<DropdownMenuItem<int>> _createTiles() {
    final _items = <DropdownMenuItem<int>>[];

    for (int i = 0; i < 5; i++) {
      _items.add(
        DropdownMenuItem(
          value: i,
          child: Text('Câmara ${i + 1}'),
        ),
      );
    }

    return _items;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      onTap: () {},
      onChanged: (value) {},
      selectedItemBuilder: (context) => [
        DropdownMenuItem(
          value: 0,
          child: Text('Câmara ${0 + 1}'),
        ),
      ],
      value: 0,
      items: _createTiles(),
    );
  }
}
