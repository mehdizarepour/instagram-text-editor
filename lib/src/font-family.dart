import 'package:flutter/material.dart';

class FontFamily extends StatefulWidget {
  final String font;
  final ValueChanged<String> onFontFamilyChanged;

  FontFamily({this.font, this.onFontFamilyChanged});

  @override
  _FontFamilyState createState() => _FontFamilyState();
}

class _FontFamilyState extends State<FontFamily> {
  int _currentFontIndex;
  final List<String> fonts = [
    'OpenSans',
    'Billabong',
    'ChunkFive',
    'AlexBrush',
    'Lobster',
    'Allura',
    'Arizonia',
    'GrandHotel',
    'GreatVibes',
    'OstrichSans',
    'Oswald',
    'Pacifico',
    'Quicksand',
    'Roboto',
    'SEASRN',
    'SourceSans',
    'Windsong',
  ];

  @override
  void initState() {
    _currentFontIndex =
        fonts.indexOf(widget.font) < 0 ? 0 : fonts.indexOf(widget.font);

    super.initState();
  }

  void _fontChangeHandler() {
    setState(() {
      _currentFontIndex++;

      if (_currentFontIndex >= fonts.length) {
        _currentFontIndex = 0;
      }

      widget.onFontFamilyChanged(fonts[_currentFontIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _fontChangeHandler,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          fonts[_currentFontIndex],
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
