import 'package:flutter/material.dart';

class ProductTextFormField extends StatelessWidget {
  const ProductTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Produto',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        SizedBox(
          height: 12.0,
        ),
        Row(
          children: [
            Flexible(
              flex: 7,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Código',
                ),
              ),
            ),
            SizedBox(
              width: 24.0,
            ),
            Flexible(
              flex: 3,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Quantidade',
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 12.0,
        ),
        TextField(
          readOnly: true,
          decoration: InputDecoration(
            hintText: 'Descrição',
          ),
        ),
      ],
    );
  }
}
