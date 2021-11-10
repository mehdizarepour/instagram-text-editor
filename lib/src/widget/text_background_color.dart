import 'package:flutter/material.dart';
import 'package:text_editor/src/text_style_model.dart';
import 'package:text_editor/text_editor_data.dart';

class TextBackgroundColor extends StatelessWidget {
  final Widget? enableWidget;
  final Widget? disableWidget;

  TextBackgroundColor({this.enableWidget, this.disableWidget});

  @override
  Widget build(BuildContext context) {
    final model = TextEditorData.of(context).textStyleModel;
    return GestureDetector(
      onTap: () => model.changeTextBackground(),
      child: model.textBackgroundStatus != TextBackgroundStatus.disable
          ? enableWidget ?? _SwitchButton(enabled: true)
          : disableWidget ?? _SwitchButton(enabled: false),
    );
  }
}

class _SwitchButton extends StatelessWidget {
  final bool enabled;
  const _SwitchButton({Key? key, this.enabled = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: !enabled ? null : Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Icon(
        Icons.format_bold,
        size: 20,
        color: !enabled ? Colors.white : Colors.black,
      ),
    );
  }
}
