import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_editor/src/text_style_model.dart';

class FontSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TextStyleModel>(
      builder: (context, model, child) => RotatedBox(
        quarterTurns: 3,
        child: Slider(
          value: model.textStyle.fontSize,
          min: 0,
          max: 100,
          divisions: 100,
          activeColor: Colors.white,
          inactiveColor: Colors.white,
          onChanged: (double value) => model.editFontSize(value),
        ),
      ),
    );
  }
}
