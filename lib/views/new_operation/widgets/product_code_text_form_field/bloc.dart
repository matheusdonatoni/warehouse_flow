import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '/controllers/new_operation_controllers/new_operation_controller.dart';
import '/data/repositories/product_repository.dart';
import '/data/models/position.dart';
import '/data/models/product.dart';

class ProductCodeTextFormFieldBloc extends GetxController {
  final textController = TextEditingController();
  final focusNode = FocusNode();

  ProductRepository get _repo => Get.find();

  NewOperationController get _newOperationController => Get.find();

  Rx<Product> get _product => _newOperationController.product;
  Product get product => _product.value;
  set product(Product val) => _product.value = val;

  Rx<Position> get _position => _newOperationController.position;
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
    var parsedCode = parseCode(code);

    if (product.id != null) {
      product = Product(
        code: parsedCode,
      );
    }
  }

  void onEditingComplete() async {
    var parsedCode = parseCode(textController.text);

    if (product.id == null) {
      try {
        product = await _repo.findFromCode(parsedCode);

        focusNode.nextFocus();
      } catch (_) {
        product = Product();

        if (!(Get.isSnackbarOpen ?? true))
          Get.rawSnackbar(
            message: 'Produto não cadastrado',
          );

        focusNode.requestFocus();
      }
    } else {
      focusNode.nextFocus();
    }
  }

  int? parseCode(String? code) {
    if (code == null || code.isEmpty) return null;

    return NumberFormat("#,##0.##", 'pt-br').parse(code).toInt();
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
