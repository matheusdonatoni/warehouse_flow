import 'package:flutter/material.dart';
import '../../../data/models/chamber.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text("Câmara"),
          contentPadding: EdgeInsets.zero,
        ),
        DropdownButtonFormField<int>(
          onTap: () {},
          onChanged: (value) {},
          selectedItemBuilder: (context) => [
            DropdownMenuItem(
              value: Chamber(name: ''),
              child: Text('Câmara ${5}'),
            ),
          ],
          value: 0,
          items: _createTiles(),
        ),
      ],
    );
  }
}
