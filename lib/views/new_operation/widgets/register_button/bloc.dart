import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../data/models/product_resume.dart';
import '/data/models/position.dart';
import '/data/models/product.dart';
import '/data/models/register.dart';
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

  Rx<Position> get _position => _newOperationController.position;
  Position get position => _position.value;

  Register get _register => position.register;

  Register get register => _newOperationController.register;

  ProductResume get resume => _register.resumes.singleWhere(
        (e) => e.product.id == product.id,
      );

  Future<void> create() async {
    operation = await _repo.create(operation, _register);

    _register.operations.assign(operation);

    register.operations.addAll(_register.operations);
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
            'remoção de ${operation.amount} ${product.unit} '
            'do produto ${product.code}, '
            'existem apenas ${resume.amount} nesta posição.',
      ),
    );
  }

  void registerOperation() async {
    if (_formKey.currentState!.validate()) {
      if (operation.type == OperationType.insert) {
        await create();

        Get.back();
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
