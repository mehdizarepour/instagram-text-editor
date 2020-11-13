import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_editor/src/text_style_model.dart';

class FontSize extends StatefulWidget {
  final double size;

  FontSize(this.size);

  @override
  _FontSizeState createState() => _FontSizeState();
}

class _FontSizeState extends State<FontSize> {
  double _currentSliderValue;

  @override
  void initState() {
    _currentSliderValue = widget.size == null ? 10 : widget.size;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyleModel textStyleModel =
        Provider.of<TextStyleModel>(context, listen: false);

    return RotatedBox(
      quarterTurns: 3,
      child: Slider(
        value: _currentSliderValue,
        min: 0,
        max: 100,
        divisions: 100,
        activeColor: Colors.white,
        inactiveColor: Colors.white,
        onChanged: (double value) {
          textStyleModel.editFontSize(value);

          setState(() {
            _currentSliderValue = textStyleModel.textStyle.fontSize;
          });
        },
      ),
    );
  }
}
