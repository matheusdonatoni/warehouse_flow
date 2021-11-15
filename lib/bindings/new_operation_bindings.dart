import 'package:get/get.dart';
import '/data/repositories/street_repository.dart';
import '/data/repositories/chamber_repository.dart';
import '/data/models/operation.dart';
import '/views/new_operation/widgets/chamber_drop_down_button/bloc.dart';
import '/controllers/new_operation_controllers/new_operation_controller.dart';

class NewOperationBinding implements Bindings {
  @override
  void dependencies() {
    _injectRepositories();

    _injectWidgetBlocs();

    Get.lazyPut(
      () => NewOperationController(
        Operation(),
      ),
    );
  }

  void _injectRepositories() {
    Get.lazyPut(() => ChamberRepository());
    Get.lazyPut(() => StreetRepository());
  }

  void _injectWidgetBlocs() {
    Get.create(() => ChamberDropDownButtonBloc());
  }
}
