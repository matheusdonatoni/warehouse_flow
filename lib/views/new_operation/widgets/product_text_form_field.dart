import 'package:flutter/material.dart';

class ProductTextFormField extends StatelessWidget {
  const ProductTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text("Produto"),
          contentPadding: EdgeInsets.zero,
        ),
        Row(
          children: [
            Flexible(
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
