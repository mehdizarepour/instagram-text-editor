import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_editor/src/text_style_model.dart';

class TextAlignment extends StatelessWidget {
  void _onChangeAlignment(TextStyleModel textStyleModel) {
    switch (textStyleModel.textAlign) {
      case TextAlign.left:
        textStyleModel.editTextAlinment(TextAlign.center);
        break;
      case TextAlign.center:
        textStyleModel.editTextAlinment(TextAlign.right);
        break;
      default:
        textStyleModel.editTextAlinment(TextAlign.left);
    }
  }

  IconData _mapTextAlignToIcon(TextAlign align) {
    switch (align) {
      case TextAlign.left:
        return Icons.format_align_left;
      case TextAlign.center:
        return Icons.format_align_center;
      default:
        return Icons.format_align_right;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TextStyleModel>(
      builder: (context, model, child) => GestureDetector(
        onTapUp: (_) => _onChangeAlignment(model),
        child: Icon(_mapTextAlignToIcon(model.textAlign), color: Colors.white),
      ),
    );
  }
}
