import 'package:flutter/material.dart';

class OperationRadios extends StatelessWidget {
  const OperationRadios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Operação',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        SizedBox(
          height: 12.0,
        ),
        Row(
          children: [
            Flexible(
              child: RadioListTile(
                title: Text('Inserir'),
                value: 0,
                groupValue: 0,
                onChanged: (val) {},
              ),
            ),
            SizedBox(
              width: 24.0,
            ),
            Flexible(
              child: RadioListTile(
                title: Text('Remover'),
                value: 1,
                groupValue: 0,
                onChanged: (val) {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
