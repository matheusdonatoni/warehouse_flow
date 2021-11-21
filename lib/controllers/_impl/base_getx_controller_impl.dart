import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseGetxControllerImpl extends GetxController {
  final _status = Rx<RxStatus>(RxStatus.loading());
  RxStatus get status => _status.value;
  set status(RxStatus val) => _status.value = val;
}

extension StateExt on BaseGetxControllerImpl {
  Widget obx(
    Widget Function() widget, {
    Widget Function(String? error)? onError,
    Widget? onLoading,
    Widget? onEmpty,
  }) {
    return Obx(() {
      if (status.isLoading) {
        return onLoading ?? const Center(child: CircularProgressIndicator());
      } else if (status.isError) {
        return onError != null
            ? onError(status.errorMessage)
            : Center(child: Text('A error occurred: ${status.errorMessage}'));
      } else if (status.isEmpty) {
        return onEmpty != null ? onEmpty : const SizedBox.shrink();
      }
      return widget();
    });
  }

  Widget simpleObx(Widget Function() widget) {
    return obx(
      widget,
      onEmpty: const SizedBox.shrink(),
      onLoading: const SizedBox.shrink(),
      onError: (_) => const SizedBox.shrink(),
    );
  }
}
