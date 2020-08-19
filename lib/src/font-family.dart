import 'package:flutter/material.dart';

class FontFamily extends StatefulWidget {
  final String font;
  final List<String> fonts;
  final ValueChanged<String> onFontFamilyChanged;

  FontFamily({
    this.font,
    @required this.onFontFamilyChanged,
    @required this.fonts,
  });

  @override
  _FontFamilyState createState() => _FontFamilyState();
}

class _FontFamilyState extends State<FontFamily> {
  int _currentFontIndex;

  @override
  void initState() {
    _currentFontIndex = widget.fonts.indexOf(widget.font) < 0
        ? 0
        : widget.fonts.indexOf(widget.font);

    super.initState();
  }

  void _fontChangeHandler() {
    setState(() {
      _currentFontIndex++;

      if (_currentFontIndex >= widget.fonts.length) {
        _currentFontIndex = 0;
      }

      widget.onFontFamilyChanged(widget.fonts[_currentFontIndex]);
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
          widget.fonts[_currentFontIndex],
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
