import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bloc.dart';

class HeightDropDownButton extends GetView<PositionHeightDropDownButtonBloc> {
  const HeightDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PositionHeightDropDownButtonBloc());

    return Obx(
      () => DropdownButtonFormField<int>(
        validator: controller.validator,
        onChanged: controller.onChanged,
        value: controller.position.height,
        items: controller.heights
            .map(
              (height) => DropdownMenuItem<int>(
                value: height,
                child: Text('Altura $height'),
              ),
            )
            .toList(),
      ),
    );
  }
}
