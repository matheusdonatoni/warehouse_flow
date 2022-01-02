import 'package:get/get.dart';

mixin LoadingManager on GetxController {
  final _isLoading = Rx<bool>(false);
  Stream<bool> get isLoadingStream => _isLoading.stream;
  set isLoading(bool value) => _isLoading(value);
  void loading() => _isLoading(true);
  void done() => _isLoading(false);
}
