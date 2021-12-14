import 'package:intl/intl.dart';

String dataCellFormater(dynamic value) {
  if (value is num) {
    if (value is int || value == value.roundToDouble()) {
      return NumberFormat("#,##0", 'pt-br').format(value);
    }

    return NumberFormat("#,##0.00", 'pt-br').format(value);
  }

  return value.toString();
}
