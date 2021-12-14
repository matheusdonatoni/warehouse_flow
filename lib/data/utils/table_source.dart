import 'package:flutter/material.dart';
import 'package:warehouse_flow/data/utils/data_cell_formater.dart';

class TableSource extends DataTableSource {
  TableSource(List<Map<String, dynamic>> data) {
    this.data.addAll(data);
  }

  final data = <Map<String, dynamic>>[];

  void onSort(int index, bool ascending) {
    data.sort((firstMap, secondMap) {
      final key = firstMap.keys.elementAt(index);

      Comparable a = firstMap[key];
      Comparable b = secondMap[key];

      if (ascending) return Comparable.compare(a, b);

      return Comparable.compare(b, a);
    });

    notifyListeners();
  }

  void updateData(List<Map<String, dynamic>> newData) {
    data
      ..clear()
      ..addAll(newData);

    notifyListeners();
  }

  @override
  DataRow? getRow(int index) {
    if (index <= rowCount - 1) {
      return DataRow.byIndex(
        index: index,
        cells: data[index]
            .keys
            .map(
              (e) => DataCell(
                Text(
                  dataCellFormater(data[index][e]),
                ),
              ),
            )
            .toList(),
      );
    }
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
