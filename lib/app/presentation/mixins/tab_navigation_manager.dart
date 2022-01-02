import 'package:get/get.dart';

mixin TabNavigationManager on GetxController {
  final _changeTabIndexTo = Rx<int?>(null);
  Stream<int?> get changeTabIndexToStream => _changeTabIndexTo.stream;
  set changeTabIndexTo(int value) => _changeTabIndexTo(value);
}
