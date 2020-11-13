import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TetxStyleModel extends ChangeNotifier {
  String text;
  TextStyle textStyle;
  TextAlign textAlign;

  TetxStyleModel(this.text, this.textStyle, this.textAlign);

  void editText(String value) {
    this.text = value;

    notifyListeners();
  }

  void editTextAlinment(TextAlign value) {
    this.textAlign = value;

    notifyListeners();
  }
}
