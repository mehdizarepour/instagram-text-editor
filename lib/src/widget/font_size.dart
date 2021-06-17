import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_editor/src/text_style_model.dart';

class FontSize extends StatelessWidget {
  final double minFontSize;
  final double maxFontSize;

  FontSize({required this.minFontSize, required this.maxFontSize});

  @override
  Widget build(BuildContext context) {
    return Consumer<TextStyleModel>(
      builder: (context, model, child) => RotatedBox(
        quarterTurns: 3,
        child: Slider(
          value: model.textStyle?.fontSize ?? minFontSize,
          min: minFontSize,
          max: maxFontSize,
          divisions: ((maxFontSize - minFontSize) * 10).toInt(),
          activeColor: Colors.white,
          inactiveColor: Colors.white,
          onChanged: (double value) => model.editFontSize(value),
        ),
      ),
    );
  }
}
