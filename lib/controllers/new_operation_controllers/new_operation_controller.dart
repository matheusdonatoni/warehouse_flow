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
import '/data/models/register.dart';

class NewOperationController extends BaseGetxControllerImpl {
  HomeController get _homeController => Get.find();
  Warehouse get warehouse => _homeController.warehouse;

  final formKey = GlobalKey<FormState>();

  final chamber = Chamber().obs;
  final street = Street().obs;
  final position = Position().obs;
  final operation = Operation().obs;
  final product = Product().obs;

  Rx<Register> get register => warehouse.chambers
      .singleWhere((e) => e.id == chamber().id)
      .streets
      .singleWhere((e) => e.id == street().id)
      .positions
      .singleWhere((e) => e.id == position().id)
      .rx
      .register;
}
