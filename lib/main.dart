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
  static final buttonsColor = WindowButtonColors(
    iconNormal: Color(0xff805306),
    mouseOver: Color(0xfff6a00c),
    mouseDown: Color(0xff805306),
    iconMouseOver: Color(0xff805306),
    iconMouseDown: Color(0xffffd500),
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFD500), Color(0xFFF6A00C)],
            stops: [0.0, 1.0],
          ),
        ),
        child: Column(
          children: [
            WindowTitleBarBox(
              child: Row(
                children: [
                  Expanded(
                    child: MoveWindow(),
                  ),
                  Row(
                    children: [
                      MinimizeWindowButton(colors: buttonsColor),
                      MaximizeWindowButton(colors: buttonsColor),
                      CloseWindowButton(),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
