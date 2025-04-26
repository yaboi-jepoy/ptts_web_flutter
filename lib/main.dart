import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:ptts_web_flutter/pages/admin_page.dart';
import 'package:ptts_web_flutter/pages/landing_page.dart';

void main() async {
  runApp(const MyApp());
  debugPaintSizeEnabled = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        textTheme: CupertinoTextThemeData(),
      ),
      home: LandingPage(),
    );
  }
}
