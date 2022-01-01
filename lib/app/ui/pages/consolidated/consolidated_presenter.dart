import 'package:flutter/material.dart';

abstract class ConsolidatedPresenter implements Listenable {
  Future<void> loadConsolidatedData();
}