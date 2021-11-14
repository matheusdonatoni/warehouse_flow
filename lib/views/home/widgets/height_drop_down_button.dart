import 'package:flutter/material.dart';
import 'package:warehouse_flow/data/models/register.dart';
import '../../../data/models/position.dart';

class HeightDropDownButton extends StatelessWidget {
  const HeightDropDownButton({Key? key}) : super(key: key);

  List<DropdownMenuItem<int>> _createTiles() {
    final _items = <DropdownMenuItem<int>>[];

    for (int i = 0; i < 5; i++) {
      _items.add(
        DropdownMenuItem(
          value: i,
          child: Text('Altura ${i + 1}'),
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
          value: Position(
            height: 1,
            depth: 1,
            type: "Embalagens",
            register: Register(),
          ),
          child: Text('Altura 1'),
        ),
      ],
      value: 0,
      items: _createTiles(),
    );
  }
}
