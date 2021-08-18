import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../text_style_model.dart';

class TextBackgroundColor extends StatelessWidget {
  final Widget? enableWidget;
  final Widget? disableWidget;

  TextBackgroundColor({this.enableWidget, this.disableWidget});

  @override
  Widget build(BuildContext context) {
    return Consumer<TextStyleModel>(
      builder: (context, model, child) => GestureDetector(
        onTap: () => model.changeTextBackground(),
        child: model.textBackgroundStatus != TextBackgroundStatus.disable
            ? enableWidget ?? _SwitchButton(enabled: true)
            : disableWidget ?? _SwitchButton(enabled: false),
      ),
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
