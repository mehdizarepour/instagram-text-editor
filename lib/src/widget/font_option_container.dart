import 'package:flutter/material.dart';
import 'package:text_editor/src/widget/color_palette.dart';
import 'package:text_editor/src/widget/font_family.dart';

enum FontOptionContainerStatus { colorPalette, fontFamily }

class FontOptionContainer extends StatelessWidget {
  final FontOptionContainerStatus status;

  FontOptionContainer(this.status);

  @override
  Widget build(BuildContext context) {
    if (status == FontOptionContainerStatus.colorPalette) {
      return ColorPalette(onColorChanged: null);
    }

    return FontFamily(fonts: ['Test'], onFontFamilyChanged: null, font: 'Test');
  }
}
