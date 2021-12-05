import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class DecimalFormatter extends TextInputFormatter {
  final int decimalDigits;

  DecimalFormatter({this.decimalDigits = 2}) : assert(decimalDigits >= 0);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.length > 1 &&
        newValue.text[newValue.text.length - 1] == '.') {
      newValue = newValue.copyWith(
        text: newValue.text.substring(0, newValue.text.length - 1) + ',',
      );
    }

    String newText;

    if (decimalDigits == 0) {
      newText = newValue.text.replaceAll(RegExp('[^0-9]'), '');
    } else {
      newText = newValue.text.replaceAll(RegExp('[^0-9\,]'), '');
    }

    if (newText.contains(',')) {
      if (newText.trim() == ',') {
        return newValue.copyWith(
          text: '0,',
          selection: TextSelection.collapsed(offset: 2),
        );
      } else if ((newText.split(",").length > 2) ||
          (newText.split(",")[1].length > this.decimalDigits)) {
        return oldValue;
      } else {
        newText = newValue.text.replaceAll(RegExp('[^0-9\.,]'), '');

        return newValue.copyWith(
          text: newText,
          selection: TextSelection.collapsed(offset: newText.length),
        );
      }
    }

    //in case if input is empty or zero
    if (newText.trim() == '' || newText.trim() == '0') {
      if (decimalDigits > 0 &&
          oldValue.text != '0,' &&
          oldValue.text.length < newValue.text.length) {
        return newValue.copyWith(
          text: '0,',
          selection: TextSelection.collapsed(offset: 2),
        );
      }

      return newValue.copyWith(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    } else if (int.parse(newText) < 1) {
      return newValue.copyWith(text: '');
    }

    double newDouble = double.parse(newText);

    var selectionIndexFromTheRight =
        newValue.text.length - newValue.selection.end;

    String newString = NumberFormat("#,##0.##", 'pt-br').format(newDouble);

    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(
        offset: newString.length - selectionIndexFromTheRight,
      ),
    );
  }
}
