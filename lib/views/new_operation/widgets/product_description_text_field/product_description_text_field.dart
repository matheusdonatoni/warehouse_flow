import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bloc.dart';

class ProductDescriptionTextField
    extends GetView<ProductDescriptionTextFieldBloc> {
  const ProductDescriptionTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProductDescriptionTextFieldBloc());

    return TextField(
      controller: controller.textController,
      readOnly: true,
      decoration: InputDecoration(
        hintText: 'Descrição',
      ),
    );
  }
}
