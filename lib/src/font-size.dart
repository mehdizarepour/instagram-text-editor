import 'package:flutter/material.dart';

class FontSize extends StatefulWidget {
  final double size;
  final ValueChanged<double> onFontSizeChanged;

  FontSize({this.size = 0, @required this.onFontSizeChanged});

  @override
  _FontSizeState createState() => _FontSizeState();
}

class _FontSizeState extends State<FontSize> {
  double _currentSliderValue;

  @override
  void initState() {
    _currentSliderValue = widget.size;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          setState(() {
            _currentSliderValue = value;
          });
        },
      ),
    );
  }
}
