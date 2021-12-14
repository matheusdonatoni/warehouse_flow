import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';

import '_impl/base_model.dart';
import 'product.dart';

class RxProductResume {
  final product = Rx<Product>(Product());
  final amount = Rx<double>(0.0);
}

class ProductResume extends BaseModel {
  ProductResume({
    required Product product,
    required double amount,
  }) {
    this.product = product;
    this.amount = amount;
  }

  final rx = RxProductResume();

  int? get id => product.id;

  Product get product => rx.product.value;
  set product(Product value) => rx.product.value = value;

  double get amount => rx.amount.value;
  set amount(double value) => rx.amount.value = value;

  String get formatedAmount => NumberFormat("#,##0.##", 'pt-br').format(
        amount,
      );

  factory ProductResume.fromJson(String str) => ProductResume.fromMap(
        json.decode(str),
      );

  String toJson() => json.encode(toMap());

  factory ProductResume.fromMap(
    Map<String, dynamic> json,
  ) =>
      ProductResume(
        product: Product.fromMap(json["product"] ?? {}),
        amount: json["amount"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "product": product.toMap(),
        "amount": amount,
      };

  Map<String, dynamic> toDataTable() => {
        "Produto": product.code,
        "Descrição": product.description,
        "Consolidado": amount,
      };
}
