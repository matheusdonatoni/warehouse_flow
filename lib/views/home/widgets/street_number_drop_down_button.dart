import 'package:flutter/material.dart';
import '../../../data/models/street.dart';

class StreetNumberDropDownButton extends StatelessWidget {
  const StreetNumberDropDownButton({Key? key}) : super(key: key);

  List<DropdownMenuItem<int>> _createTiles() {
    final _items = <DropdownMenuItem<int>>[];

    for (int i = 0; i < 10; i++) {
      _items.add(
        DropdownMenuItem(
          value: i,
          child: Text('Número ${i + 1}'),
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
          value: Street(name: 'A', number: 1),
          child: Text('Número 1'),
        ),
      ],
      value: 0,
      items: _createTiles(),
    );
  }
}
