import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'widget/text_background_color.dart';

class TextStyleModel extends ChangeNotifier {
  String text;
  TextStyle? textStyle;
  TextAlign? textAlign;

  TextStyleModel(
    this.text, {
    this.textAlign,
    this.textStyle,
  }) {
    textStyle = textStyle ?? TextStyle(fontSize: 10);
    textAlign = textAlign ?? TextAlign.center;
  }

  void editTextAlinment(TextAlign value) {
    this.textAlign = value;

    notifyListeners();
  }

  void editTextColor(Color value) {
    this.textStyle = this.textStyle!.copyWith(color: value);

    notifyListeners();
  }

  void editTextBackgroundColor(TextBackgroundColorStatus _status) {
    switch (_status) {
      case TextBackgroundColorStatus.none:
        this.textStyle = this.textStyle!.copyWith(
            backgroundColor: Colors.transparent,
            color: this.textStyle?.backgroundColor);
        break;
      case TextBackgroundColorStatus.enable:
        this.textStyle = this.textStyle!.copyWith(
            backgroundColor: this.textStyle?.color == Colors.white
                ? Colors.black
                : Colors.white,
            color: this.textStyle?.color);
        break;
      case TextBackgroundColorStatus.exchange:
        this.textStyle = this.textStyle!.copyWith(
            backgroundColor: this.textStyle?.color,
            color: this.textStyle?.color == Colors.black
                ? Colors.white
                : Colors.black);
        break;
    }
    notifyListeners();
  }

  void editFontSize(double value) {
    this.textStyle = this.textStyle!.copyWith(fontSize: value);

    notifyListeners();
  }

  void changeFontFamily(String value) {
    this.textStyle = this.textStyle!.copyWith(fontFamily: value);

    notifyListeners();
  }
}
