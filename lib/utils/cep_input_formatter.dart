import 'package:flutter/services.dart';

class CepInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    try {
      if (newValue.text.isEmpty) {
        return newValue;
      }

      String text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

      if (text.length > 8) {
        text = text.substring(0, 8);
      }

      final StringBuffer newText = StringBuffer();
      if (text.isNotEmpty) {
        newText.write(text.substring(0, 5));
      }

      if (text.length > 5) {
        newText.write('-${text.substring(5)}');
      }

      return TextEditingValue(
        text: newText.toString(),
        selection: TextSelection.collapsed(offset: newText.length),
      );
    } catch (e) {
      return newValue;
    }
  }
}
