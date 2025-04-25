import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'pages/landing_page.dart';

void main() {
  runApp(const MyApp());
  debugPaintSizeEnabled = true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(color: CupertinoColors.black),
        ),
      ),
      home: LandingPage(),
    );
  }
}
