import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bloc.dart';

class AddressIndicatorDropDownButton
    extends GetView<AddressIndicatorDropDownButtonBloc> {
  const AddressIndicatorDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AddressIndicatorDropDownButtonBloc());

    return Obx(
      () => DropdownButtonFormField<String>(
        validator: controller.validator,
        onChanged: controller.onChanged,
        value: controller.address.indicator,
        hint: Text('Selecione o número'),
        items: controller.indicators
            .map(
              (indicator) => DropdownMenuItem(
                value: indicator,
                child: Text('Número $indicator'),
              ),
            )
            .toList(),
      ),
    );
  }
}
