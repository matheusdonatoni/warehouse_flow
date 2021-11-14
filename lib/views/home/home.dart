import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_flow/controllers/home_controllers/home_controller.dart';
import 'package:warehouse_flow/views/home/widgets/done_button.dart';
import 'package:warehouse_flow/views/home/widgets/product_text_form_field.dart';
import 'package:warehouse_flow/views/home/widgets/street_number_drop_down_button.dart';

import 'widgets/chamber_drop_down_button.dart';
import 'widgets/operation_radios.dart';
import 'widgets/position_drop_down_buttons.dart';
import 'widgets/street_drop_down_button.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(height: 24.0),
            ChamberDropDownButton(),
            SizedBox(height: 24.0),
            StreetDropDownButton(),
            SizedBox(height: 24.0),
            StreetNumberDropDownButton(),
            SizedBox(height: 24.0),
            PositionDropDownButtons(),
            SizedBox(height: 24.0),
            ProductTextFormField(),
            SizedBox(height: 24.0),
            OperationRadios(),
            SizedBox(height: 24.0),
            DoneButton(),
            SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
