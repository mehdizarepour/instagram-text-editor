import 'package:flutter/material.dart';
import 'package:text_editor/text_editor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _tapHandler() {
    showGeneralDialog(
      context: context,
      // barrierColor: Colors.black12.withOpacity(0.1), // background color
      barrierDismissible:
          false, // should dialog be dismissed when tapped outside
      barrierLabel: "Dialog", // label for barrier
      transitionDuration: Duration(
        milliseconds: 400,
      ), // how long it takes to popup dialog after button click
      pageBuilder: (_, __, ___) {
        // your widget implementation
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: TextEditor(
              onEditCompleted: (style, align, text) {
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.red,
          width: 100,
          height: 100,
          child: GestureDetector(
            onTap: _tapHandler,
          ),
        ),
      ),
    );
  }
}
