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

  Rx<Product> get _product => _newOperationController.product;
  Product get product => _product.value;
  set product(Product val) => _product.value = val;

  Rx<Position> get _position => _newOperationController.position;
  Position get position => _position.value;
  set position(Position val) => _position.value = val;

  bool get readOnly => position.id == null;

  void _listenRelative() {
    _position.listen((position) {
      if (position.id == null) {
        textController.clear();

        product = Product();
      }
    });
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digite um código de produto';
    }

    if (product.id == null) {
      return 'Este produto não esta cadastrado';
    }

    return null;
  }

  void onSubmitted(String? code) async {
    if (code != product.code) {
      product = await _repo.findFromCode(code);
    }
  }

  @override
  void onInit() {
    super.onInit();

    focusNode.addListener(() {
      print('mundaça de foco');
    });

    _listenRelative();
  }
}
