import 'package:get/get.dart';

abstract class BaseGetNotifierImpl<T> extends GetNotifier<T> {
  BaseGetNotifierImpl(T initial) : super(initial);

  @override
  void onInit() {
    super.onInit();
  }
}
