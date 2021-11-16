import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bloc.dart';

class StreetNameDropDownButton extends GetWidget<StreetNameDropDownButtonBloc> {
  const StreetNameDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            onChanged: controller.onChanged,
            value: controller.street?.name,
            hint: Text('Selecionar rua'),
            items: controller.streetNames
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
