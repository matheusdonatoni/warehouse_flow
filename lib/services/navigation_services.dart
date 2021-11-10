import 'package:get/get.dart';

class NavigationServices extends GetxService {
  final _index = Rx<int>(0);
  int get index => this._index.value;
  set index(int val) => this._index.value = val;

  void onItemTapped(int newIndex) {
    if (newIndex != index) {
      changeTab(newIndex);
    } else {
      popUntilInitialRoute();
    }
  }

  void changeTab(int newIndex) {
    index = newIndex;
  }

  void popUntilInitialRoute() async {
    final maybePop = await Get.nestedKey(index)?.currentState?.maybePop();

    if (maybePop == null || !maybePop) return;

    Get.until((route) => route.isFirst);
  }
}
