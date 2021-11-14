import 'package:flutter/material.dart';

import 'depth_drop_down_button.dart';
import 'height_drop_down_button.dart';

class PositionDropDownButtons extends StatelessWidget {
  const PositionDropDownButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Posição',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        SizedBox(
          height: 12.0,
        ),
        Row(
          children: [
            Flexible(child: HeightDropDownButton()),
            SizedBox(
              width: 12.0,
            ),
            Flexible(child: DepthDropDownButton()),
          ],
        )
      ],
    );
  }
}
