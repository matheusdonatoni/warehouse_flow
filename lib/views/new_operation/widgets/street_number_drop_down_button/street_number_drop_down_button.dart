import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bloc.dart';

class StreetNumberDropDownButton
    extends GetView<StreetNumberDropDownButtonBloc> {
  const StreetNumberDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => StreetNumberDropDownButtonBloc());

    return Obx(
      () => DropdownButtonFormField<int>(
        validator: controller.validator,
        onChanged: controller.onChanged,
        value: controller.street.number,
        hint: Text('Selecione o número'),
        items: controller.numbers
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
