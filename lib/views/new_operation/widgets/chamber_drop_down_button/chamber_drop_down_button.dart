import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bloc.dart';

class ChamberDropDownButton extends GetView<ChamberDropDownButtonBloc> {
  const ChamberDropDownButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ChamberDropDownButtonBloc());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text("Câmara"),
          contentPadding: EdgeInsets.zero,
        ),
        Obx(
          () => DropdownButtonFormField<String>(
            validator: controller.validator,
            onChanged: controller.onChanged,
            value: controller.chamber.name,
            hint: Text('Selecionar Câmara'),
            items: controller.names
                .map(
                  (name) => DropdownMenuItem(
                    value: name,
                    child: Text(name),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
