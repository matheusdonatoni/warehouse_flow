import 'package:get/get.dart';

class TableViewModel {
  final columnFilters = RxList<ColumnFilter>();

  TableViewModel({
    List<ColumnFilter>? columnFilters,
  }) {
    this.columnFilters.assignAll(columnFilters ?? []);
  }
}

class TableFilter {
  final columnFilters = RxList<ColumnFilter>();

  TableFilter({
    List<ColumnFilter>? columnFilters,
  }) {
    this.columnFilters.assignAll(columnFilters ?? []);
  }

  void reset() => columnFilters.forEach((e) => e.reset());
}

class ColumnFilter {
  final options = RxList<BooleanFilter>();
  final String label;

  ColumnFilter(
    this.label, {
    required Iterable<BooleanFilter> options,
  }) {
    this.options.assignAll(options.toSet());
  }

  void reset() => options.forEach((e) => e.reset());
}

class BooleanFilter extends OptionFilter<bool> {
  final _value = Rx<bool>(true);
  late final void Function(bool? value) onChanged;

  bool get value => _value.value;
  set value(bool val) => _value.value = val;

  late final String label;

  BooleanFilter(
    String? label, {
    bool? value,
    required void Function(bool? value) onChanged,
  }) {
    this.label = label ?? '';
    this.value = value ?? this.value;
    this.onChanged = (bool? value) {
      onChanged(value);

      _value.toggle();
    };
  }

  void reset() => value = true;

  @override
  bool get isFiltering => !value;

  @override
  bool operator ==(Object other) {
    return other is BooleanFilter &&
        other.label == label &&
        other.value == value;
  }

  @override
  int get hashCode => label.hashCode ^ value.hashCode;

  @override
  String toString() => label;
}

abstract class OptionFilter<T> {
  late T value;

  void reset();

  bool get isFiltering;
}
