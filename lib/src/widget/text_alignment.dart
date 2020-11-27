import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_editor/src/text_style_model.dart';

class TextAlignment extends StatelessWidget {
  final Widget left;
  final Widget center;
  final Widget right;

  TextAlignment({this.left, this.center, this.right});

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

  Widget _mapTextAlignToWidget(TextAlign align) {
    switch (align) {
      case TextAlign.left:
        return left == null
            ? Icon(Icons.format_align_left, color: Colors.white)
            : left;
      case TextAlign.center:
        return center == null
            ? Icon(Icons.format_align_center, color: Colors.white)
            : center;
      default:
        return right == null
            ? Icon(Icons.format_align_right, color: Colors.white)
            : right;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TextStyleModel>(
      builder: (context, model, child) => GestureDetector(
        onTapUp: (_) => _onChangeAlignment(model),
        child: _mapTextAlignToWidget(model.textAlign),
      ),
    );
  }
}
