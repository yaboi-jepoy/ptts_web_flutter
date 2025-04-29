import 'package:PTTS/pages/landing_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  // init ffi for sqlite
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

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
