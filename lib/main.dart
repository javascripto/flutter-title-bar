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
        color: AppColors.brown,
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
        color: AppColors.orange,
        child: Column(children: [WindowTitleBarBox(child: MoveWindow())]),
      ),
    );
  }
}

class RightSide extends StatelessWidget {
  static final buttonsColor = WindowButtonColors(
    iconNormal: AppColors.brown,
    mouseOver: AppColors.orange,
    mouseDown: AppColors.brown,
    iconMouseOver: AppColors.brown,
    iconMouseDown: AppColors.yellow,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.yellow, AppColors.orange],
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

class AppColors {
  static const brown = Color(0xff805306);
  static const orange = Color(0xFFF6A00C);
  static const yellow = Color(0xFFFFD500);
}
