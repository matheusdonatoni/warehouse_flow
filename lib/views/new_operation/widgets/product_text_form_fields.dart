import 'package:flutter/material.dart';

import 'operation_amount_text_form_field/operation_amount_text_form_field.dart';
import 'product_code_text_form_field/product_code_text_form_field.dart';
import 'product_description_text_field/product_description_text_field.dart';
import 'product_type_text_field/product_type_text_field.dart';
import 'product_unit_text_field/product_unit_text_field.dart';

class ProductTextFormFields extends StatelessWidget {
  const ProductTextFormFields({Key? key}) : super(key: key);

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
              flex: 5,
              child: ProductCodeTextFormField(),
            ),
            SizedBox(
              width: 12.0,
            ),
            Flexible(
              flex: 5,
              child: ProductAmountTextFormField(),
            ),
            SizedBox(
              width: 12.0,
            ),
            Flexible(
              flex: 4,
              child: ProductUnitTextField(),
            ),
            SizedBox(
              width: 12.0,
            ),
            Flexible(
              flex: 2,
              child: ProductTypeTextField(),
            ),
          ],
        ),
        SizedBox(
          height: 12.0,
        ),
        ProductDescriptionTextField(),
      ],
    );
  }
}
