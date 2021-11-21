import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:warehouse_flow/data/models/product.dart';
import 'package:warehouse_flow/data/models/register.dart';
import '/views/widgets/info_dialog.dart';
import '/data/repositories/operation_repository.dart';
import '/controllers/new_operation_controllers/new_operation_controller.dart';
import '/data/models/operation.dart';

class RegisterButtonBloc extends GetxController {
  OperationRepository get _repo => Get.find();
  NewOperationController get _newOperationController => Get.find();

  GlobalKey<FormState> get _formKey => _newOperationController.formKey;

  Rx<Operation> get _operation => _newOperationController.operation;
  Operation get operation => _operation.value;
  set operation(Operation val) => _operation.value = val;

  Rx<Product> get _product => _newOperationController.product;
  Product get product => _product.value;
  set product(Product val) => _product.value = val;

  Rx<Register> get _register => _newOperationController.register;
  Register get register => _register.value;
  set register(Register val) => _register.value = val;

  get resume => register.productResumes.singleWhere(
        (e) => e.product.id == product.id,
      );

  Future<void> create() async {
    operation = await _repo.create(operation, register);

    register.operations.add(operation);
  }

  void callNoProductDialog() {
    Get.dialog(
      InfoDialog(
        title: 'Operação negada',
        message: 'Não é possível realizar a '
            'remoção do produto ${product.code}, '
            'pois ele não existe nesta posição.',
      ),
    );
  }

  void callLimitDialog() {
    Get.dialog(
      InfoDialog(
        title: 'Operação negada',
        message: 'Não é possível realizar a '
            'remoção de ${operation.amount} '
            'do produto ${product.code}, '
            'existem apenas ${resume.amount} nesta posição.',
      ),
    );
  }

  void registerOperation() async {
    if (_formKey.currentState!.validate()) {
      if (operation.type == OperationType.insert) {
        try {
          await create();

          Get.back();
        } catch (e) {
          print(e);
        }
      } else {
        try {
          if (resume.amount - operation.amount >= 0) {
            try {
              await create();

              Get.back();
            } catch (e) {
              print(e);
            }
          } else {
            callLimitDialog();
          }
        } catch (e) {
          callNoProductDialog();
        }
      }
    }
  }
}
