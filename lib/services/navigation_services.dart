import 'package:get/get.dart';

class NavigationServices extends GetxService {
  final _index = Rx<int>(0);
  int get index => this._index.value;
  set index(int val) => this._index.value = val;

  
}
