import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bloc.dart';

class ProductUnitTextField extends GetView<ProductUnitTextFieldBloc> {
  const ProductUnitTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProductUnitTextFieldBloc());

    return TextField(
      controller: controller.textController,
      readOnly: true,
      decoration: InputDecoration(
        hintText: 'Unidade',
      ),
    );
  }
}
