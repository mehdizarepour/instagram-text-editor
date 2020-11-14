import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_editor/src/font_option_model.dart';

class FontFamily extends StatefulWidget {
  final List<String> fonts;

  FontFamily(this.fonts);

  @override
  _FontFamilyState createState() => _FontFamilyState();
}

class _FontFamilyState extends State<FontFamily> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children:
              widget.fonts.map((font) => _FontFamilyPicker(font)).toList(),
        ),
      ),
    );
  }
}

class _FontFamilyPicker extends StatelessWidget {
  final String font;

  _FontFamilyPicker(this.font);

  @override
  Widget build(BuildContext context) {
    FontOptionModel fontOptionModel =
        Provider.of<FontOptionModel>(context, listen: false);

    return GestureDetector(
      onTap: () => fontOptionModel.selectFontFamily(font),
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.only(right: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.black45,
        ),
        child: Center(
          child: Text(
            'Aa',
            style: TextStyle(color: Colors.white, fontFamily: font),
          ),
        ),
      ),
    );
  }
}
