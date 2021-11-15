import 'package:get/get.dart';
import '../../data/models/warehouse.dart';
import '../_impl/base_get_notifier_impl.dart';
import '../../routes/routes.dart';

class HomeController extends BaseGetNotifierImpl<Warehouse> {
  HomeController(Warehouse initial) : super(initial);

  void pushNewOperationPage() {
    Get.toNamed(Routes.NEW_OPERATION);
  }
}
