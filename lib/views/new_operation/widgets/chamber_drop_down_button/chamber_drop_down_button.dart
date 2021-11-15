import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/data/models/chamber.dart';
import 'bloc.dart';

class ChamberDropDownButton extends GetWidget<ChamberDropDownButtonBloc> {
  ChamberDropDownButton({
    Key? key,
    this.value,
    this.onChanged,
  }) : super(key: key);

  final Chamber? value;
  final void Function(Chamber?)? onChanged;

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
            onChanged: onChanged,
            value: value,
            hint: Text('Selecionar Câmara'),
            items: controller.chambers
                .map(
                  (chamber) => DropdownMenuItem(
                    value: chamber,
                    child: Text(chamber.name),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
