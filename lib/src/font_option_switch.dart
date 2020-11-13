import 'package:flutter/material.dart';

enum FontOptionStatus { color, font }

class FontOptionSwitch extends StatefulWidget {
  @override
  _FontOptionSwitch createState() => _FontOptionSwitch();
}

class _FontOptionSwitch extends State<FontOptionSwitch> {
  FontOptionStatus _fontOptionStatus = FontOptionStatus.font;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _fontOptionStatus = _fontOptionStatus == FontOptionStatus.font
              ? FontOptionStatus.color
              : FontOptionStatus.font;
        });
      },
      child: _fontOptionStatus == FontOptionStatus.font
          ? _FontOption()
          : _ColorOption(),
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
        border: Border.all(color: Colors.white, width: 1),
      ),
      // TODO: Change font icon
      child: Icon(Icons.format_bold, color: Colors.white, size: 20),
    );
  }
}
