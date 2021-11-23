import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/data/utils/decimal_formatter.dart';
import 'bloc.dart';

class ProductAmountTextFormField
    extends GetView<OperationAmountTextFormFieldBloc> {
  const ProductAmountTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OperationAmountTextFormFieldBloc());

    return Obx(
      () => TextFormField(
        readOnly: controller.readOnly,
        focusNode: controller.focusNode,
        controller: controller.textController,
        validator: controller.validator,
        onChanged: controller.onChanged,
        inputFormatters: [DecimalFormatter(decimalDigits: 5)],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Quantidade',
        ),
      ),
    );
  }
}
