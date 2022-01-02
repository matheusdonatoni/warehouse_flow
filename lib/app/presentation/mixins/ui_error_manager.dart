import 'package:get/get.dart';
import '../../ui/helpers/errors/ui_errors.dart';

mixin UiErrorManager on GetxController {
  final _uiError = Rx<UiError?>(null);
  Stream<UiError?> get uiErrorStream => _uiError.stream;
  set uiError(UiError? value) => _uiError.value = value;
}