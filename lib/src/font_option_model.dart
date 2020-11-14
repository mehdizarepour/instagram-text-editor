import 'package:flutter/foundation.dart';
import 'package:text_editor/src/text_style_model.dart';
import 'package:text_editor/src/widget/font_family.dart';

enum FontOptionStatus { colorPalette, fontFamily }

class FontFamilyModel {
  final String font;
  bool isSelected = false;

  FontFamilyModel(this.font, this.isSelected);
}

class FontOptionModel extends ChangeNotifier {
  final TextStyleModel textStyleModel;
  List<FontFamilyModel> fonts;
  String selectedFont;
  FontOptionStatus status = FontOptionStatus.fontFamily;

  FontOptionModel(this.textStyleModel, List<String> fonts) {
    // Set default selected font
    selectedFont =
        selectedFont == null ? fonts[0] : textStyleModel.textStyle.fontFamily;

    // Map fonts to fontFamilyModel
    this.fonts = fonts
        .map((font) =>
            FontFamilyModel(font, font == textStyleModel.textStyle.fontFamily))
        .toList();
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

  void changeFontOptionStatus(FontOptionStatus value) {
    status = value == FontOptionStatus.fontFamily
        ? FontOptionStatus.colorPalette
        : FontOptionStatus.fontFamily;

    notifyListeners();
  }
}
