import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bloc.dart';

class ProductAmountTextFormField
    extends GetView<ProductAmountTextFormFieldBloc> {
  const ProductAmountTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProductAmountTextFormFieldBloc());

    return Obx(
      () => TextFormField(
        readOnly: controller.readOnly,
        focusNode: controller.focusNode,
        controller: controller.textController,
        validator: controller.validator,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Quantidade',
        ),
      ),
    );
  }
}
