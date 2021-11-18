import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bloc.dart';

class ProductTypeTextField extends GetView<ProductTypeTextFieldBloc> {
  const ProductTypeTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProductTypeTextFieldBloc());

    return TextField(
      controller: controller.textController,
      readOnly: true,
      decoration: InputDecoration(
        hintText: 'Tipo',
      ),
    );
  }
}
