import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_editor/src/text_style_model.dart';

class ColorPalette extends StatefulWidget {
  final Color pickedColor;

  ColorPalette({this.pickedColor = Colors.black});

  @override
  _ColorPaletteState createState() => _ColorPaletteState();
}

class _ColorPaletteState extends State<ColorPalette> {
  Color currentColor;

  @override
  void initState() {
    currentColor = widget.pickedColor;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Consumer<TextStyleModel>(
              builder: (context, textStyleModel, child) => Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.only(right: 7),
                decoration: BoxDecoration(
                  color: textStyleModel.textStyle.color,
                  border: Border.all(color: Colors.white, width: 1.5),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Icon(
                    Icons.colorize,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            _ColorPicker(Colors.black),
            _ColorPicker(Colors.white),
            _ColorPicker(Color(int.parse('0xffEA2027'))),
            _ColorPicker(Color(int.parse('0xff006266'))),
            _ColorPicker(Color(int.parse('0xff1B1464'))),
            _ColorPicker(Color(int.parse('0xff5758BB'))),
            _ColorPicker(Color(int.parse('0xff6F1E51'))),
            _ColorPicker(Color(int.parse('0xffB53471'))),
            _ColorPicker(Color(int.parse('0xffEE5A24'))),
            _ColorPicker(Color(int.parse('0xff009432'))),
            _ColorPicker(Color(int.parse('0xff0652DD'))),
            _ColorPicker(Color(int.parse('0xff9980FA'))),
            _ColorPicker(Color(int.parse('0xff833471'))),
            _ColorPicker(Color(int.parse('0xff112CBC4'))),
            _ColorPicker(Color(int.parse('0xffFDA7DF'))),
            _ColorPicker(Color(int.parse('0xffED4C67'))),
            _ColorPicker(Color(int.parse('0xffF79F1F'))),
            _ColorPicker(Color(int.parse('0xffA3CB38'))),
            _ColorPicker(Color(int.parse('0xff1289A7'))),
            _ColorPicker(Color(int.parse('0xffD980FA'))),
          ],
        ),
      ),
    );
  }
}

class _ColorPicker extends StatelessWidget {
  final Color color;

  _ColorPicker(this.color);

  @override
  Widget build(BuildContext context) {
    TextStyleModel textStyleModel =
        Provider.of<TextStyleModel>(context, listen: false);

    return GestureDetector(
      onTap: () => textStyleModel.editTextColor(color),
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.only(right: 7),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
