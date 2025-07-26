import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gsmpay_interview/core/common/constant/regex.dart';

enum TextFormFieldType { nationalCode, price, normal }

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final String label;
  final AutovalidateMode? autovalidateMode;
  final bool readOnly;
  final GestureTapCallback? onTap;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final TextFormFieldType textFormFieldType;
  final bool required;

  const TextFormFieldWidget({
    super.key,
    required this.controller,
    this.validator,
    required this.label,
    this.autovalidateMode,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
    this.textInputAction,
    this.onFieldSubmitted,
    this.textFormFieldType = TextFormFieldType.normal,
    this.required = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autovalidateMode: autovalidateMode,
      readOnly: readOnly,
      onTap: onTap,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: _getInputFormatters(),
      keyboardType: _getKeyboardType(),
      decoration: InputDecoration(
        labelText: '$label${required ? '*' : ''}',
        suffixIcon: suffixIcon,
      ),
    );
  }

  TextInputType _getKeyboardType() {
    switch (textFormFieldType) {
      case TextFormFieldType.normal:
        return TextInputType.text;
      case TextFormFieldType.nationalCode:
        return TextInputType.number;
      case TextFormFieldType.price:
        return const TextInputType.numberWithOptions(decimal: false, signed: false);
    }
  }

  List<TextInputFormatter>? _getInputFormatters() {
    final List<TextInputFormatter> list = [];
    final maxLength = _getMaxLength();
    if (maxLength != null) {
      list.add(maxLength);
    }
    if (textFormFieldType == TextFormFieldType.nationalCode) {
      list.add(FilteringTextInputFormatter.digitsOnly);
    }
    if (textFormFieldType == TextFormFieldType.price) {
      list.add(FilteringTextInputFormatter.digitsOnly);
      list.add(MoneyInputFormatter());
    }
    return list;
  }

  LengthLimitingTextInputFormatter? _getMaxLength() {
    if (textFormFieldType == TextFormFieldType.nationalCode) {
      return LengthLimitingTextInputFormatter(10);
    }
    if (textFormFieldType == TextFormFieldType.price) {
      return LengthLimitingTextInputFormatter(15);
    }
    return null;
  }
}

class MoneyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll(',', '');

    if (newText.isEmpty || !RegExp(digitOnlyRegex).hasMatch(newText)) {
      return newValue.copyWith(text: '');
    }

    String formatted = _addCommas(newText);

    int selectionIndexFromEnd = newValue.text.length - newValue.selection.end;
    int newOffset = formatted.length - selectionIndexFromEnd;

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(
        offset: newOffset.clamp(0, formatted.length),
      ),
    );
  }

  String _addCommas(String value) {
    final buffer = StringBuffer();
    int length = value.length;

    for (int i = 0; i < length; i++) {
      int position = length - i;
      buffer.write(value[i]);
      if (position > 1 && position % 3 == 1) {
        buffer.write(',');
      }
    }

    return buffer.toString();
  }
}