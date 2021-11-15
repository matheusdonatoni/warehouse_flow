import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/controllers/new_operation_controllers/new_operation_controller.dart';

import 'widgets/chamber_drop_down_button/chamber_drop_down_button.dart';
import 'widgets/register_button.dart';
import 'widgets/operation_radios.dart';
import 'widgets/position_drop_down_buttons.dart';
import 'widgets/product_text_form_field.dart';
import 'widgets/street_drop_down_button.dart';
import 'widgets/street_number_drop_down_button.dart';

class NewOperationPage extends GetResponsiveView<NewOperationController> {
  NewOperationPage({Key? key}) : super(key: key);

  @override
  Widget? phone() => _build(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: _form,
        ),
      );

  @override
  Widget? desktop() => _build(
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: 600.0,
            child: _form,
          ),
        ),
      );

  Widget _build({required Widget child}) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova operação'),
      ),
      body: SingleChildScrollView(
        child: child,
      ),
    );
  }

  Widget get _form => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ChamberDropDownButton(
            value: controller.chamber,
            onChanged: (chamber) => controller.chamber = chamber,
          ),
          StreetDropDownButton(),
          StreetNumberDropDownButton(),
          PositionDropDownButtons(),
          ProductTextFormField(),
          OperationRadios(),
          SizedBox(height: 24.0),
          RegisterButton(),
          SizedBox(height: 24.0)
        ],
      );
}
