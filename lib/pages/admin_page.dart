import 'package:flutter/cupertino.dart';
import 'package:ptts_web_flutter/elements/db_tables.dart';
import 'package:ptts_web_flutter/elements/sample_data.dart';
import 'package:ptts_web_flutter/functions/add_functions.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        previousPageTitle: 'Landing Page',
        middle: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "Administrator",
            style: TextStyle(color: CupertinoColors.black),
          ),
        ),
      ),
      backgroundColor: CupertinoColors.white,
      child: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * .75,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // add new vehicle
                DbTables(
                  tableTitle: 'Vehicles',
                  tableColumns: ['Vehicle No.', 'Plate', 'Capacity'],
                  tableRows: vehicles,
                  buttonPopup: AddVehicles(),
                ),

                // add new driver
                DbTables(
                  tableTitle: 'Drivers',
                  tableColumns: [
                    'Driver No.',
                    'First Name',
                    'Last Name',
                    'Age',
                  ],
                  tableRows: drivers,
                  buttonPopup: AddDrivers(),
                ),

                // add new conductors
                DbTables(
                  tableTitle: 'Conductors',
                  tableColumns: [
                    'Conductor No.',
                    'First Name',
                    'Last Name',
                    'Age',
                  ],
                  tableRows: conductors,
                  buttonPopup: AddConductors(),
                ),

                // add new terminals
                DbTables(
                  tableTitle: 'Terminals',
                  tableColumns: ['Type', 'Location'],
                  tableRows: terminals,
                  buttonPopup: AddTerminal(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
