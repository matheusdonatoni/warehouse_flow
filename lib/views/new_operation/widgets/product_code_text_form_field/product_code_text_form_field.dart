import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bloc.dart';

class ProductCodeTextFormField extends GetView<ProductCodeTextFormFieldBloc> {
  const ProductCodeTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProductCodeTextFormFieldBloc());

    return Obx(
      () => TextFormField(
        focusNode: controller.focusNode,
        validator: controller.validator,
        readOnly: controller.readOnly,
        controller: controller.textController,
        keyboardType: TextInputType.number,
        onFieldSubmitted: controller.onSubmitted,
        decoration: InputDecoration(
          hintText: 'Código',
        ),
      ),
    );
  }
}
