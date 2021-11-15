import 'package:get/get.dart';
import '../impl/base_get_notifier_impl.dart';
import '../../routes/routes.dart';

class HomeController extends BaseGetNotifierImpl<int> {
  HomeController(int initial) : super(initial);

  void pushNewOperationPage() {
    Get.toNamed(Routes.NEW_OPERATION);
  }
}
