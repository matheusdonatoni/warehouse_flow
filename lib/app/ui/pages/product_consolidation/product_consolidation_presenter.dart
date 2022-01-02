import 'package:flutter/material.dart';

abstract class ProductConsolidationPresenter implements Listenable {
  Future<void> loadData();
}