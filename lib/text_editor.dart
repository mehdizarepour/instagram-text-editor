library text_editor;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_editor/src/text_style_model.dart';
import 'package:text_editor/src/widget/color_palette.dart';
import 'package:text_editor/src/widget/font_family.dart';
import 'package:text_editor/src/widget/font_size.dart';
import 'package:text_editor/src/widget/font_option_container.dart';
import 'package:text_editor/src/widget/font_option_switch.dart';
import 'package:text_editor/src/widget/text_alignment.dart';
import 'package:text_editor/src/widget/text_background_color.dart';

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
  TextStyleModel _textStyleModel;
  TextAlign _currentTextAlingment;
  TextStyle _currentTextStyle;
  String _text;

  @override
  void initState() {
    _textStyleModel = TextStyleModel(
      widget.text,
      widget.textStyle == null ? TextStyle() : widget.textStyle,
      widget.textAlingment == null ? TextAlign.center : widget.textAlingment,
    );

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
    return ChangeNotifierProvider(
      create: (context) => _textStyleModel,
      child: Container(
        padding: EdgeInsets.only(right: 10, left: 10),
        color: widget.backgroundColor,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Container()),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextAlignment(
                        textAlign: _currentTextAlingment,
                        onTextAlignChanged: _changeTextAlignmentHandler,
                      ),
                      SizedBox(width: 20),
                      FontOptionSwitch(),
                      SizedBox(width: 20),
                      TextBackgroundColor(),
                      // FontFamily(
                      //   font: _currentTextStyle.fontFamily,
                      //   fonts: widget.fonts,
                      //   onFontFamilyChanged: _changeFontFamilyHandler,
                      // ),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
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
                    child: FontSize(_currentTextStyle.fontSize),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Consumer<TextStyleModel>(
                          builder: (context, textStyleModel, child) {
                            return TextField(
                              controller: TextEditingController()
                                ..text = textStyleModel.text,
                              onChanged: (value) => textStyleModel.text = value,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              style: textStyleModel.textStyle,
                              textAlign: textStyleModel.textAlign,
                              autofocus: true,
                              cursorColor: Colors.white,
                              decoration: null,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: FontOptionContainer(
                FontOptionContainerStatus.colorPalette,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
