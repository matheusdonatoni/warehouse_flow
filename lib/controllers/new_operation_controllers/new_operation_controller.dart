import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../views/widgets/info_dialog.dart';

import '/controllers/home_controllers/home_controller.dart';
import '../_impl/base_getx_controller_impl.dart';

import '/data/models/warehouse.dart';
import '/data/models/chamber.dart';
import '/data/models/street.dart';
import '/data/models/position.dart';
import '/data/models/operation.dart';
import '/data/models/product.dart';
import '/data/models/register.dart';
import '/data/repositories/operation_repository.dart';

class NewOperationController extends BaseGetxControllerImpl {
  OperationRepository get _repo => Get.find();
  HomeController get _homeController => Get.find();
  Warehouse get warehouse => _homeController.warehouse;

  final formKey = GlobalKey<FormState>();

  final chamber = Chamber().obs;
  final street = Street().obs;
  final position = Position().obs;
  final product = Product().obs;
  final operation = Operation().obs;

  Rx<Register> get register => warehouse.chambers
      .singleWhere((e) => e.id == chamber().id)
      .streets
      .singleWhere((e) => e.id == street().id)
      .positions
      .singleWhere((e) => e.id == position().id)
      .rx
      .register;

  Future<void> create() async {
    operation(
      await _repo.create(operation(), register()),
    );

    register().operations.add(operation());
  }

  void registerOperation() async {
    if (formKey.currentState!.validate()) {
      if (operation().type == OperationType.insert) {
        try {
          await create();

          Get.back();
        } catch (e) {
          print(e);
        }
      } else {
        try {
          final resume = register().productResumes.singleWhere(
                (e) => e.product.id == product().id,
              );

          if (resume.amount - operation().amount >= 0) {
            try {
              await create();

              Get.back();
            } catch (e) {
              print(e);
            }
          } else {
            Get.dialog(
              InfoDialog(
                title: 'Operação negada',
                message: 'Não é possível realizar a '
                    'remoção de ${operation().amount} '
                    'do produto ${product().code}, '
                    'existem apenas ${resume.amount} nesta posição.',
              ),
            );
          }
        } catch (e) {
          Get.dialog(
            InfoDialog(
              title: 'Operação negada',
              message: 'Não é possível realizar a '
                  'remoção do produto ${product().code}, '
                  'pois ele não existe nesta posição.',
            ),
          );
        }
      }
    }
  }
}
