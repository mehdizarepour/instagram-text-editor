import 'package:flutter/material.dart';

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
    _currentTextAlingment = TextAlign.center;
    _currentIcon = Icons.format_align_center;

    super.initState();
  }

  void _onChangeAlignment() {
    setState(() {
      switch (_currentTextAlingment) {
        case TextAlign.left:
          _currentTextAlingment = TextAlign.center;
          widget.onTextAlignChanged(_currentTextAlingment);
          _currentIcon = Icons.format_align_center;
          break;
        case TextAlign.center:
          _currentTextAlingment = TextAlign.right;
          widget.onTextAlignChanged(_currentTextAlingment);
          _currentIcon = Icons.format_align_right;
          break;
        default:
          _currentTextAlingment = TextAlign.left;
          widget.onTextAlignChanged(_currentTextAlingment);
          _currentIcon = Icons.format_align_left;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (_) => _onChangeAlignment(),
      child: Icon(_currentIcon, color: Colors.white),
    );
  }
}
