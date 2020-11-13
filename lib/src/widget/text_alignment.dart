import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_editor/src/text_style_model.dart';

class TextAlignment extends StatefulWidget {
  final TextAlign textAlign;
  final ValueChanged<TextAlign> onTextAlignChanged;

  TextAlignment({
    @required this.onTextAlignChanged,
    this.textAlign,
  });

  @override
  _TextAlignmentState createState() => _TextAlignmentState();
}

class _TextAlignmentState extends State<TextAlignment> {
  IconData _currentIcon;
  TextAlign _currentTextAlingment;

  @override
  void initState() {
    _currentTextAlingment =
        widget.textAlign == null ? TextAlign.center : widget.textAlign;

    switch (_currentTextAlingment) {
      case TextAlign.left:
        _currentIcon = Icons.format_align_left;
        break;
      case TextAlign.right:
        _currentIcon = Icons.format_align_right;
        break;
      default:
        _currentIcon = Icons.format_align_center;
    }

    super.initState();
  }

  void _onChangeAlignment(TetxStyleModel textStyleModel) {
    setState(() {
      switch (textStyleModel.textAlign) {
        case TextAlign.left:
          textStyleModel.editTextAlinment(TextAlign.center);
          _currentIcon = Icons.format_align_center;
          break;
        case TextAlign.center:
          textStyleModel.editTextAlinment(TextAlign.right);
          _currentIcon = Icons.format_align_right;
          break;
        default:
          textStyleModel.editTextAlinment(TextAlign.left);
          _currentIcon = Icons.format_align_left;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TetxStyleModel textStyleModel =
        Provider.of<TetxStyleModel>(context, listen: false);

    return GestureDetector(
      onTapUp: (_) => _onChangeAlignment(textStyleModel),
      child: Icon(_currentIcon, color: Colors.white),
    );
  }
}
