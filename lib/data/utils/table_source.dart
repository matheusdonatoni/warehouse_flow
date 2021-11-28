import 'package:flutter/material.dart';

class TableSource extends DataTableSource {
  late final _rowCount;
  final DataRow Function(int index) rowBuilder;

  TableSource({
    required int rowCount,
    required this.rowBuilder,
  }) {
    _rowCount = rowCount;
  }

  @override
  DataRow? getRow(int index) {
    if (index <= rowCount - 1) return rowBuilder(index);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _rowCount;

  @override
  int get selectedRowCount => 0;
}
