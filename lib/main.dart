import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:ptts_web_flutter/database/database.dart';
import 'package:ptts_web_flutter/pages/landing_page.dart';
import 'package:ptts_web_flutter/database/web/web.dart';
// import 'package:drift/native.dart';

Future<void> main() async {
  runApp(const MyApp());
  debugPaintSizeEnabled = false;

  // final db = constructDb();
  // final db = Database(NativeDatabase.memory());

  // insert values
  // await db
  //     .into(db.tableVehicles)
  //     .insert(
  //       tableVehiclesCompanion.insert(
  //         plate_no: 'IOP 7893',
  //         capacity: 18,
  //         vehicle_type: 'UV',
  //       ),
  //     );

  // try to print?
  // final vehicles = await db.select(db.tableVehicles).get();
  // for (var vehicle in vehicles) {
  //   debugPrint(vehicle.toString());
  // }
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
