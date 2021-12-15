import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchDialogBloc extends GetxController {
  final String initialValue;
  final textController = TextEditingController();

  SearchDialogBloc(this.initialValue);

  String get text => textController.text;

  void clear() => textController.clear();

  @override
  void onInit() {
    super.onInit();

    textController.text = initialValue;
  }
}
