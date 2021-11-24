import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '/controllers/new_operation_controllers/new_operation_controller.dart';
import '/data/repositories/product_repository.dart';
import '/data/models/position.dart';
import '/data/models/product.dart';

class ProductCodeTextFormFieldBloc extends GetxController {
  final textController = TextEditingController();
  final focusNode = FocusNode();

  ProductRepository get _repo => Get.find();

  NewOperationController get _newOperationController => Get.find();

  Rx<Product> get _product => _newOperationController.operation.rx.product;
  Product get product => _product.value;
  set product(Product val) => _product.value = val;

  Rx<Position> get _position => _newOperationController.operation.rx.position;
  Position get position => _position.value;

  bool get readOnly => position.id == null;

  void _listenRelative() {
    _position.listen((position) {
      if (position.id == null) clearAll();
    });
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digite um código de produto';
    }

    if (product.id == null) {
      return 'Produto não esta cadastrado';
    }

    return null;
  }

  void onChanged(String? code) {
    if (product.id != null) {
      product = Product(code: code);
    }
  }

  void onSubmitted(String? code) async {
    if (code != null &&
        code.isNotEmpty &&
        code != product.code &&
        product.id == null) {
      try {
        product = await _repo.findFromCode(code);
      } catch (_) {
        product = Product();

        Get.rawSnackbar(
          message: 'Produto não cadastrado',
        );
      }
    }
  }

  void clearAll() {
    textController.clear();

    product = Product();
  }

  @override
  void onInit() {
    super.onInit();

    _listenRelative();
  }
}
