# TextEditor

[![Version](https://img.shields.io/pub/v/text_editor.svg)](https://pub.dev/packages/text_style_editor)
![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)

An instagram like text editor widget for flutter

**Show some ❤️ and star the repo to support the project**

## Features

- Edit `TextStyle` object
  - font color
  - font family
  - font size
- Edit `TextAlign`


## Screenshot

![text_editor](https://user-images.githubusercontent.com/8446770/99151584-983af680-26b1-11eb-929e-f49df5c69bb2.gif)

## Installation

Add `text_editor: ^0.4.0` to your `pubspec.yaml` dependencies. And import it:

```dart
import 'package:texte_editor/text_editor.dart';
```

## How to use

Simply create a `TextEditor` widget, and pass the required params:

```dart
TextEditor(
  fonts: fonts,
  paletteColors: colors,
  text: text,
  textStyle: textStyle,
  textAlingment: textAlign,
  onEditCompleted: (style, align, text) {
    setState(() {
      _text = text;
      _textStyle = style;
      _textAlign = align;
    });
  },
)
```

### Customize editor

If you need to customize the editor's design, you can use `decoration` and customize its items.

```diff
TextEditor(
  fonts: fonts,
  text: text,
  textStyle: textStyle,
  textAlingment: textAlign,
  decoration: EditorDecoration(
    doneButton: Icon(Icons.close, color: Colors.white),
    fontFamily: Icon(Icons.title, color: Colors.white),
    colorPalette: Icon(Icons.palette, color: Colors.white),
    alignment: AlignmentDecoration(
      left: Text(
        'left',
        style: TextStyle(color: Colors.white),
      ),
      center: Text(
        'center',
        style: TextStyle(color: Colors.white),
      ),
      right: Text(
        'right',
        style: TextStyle(color: Colors.white),
      ),
    ),
  ),
),
```

**For more information see [examples](https://github.com/mehdizarepour/text_editor/blob/master/example/lib/main.dart)**

# MIT License

```
Copyright (c) 2020 Mehdi Zarepour

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
