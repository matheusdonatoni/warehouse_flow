import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class TableSource<T> extends DataTableSource {
  final RxList<T> data = RxList<T>();
  final List<DataCell> Function(int index) rowBuilder;

  TableSource({
    required List<T> data,
    required this.rowBuilder,
  }) {
    this.data.assignAll(data);
  }

  void sort<K>(Comparable<K> Function(T value) getField, bool ascending) {
    data.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    notifyListeners();
  }

  @override
  DataRow? getRow(int index) {
    if (index <= rowCount - 1)
      return DataRow.byIndex(
        index: index,
        cells: rowBuilder(index),
      );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
