import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:warehouse_flow/data/helpers/table_view_model.dart';

mixin FilterableTableMixin<T> {
  final filteredList = <T>[].obs;

  final _tableFilters = Rx<TableFilter>(TableFilter());
  TableFilter get tableFilters => _tableFilters.value;
  set tableFilters(TableFilter val) => _tableFilters.value = val;

  
  void setupFilters();
}
