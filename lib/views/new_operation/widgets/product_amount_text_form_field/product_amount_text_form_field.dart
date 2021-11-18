import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bloc.dart';

class ProductAmountTextFormField
    extends GetView<ProductAmountTextFormFieldBloc> {
  const ProductAmountTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProductAmountTextFormFieldBloc());

    return TextFormField(
      controller: controller.textController,
      validator: controller.validator,
      readOnly: controller.readOnly,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Quantidade',
      ),
    );
  }
}
