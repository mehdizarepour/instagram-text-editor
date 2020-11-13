import 'package:flutter/material.dart';

enum TextBackgroundColorStatus { enable, exchange, none }

class TextBackgroundColor extends StatefulWidget {
  @override
  _TextBackgroundColorState createState() => _TextBackgroundColorState();
}

class _TextBackgroundColorState extends State<TextBackgroundColor> {
  TextBackgroundColorStatus _status = TextBackgroundColorStatus.none;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          switch (_status) {
            case TextBackgroundColorStatus.none:
              _status = TextBackgroundColorStatus.enable;
              break;
            case TextBackgroundColorStatus.enable:
              _status = TextBackgroundColorStatus.exchange;
              break;
            default:
              _status = TextBackgroundColorStatus.none;
          }
        });
      },
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          color:
              _status == TextBackgroundColorStatus.none ? null : Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Icon(
          Icons.format_bold,
          size: 20,
          color: _status == TextBackgroundColorStatus.none
              ? Colors.white
              : Colors.black,
        ),
      ),
    );
  }
}
