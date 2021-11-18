import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bloc.dart';

class DepthDropDownButton extends GetView<PositionDepthDropDownButtonBloc> {
  const DepthDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PositionDepthDropDownButtonBloc());

    return Obx(
      () => DropdownButtonFormField<int>(
        validator: controller.validator,
        onChanged: controller.onChanged,
        value: controller.position.depth,
        items: controller.depths
            .map(
              (depth) => DropdownMenuItem(
                value: depth,
                child: Text('Profundidade $depth'),
              ),
            )
            .toList(),
      ),
    );
  }
}
