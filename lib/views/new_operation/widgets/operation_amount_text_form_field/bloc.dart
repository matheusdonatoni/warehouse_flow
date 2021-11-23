import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:warehouse_flow/data/models/operation.dart';
import '/data/models/product.dart';
import '/controllers/new_operation_controllers/new_operation_controller.dart';

class OperationAmountTextFormFieldBloc extends GetxController {
  final textController = TextEditingController();
  final focusNode = FocusNode();

  NewOperationController get _newOperationController => Get.find();

  Rx<Product> get _product => _newOperationController.product;
  Product get product => _product.value;

  Rx<Operation> get _operation => _newOperationController.operation;
  Operation get operation => _operation.value;
  set operation(Operation val) => _operation.value = val;

  bool get readOnly => product.id == null;

  void _listenRelative() {
    _product.listen((product) => clearAll());
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digite um código de produto';
    }

    double? parsedValue;

    try {
      parsedValue = operation.amount = NumberFormat(
        "#,##0.##",
        'pt-br',
      ).parse(value).toDouble();
    } catch (e) {
      parsedValue = null;
    }

    if (parsedValue == null) {
      return 'Formato inválido';
    } else if (parsedValue <= 0) {
      return 'Valor inválido';
    }

    return null;
  }

  void onChanged(String? amount) {
    if (amount != null && amount.isNotEmpty) {
      try {
        operation.amount = NumberFormat(
          "#,##0.##",
          'pt-br',
        ).parse(amount).toDouble();
      } catch (e) {
        clearAll();

        Get.rawSnackbar(message: 'Formato numeral inválido');
      }
    }
  }

  void clearAll() {
    textController.clear();

    operation = Operation(
      type: operation.type,
      product: product,
    );
  }

  @override
  void onInit() {
    super.onInit();

    _listenRelative();
  }
}
