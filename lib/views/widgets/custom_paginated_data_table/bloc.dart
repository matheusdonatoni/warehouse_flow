import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/utils/data_cell_formater.dart';
import '../../../data/models/_impl/base_model.dart';
import '../../../data/utils/table_source.dart';

class CustomDataTableBloc<T extends BaseModel> extends GetxController {
  late final RxList<T> _data;
  late final TableSource source;

  final _sortColumnIndex = Rxn<int>();
  final _sortAscending = Rx<bool>(true);
  final _query = Rx<String>('');

  int? get sortColumnIndex => _sortColumnIndex.value;
  bool get sortAscending => _sortAscending.value;
  String get query => _query.value.toLowerCase();

  List<Map<String, dynamic>> get dataAsMaps => List.from(
        _data.map(
          (model) => model.toDataTable(),
        ),
      );

  CustomDataTableBloc(this._data);

  List<Map<String, dynamic>> get filteredData {
    if (query.isEmpty) return dataAsMaps;

    return List.from(
      dataAsMaps.where(
        (element) => element.keys.any(
          (key) => dataCellFormater(element[key]).toLowerCase().contains(query),
        ),
      ),
    );
  }

  String get dataAsJson => json.encode(filteredData);

  void filter(String query) => _query(query);

  List<DataColumn> get columns {
    return List<DataColumn>.from(
      dataAsMaps.first.keys.map(
        (e) => DataColumn(
          label: Text(e),
          numeric: dataAsMaps.first[e] is num,
          onSort: onSort,
        ),
      ),
    );
  }

  void onSort(int index, bool ascending) {
    source.onSort(index, ascending);

    _sortColumnIndex(index);
    _sortAscending(ascending);
  }

  void syncSource() {
    everAll(
      [_data, _query],
      (_) => updateSource(),
    );
  }

  updateSource() {
    source.updateData(filteredData);

    if (sortColumnIndex != null) source.onSort(sortColumnIndex!, sortAscending);
  }

  @override
  void onInit() {
    super.onInit();

    source = TableSource(filteredData);

    syncSource();
  }
}
