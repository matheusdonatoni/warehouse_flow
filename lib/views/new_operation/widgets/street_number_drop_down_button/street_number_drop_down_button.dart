import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bloc.dart';

class StreetNumberDropDownButton
    extends GetWidget<StreetNumberDropDownButtonBloc> {
  const StreetNumberDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButtonFormField<int>(
        onChanged: (value) => controller.street?.number = value,
        value: controller.street?.number,
        hint: Text('Selecione o número'),
        items: controller.streetNumbers
            .map(
              (number) => DropdownMenuItem(
                value: number,
                child: Text('Número $number'),
              ),
            )
            .toList(),
      ),
    );
  }
}
