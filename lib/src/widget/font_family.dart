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
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _FontFamilyPicker('test', onFontFamilySelect: null),
            _FontFamilyPicker('test', onFontFamilySelect: null),
            _FontFamilyPicker('test', onFontFamilySelect: null),
            _FontFamilyPicker('test', onFontFamilySelect: null),
            _FontFamilyPicker('test', onFontFamilySelect: null),
            _FontFamilyPicker('test', onFontFamilySelect: null),
            _FontFamilyPicker('test', onFontFamilySelect: null),
            _FontFamilyPicker('test', onFontFamilySelect: null),
            _FontFamilyPicker('test', onFontFamilySelect: null),
            _FontFamilyPicker('test', onFontFamilySelect: null),
            _FontFamilyPicker('test', onFontFamilySelect: null),
            _FontFamilyPicker('test', onFontFamilySelect: null),
            _FontFamilyPicker('test', onFontFamilySelect: null),
          ],
        ),
      ),
    );
  }
}

class _FontFamilyPicker extends StatelessWidget {
  final String font;
  final ValueChanged<String> onFontFamilySelect;

  _FontFamilyPicker(this.font, {@required this.onFontFamilySelect});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onFontFamilySelect(font),
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.only(right: 7),
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(100),
          color: Colors.black45,
        ),
        child: Center(
          child: Text('Aa',
              style: TextStyle(color: Colors.white, fontFamily: font)),
        ),
      ),
    );
  }
}
