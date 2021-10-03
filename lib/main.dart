import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(MyApp());
  doWhenWindowReady(() {
    final initialSize = Size(800, 600);
    appWindow.size = initialSize;
    appWindow.minSize = initialSize;
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TitleBarPage(),
      title: 'Flutter Desktop Title Bar',
      debugShowCheckedModeBanner: false,
    );
  }
}

class TitleBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowBorder(
        width: 1,
        color: Color(0xff805306),
        child: Row(
          children: [
            LeftSide(),
            RightSide(),
          ],
        ),
      ),
    );
  }
}

class LeftSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Container(
        color: Color(0xFFF6A00C),
        child: Column(children: [WindowTitleBarBox(child: MoveWindow())]),
      ),
    );
  }
}

class RightSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(),
    );
  }
}
