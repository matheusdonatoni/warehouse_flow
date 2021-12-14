import 'package:flutter/material.dart';
import '../../data/models/spot.dart';
import '../../data/models/address.dart';
import '/views/widgets/info_dialog.dart';

import 'package:get/get.dart';

import '../_impl/base_getx_controller_impl.dart';
import '/controllers/home_controllers/home_controller.dart';

import '/data/models/warehouse.dart';
import '/data/models/position.dart';
import '/data/models/operation.dart';
import '/data/models/product.dart';
import '/data/models/register.dart';
import '/data/models/product_resume.dart';
import '/data/repositories/operation_repository.dart';

class NewOperationController extends BaseGetxControllerImpl {
  OperationRepository get _repo => Get.find();
  HomeController get _homeController => Get.find();
  Warehouse get warehouse => _homeController.warehouse;

  final formKey = GlobalKey<FormState>();

  final _operation = Rx<Operation>(Operation());
  Operation get operation => _operation.value;
  set operation(Operation val) => _operation.value = val;

  final spot = Rx<Spot>(Spot());
  final address = Rx<Address>(Address());
  final position = Rx<Position>(Position());
  final product = Rx<Product>(Product());

  Position get _position => operation.position;
  Product get _product => operation.product;

  Register get register => warehouse.register;

  ProductResume get resume => register
      .resumesWhere((operation) =>
          operation.product.id == _product.id &&
          operation.position.id == _position.id)
      .single;

  Future<void> create() async {
    operation = await _repo.create(operation, register);

    register.operations.insert(0, operation);

    print(register.rx.operations.hashCode);
  }

  void callNoProductDialog() {
    Get.dialog(
      InfoDialog(
        title: 'Operação negada',
        message: 'Não é possível realizar a '
            'remoção do produto ${_product.code}, '
            'pois ele não existe nesta posição.',
      ),
    );
  }

  void callLimitDialog() {
    Get.dialog(
      InfoDialog(
        title: 'Operação negada',
        message: 'Não é possível realizar a '
            'remoção de ${operation.amount} ${_product.unit} '
            'do produto ${_product.code}, '
            'existem apenas ${resume.amount} nesta posição.',
      ),
    );
  }

  Future<void> addOperation() async {
    if (formKey.currentState!.validate()) {
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

  void updateOperation(dynamic value) {
    if (value is Spot) {
      operation.spot = value;
    } else if (value is Address) {
      operation.address = value;
    } else if (value is Position) {
      operation.position = value;
    } else if (value is Product) {
      operation.product = value;
    }
  }

  @override
  void onInit() {
    super.onInit();

    everAll(
      [spot, address, position, product],
      updateOperation,
    );
  }
}
