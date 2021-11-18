import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bloc.dart';

class StreetNameDropDownButton extends GetView<StreetNameDropDownButtonBloc> {
  const StreetNameDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => StreetNameDropDownButtonBloc());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text("Rua"),
          contentPadding: EdgeInsets.zero,
        ),
        SizedBox(
          height: 12.0,
        ),
        Obx(
          () => DropdownButtonFormField<String>(
            validator: controller.validator,
            onChanged: controller.onChanged,
            value: controller.street.name,
            hint: Text('Selecionar rua'),
            items: controller.names
                .map(
                  (name) => DropdownMenuItem(
                    value: name,
                    child: Text('Rua $name'),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
