import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '/controllers/new_operation_controllers/new_operation_controller.dart';
import '/data/models/product.dart';

class ProductDescriptionTextFieldBloc extends GetxController {
  final textController = TextEditingController();

  NewOperationController get _newOperationController => Get.find();

  Rx<Product> get _product => _newOperationController.operation.rx.product;
  Product get product => _product.value;
  set product(Product val) => _product.value = val;

  void _listenRelative() {
    _product.listen((product) {
      if (product.id == null) {
        textController.clear();
      } else {
        textController.value = TextEditingValue(
          text: product.description ?? '',
        );
      }
    });
  }

  @override
  void onInit() {
    super.onInit();

    _listenRelative();
  }
}
