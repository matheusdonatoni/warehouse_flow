import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/chamber_drop_down_button.dart';
import 'widgets/done_button.dart';
import 'widgets/operation_radios.dart';
import 'widgets/position_drop_down_buttons.dart';
import 'widgets/product_text_form_field.dart';
import 'widgets/street_drop_down_button.dart';
import 'widgets/street_number_drop_down_button.dart';

class NewOperation extends GetView {
  const NewOperation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            ChamberDropDownButton(),
            StreetDropDownButton(),
            StreetNumberDropDownButton(),
            PositionDropDownButtons(),
            ProductTextFormField(),
            OperationRadios(),
            DoneButton(),
            SizedBox(height: 24.0)
          ],
        ),
      ),
    );
  }
}
