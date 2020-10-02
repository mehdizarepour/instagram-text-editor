library text_editor;

import 'package:flutter/material.dart';
import 'package:text_editor/src/color-palette.dart';
import 'package:text_editor/src/font-family.dart';
import 'package:text_editor/src/font-size.dart';
import 'package:text_editor/src/text-alignment.dart';

/// Instagram like text editor
/// A flutter widget that edit text style and text alignment
///
/// You can pass your text style to the widget
/// and then get the edited text style
class TextEditor extends StatefulWidget {
  /// After edit process completed, [onEditCompleted] callback will be called.
  final void Function(TextStyle, TextAlign, String) onEditCompleted;

  /// [onTextAlignChanged] will be called after [textAlingment] prop has changed
  final ValueChanged<TextAlign> onTextAlignChanged;

  /// [onTextStyleChanged] will be called after [textStyle] prop has changed
  final ValueChanged<TextStyle> onTextStyleChanged;

  /// [onTextChanged] will be called after [text] prop has changed
  final ValueChanged<String> onTextChanged;

  /// The text alignment
  final TextAlign textAlingment;

  /// The text style
  final TextStyle textStyle;

  /// Widget's background color
  final Color backgroundColor;

  // Editor's font families
  final List<String> fonts;

  // Editor's default text
  final String text;

  /// Create a [TextEditor] widget
  ///
  /// [fonts] list of font families that you want to use in editor.
  /// After edit process completed, [onEditCompleted] callback will be called
  /// with new [textStyle], [textAlingment] and [text] value
  TextEditor({
    @required this.fonts,
    @required this.onEditCompleted,
    this.backgroundColor,
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
          color: widget.backgroundColor,
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
                          textAlign: _currentTextAlingment,
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
                          font: _currentTextStyle.fontFamily,
                          fonts: widget.fonts,
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
                        size: _currentTextStyle.fontSize,
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
                  pickedColor: _currentTextStyle.color,
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
