library text_editor;

import 'package:flutter/material.dart';
import 'package:text_editor/src/color-palette.dart';
import 'package:text_editor/src/font-family.dart';
import 'package:text_editor/src/text-alignment.dart';

class TextEditor extends StatefulWidget {
  @override
  _TextEditorState createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  double _currentSliderValue = 20;

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
                      child: FontFamily(),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: FlatButton(
                        onPressed: () {},
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
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Slider(
                          value: _currentSliderValue,
                          min: 0,
                          max: 100,
                          divisions: 100,
                          activeColor: Colors.white,
                          inactiveColor: Colors.white,
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue = value;
                            });
                          },
                        ),
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
