import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '/controllers/home_controllers/home_controller.dart';
import '../_impl/base_getx_controller_impl.dart';

import '/data/models/warehouse.dart';
import '/data/models/chamber.dart';
import '/data/models/street.dart';
import '/data/models/position.dart';
import '/data/models/operation.dart';
import '/data/models/product.dart';

class NewOperationController extends BaseGetxControllerImpl<Rx<Operation>> {
  HomeController get _homeController => Get.find();
  Warehouse? get warehouse => _homeController.state;

  final formKey = GlobalKey<FormState>();

  final chamber = Chamber().obs;
  final street = Street().obs;
  final position = Position().obs;
  final product = Product().obs;

  @override
  void onInit() {
    super.onInit();

    change(
      Rx<Operation>(
        Operation(
          type: OperationType.insert,
        ),
      ),
      status: RxStatus.success(),
    );
  }
}
