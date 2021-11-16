import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/data/models/chamber.dart';
import 'bloc.dart';

class ChamberDropDownButton extends GetWidget<ChamberDropDownButtonBloc> {
  ChamberDropDownButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text("Câmara"),
          contentPadding: EdgeInsets.zero,
        ),
        Obx(
          () => DropdownButtonFormField<Chamber>(
            onChanged: controller.onChanged,
            value: controller.chamber,
            hint: Text('Selecionar Câmara'),
            items: controller.chambers
                .map(
                  (chamber) => DropdownMenuItem(
                    value: chamber,
                    child: Text(chamber.name ?? ''),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
