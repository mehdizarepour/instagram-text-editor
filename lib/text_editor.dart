library text_editor;

import 'package:flutter/material.dart';
import 'package:text_editor/src/color-palette.dart';
import 'package:text_editor/src/font-family.dart';
import 'package:text_editor/src/font-size.dart';
import 'package:text_editor/src/text-alignment.dart';

class TextEditor extends StatefulWidget {
  @override
  _TextEditorState createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Container(
          color: Colors.black45,
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
                          onTextAlignChanged: (alignment) {},
                        ),
                        // Icon(Icons.font_download),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.center,
                      child: FontFamily(
                        onFontFamilyChanged: (font) {},
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Done',
                        style: TextStyle(color: Colors.white),
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
                        onFontSizeChanged: (fontSize) {},
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Center(
                          child: TextField(
                            autofocus: true,
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
                  onColorChanged: (color) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
