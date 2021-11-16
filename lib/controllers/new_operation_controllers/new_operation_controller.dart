import 'package:get/get.dart';

import '/controllers/home_controllers/home_controller.dart';
import '../_impl/base_get_notifier_impl.dart';

import '/data/models/warehouse.dart';
import '/data/models/operation.dart';
import '/data/models/street.dart';
import '/data/models/chamber.dart';

class NewOperationController extends BaseGetNotifierImpl<Operation> {
  NewOperationController(Operation initial) : super(initial);

  HomeController get _homeController => Get.find();
  Warehouse get warehouse => _homeController.state!;

  final chamber = Rxn<Chamber>();
  final street = Rxn<Street>();
}
