import 'package:flutter/material.dart';
import '../../../data/models/street.dart';

class StreetDropDownButton extends StatelessWidget {
  const StreetDropDownButton({Key? key}) : super(key: key);

  List<DropdownMenuItem<int>> _createTiles() {
    final _items = <DropdownMenuItem<int>>[];

    for (int i = 0; i < 5; i++) {
      _items.add(
        DropdownMenuItem(
          value: i,
          child: Text('Rua A'),
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
        Text(
          'Rua',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        SizedBox(
          height: 12.0,
        ),
        DropdownButtonFormField<int>(
          onTap: () {},
          onChanged: (value) {},
          selectedItemBuilder: (context) => [
            DropdownMenuItem(
              value: Street(name: 'A', number: 1),
              child: Text('Rua A'),
            ),
          ],
          value: 0,
          items: _createTiles(),
        ),
      ],
    );
  }
}
