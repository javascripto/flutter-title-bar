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
      body: Row(
        children: [
          Container(),
          Container(),
        ],
      ),
    );
  }
}
