library text_editor;

import 'package:flutter/material.dart';
import 'package:text_editor/src/color-palette.dart';
import 'package:text_editor/src/font-family.dart';
import 'package:text_editor/src/font-size.dart';
import 'package:text_editor/src/text-alignment.dart';

class TextEditor extends StatefulWidget {
  final void Function(TextStyle, TextAlign, String) onEditCompleted;
  final ValueChanged<TextAlign> onTextAlignChanged;
  final ValueChanged<TextStyle> onTextStyleChanged;
  final ValueChanged<String> onTextChanged;
  final TextAlign textAlingment;
  final TextStyle textStyle;
  final String text;

  TextEditor({
    @required this.onEditCompleted,
    this.text = '',
    this.textStyle,
    this.textAlingment,
    this.onTextAlignChanged,
    this.onTextStyleChanged,
    this.onTextChanged,
  });

  @override
  _TextEditorState createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  TextAlign _currentTextAlingment;
  TextStyle _currentTextStyle;
  String _text;

  @override
  void initState() {
    _text = widget.text;
    _currentTextAlingment =
        widget.textAlingment == null ? TextAlign.center : widget.textAlingment;
    _currentTextStyle =
        widget.textStyle == null ? TextStyle() : widget.textStyle;

    super.initState();
  }

  void _changeColorHandler(color) {
    setState(() {
      _currentTextStyle = TextStyle(
        color: color,
        fontFamily: _currentTextStyle.fontFamily,
        fontSize: _currentTextStyle.fontSize,
      );
    });
  }

  void _changeFontFamilyHandler(fontFamily) {
    setState(() {
      _currentTextStyle = TextStyle(
        color: _currentTextStyle.color,
        fontFamily: fontFamily,
        fontSize: _currentTextStyle.fontSize,
      );
    });
  }

  void _changeFontSizeHandler(fontSize) {
    setState(() {
      _currentTextStyle = TextStyle(
        color: _currentTextStyle.color,
        fontFamily: _currentTextStyle.fontFamily,
        fontSize: fontSize,
      );
    });
  }

  void _changeTextAlignmentHandler(alignment) {
    setState(() {
      _currentTextAlingment = alignment;
    });
  }

  void _changeTextHandler(value) {
    _text = value;

    widget.onTextChanged(_text);
  }

  void _editCompleteHandler() {
    widget.onEditCompleted(_currentTextStyle, _currentTextAlingment, _text);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Container(
          color: Colors.black.withOpacity(0.6),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextAlignment(
                          onTextAlignChanged: _changeTextAlignmentHandler,
                        ),
                        // Icon(Icons.font_download),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Align(
                        child: FontFamily(
                          onFontFamilyChanged: _changeFontFamilyHandler,
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: _editCompleteHandler,
                        child: Text(
                          'Done',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    Container(
                      // color: Colors.blue,
                      child: FontSize(
                        size: 20,
                        onFontSizeChanged: _changeFontSizeHandler,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Center(
                          child: TextField(
                            controller: TextEditingController()..text = _text,
                            onChanged: _changeTextHandler,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            style: _currentTextStyle,
                            textAlign: _currentTextAlingment,
                            autofocus: true,
                            cursorColor: Colors.white,
                            decoration: null,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: ColorPalette(
                  onColorChanged: _changeColorHandler,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
