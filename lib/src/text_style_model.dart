import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:text_editor/src/text_background_status.dart';

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

  void editTextBackgroundColor() {
    switch (TextBackgroundStatus.status) {
      case TextBackgroundColorStatus.none:
        this.textStyle = this.textStyle!.copyWith(
            backgroundColor: Colors.transparent,
            color: this.textStyle?.backgroundColor != Colors.transparent
                ? this.textStyle?.backgroundColor
                : this.textStyle?.color);
        break;
      case TextBackgroundColorStatus.enable:
        this.textStyle = this.textStyle!.copyWith(
            backgroundColor: this.textStyle?.color == Colors.white
                ? Colors.black
                : (this.textStyle?.color == Colors.black
                    ? Colors.white
                    : lightenColor(this.textStyle?.color)),
            color: this.textStyle?.color);
        break;
      case TextBackgroundColorStatus.exchange:
        this.textStyle = this.textStyle!.copyWith(
            backgroundColor: this.textStyle?.color,
            color: this.textStyle?.color == Colors.black
                ? Colors.white
                : (this.textStyle?.color == Colors.white
                    ? Colors.black
                    : lightenColor(this.textStyle?.color)));
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

  Color lightenColor(Color? color, [double amount = .3]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color!);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
