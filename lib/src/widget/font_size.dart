import 'package:flutter/material.dart';
import 'package:text_editor/text_editor_data.dart';

class FontSize extends StatelessWidget {
  final double minFontSize;
  final double maxFontSize;

  FontSize({required this.minFontSize, required this.maxFontSize});

  @override
  Widget build(BuildContext context) {
    final model = TextEditorData.of(context).textStyleModel;
    return RotatedBox(
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
    );
  }
}
