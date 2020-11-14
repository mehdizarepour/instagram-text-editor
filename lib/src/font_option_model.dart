import 'package:flutter/foundation.dart';
import 'package:text_editor/src/text_style_model.dart';

enum FontOptionStatus { colorPalette, fontFamily }

class FontOptionModel extends ChangeNotifier {
  final TextStyleModel textStyleModel;
  final List<String> fonts;
  FontOptionStatus status = FontOptionStatus.fontFamily;

  FontOptionModel(this.textStyleModel, this.fonts);

  void selectFontFamily(String value) => textStyleModel.changeFontFamily(value);

  void changeFontOptionStatus(FontOptionStatus value) {
    status = value == FontOptionStatus.fontFamily
        ? FontOptionStatus.colorPalette
        : FontOptionStatus.fontFamily;

    notifyListeners();
  }
}
