import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'product.dart';

class RxProductResume {
  final product = Rx<Product>(Product());
  final amount = Rx<double>(0);
}

class ProductResume {
  ProductResume({
    required Product product,
    required double amount,
  }) {
    this.product = product;
    this.amount = amount;
  }

  final rx = RxProductResume();

  Product get product => rx.product.value;
  set product(Product value) => rx.product.value = value;

  double get amount => rx.amount.value;
  set amount(double value) => rx.amount.value = value;
}
