import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:text_editor/src/text_style_model.dart';

enum FontOptionStatus { colorPalette, fontFamily }

class FontFamilyModel {
  final String font;
  bool isSelected = false;

  FontFamilyModel(this.font, this.isSelected);
}

class FontOptionModel extends ChangeNotifier {
  final TextStyleModel textStyleModel;
  FontOptionStatus status = FontOptionStatus.fontFamily;

  // Font family options
  List<FontFamilyModel> fonts;
  String selectedFont;

  // Font color options
  List<Color> colors;
  Color pickedColor;

  FontOptionModel(this.textStyleModel, List<String> fonts, {this.colors}) {
    // Set default selected font
    selectedFont =
        selectedFont == null ? fonts[0] : textStyleModel.textStyle.fontFamily;

    // Map fonts to fontFamilyModel
    this.fonts = fonts
        .map((font) =>
            FontFamilyModel(font, font == textStyleModel.textStyle.fontFamily))
        .toList();

    // Set default colors
    colors = colors == null
        ? [
            Colors.black,
            Colors.white,
            Color(int.parse('0xffEA2027')),
            Color(int.parse('0xff006266')),
            Color(int.parse('0xff1B1464')),
            Color(int.parse('0xff5758BB')),
            Color(int.parse('0xff6F1E51')),
            Color(int.parse('0xffB53471')),
            Color(int.parse('0xffEE5A24')),
            Color(int.parse('0xff009432')),
            Color(int.parse('0xff0652DD')),
            Color(int.parse('0xff9980FA')),
            Color(int.parse('0xff833471')),
            Color(int.parse('0xff112CBC4')),
            Color(int.parse('0xffFDA7DF')),
            Color(int.parse('0xffED4C67')),
            Color(int.parse('0xffF79F1F')),
            Color(int.parse('0xffA3CB38')),
            Color(int.parse('0xff1289A7')),
            Color(int.parse('0xffD980FA'))
          ]
        : colors;

    // Set default picked color
    pickedColor = textStyleModel.textStyle?.color == null
        ? colors[0]
        : textStyleModel.textStyle.color;
  }

  void selectFontFamily(String value) {
    textStyleModel.changeFontFamily(value);

    // Set new selected font
    fonts = fonts
        .map<FontFamilyModel>((fontModel) =>
            FontFamilyModel(fontModel.font, fontModel.font == value))
        .toList();

    notifyListeners();
  }

  void pickColor(Color value) {
    // Set new text color
    textStyleModel.editTextColor(value);

    // Update picked color
    pickedColor = value;
  }

  void changeFontOptionStatus(FontOptionStatus value) {
    status = value == FontOptionStatus.fontFamily
        ? FontOptionStatus.colorPalette
        : FontOptionStatus.fontFamily;

    notifyListeners();
  }
}
