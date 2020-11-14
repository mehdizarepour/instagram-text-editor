import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_editor/src/font_option_model.dart';

class FontOptionSwitch extends StatefulWidget {
  @override
  _FontOptionSwitch createState() => _FontOptionSwitch();
}

class _FontOptionSwitch extends State<FontOptionSwitch> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FontOptionModel>(
      builder: (context, model, child) => GestureDetector(
        onTap: () => model.changeFontOptionStatus(model.status),
        child: model.status == FontOptionStatus.fontFamily
            ? _ColorOption()
            : _FontOption(),
      ),
    );
  }
}

class _ColorOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.5),
        border: Border.all(color: Colors.white, width: 1),
        gradient: SweepGradient(
          colors: [
            Colors.blue,
            Colors.green,
            Colors.yellow,
            Colors.red,
            Colors.blue,
          ],
          stops: [0.0, 0.25, 0.5, 0.75, 1],
        ),
      ),
    );
  }
}

class _FontOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.5),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Center(
        child: Text(
          'A',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
