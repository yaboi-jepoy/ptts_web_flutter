import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:ptts_web_flutter/database/database.dart';
import 'package:ptts_web_flutter/database/web/web.dart';
import 'package:ptts_web_flutter/elements/db_tables.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

final db = constructDb();

class _AdminPageState extends State<AdminPage> {
  late Database db;
  List<List<String>> vehicles = [];
  List<List<String>> drivers = [];
  List<List<String>> conductors = [];
  List<List<String>> terminals = [];

  @override
  void initState() {
    super.initState();
    db = constructDb(); // Initialize the database
    _fetchData();
  }

  Future<void> _fetchData() async {
    // Fetch vehicles
    final vehicleRows = await db.select(db.tableVehicles).get();
    setState(() {
      vehicles = vehicleRows
          .map(
            (vehicle) => [
              vehicle.vehicle_no.toString(),
              vehicle.plate_no,
              vehicle.capacity.toString(),
              vehicle.vehicle_type,
            ],
          )
          .toList();
    });

    // Fetch drivers
    final driverRows = await db.select(db.tableDrivers).get();
    setState(() {
      drivers = driverRows
          .map(
            (driver) => [
              driver.driver_no.toString(),
              driver.first_name,
              driver.last_name,
              driver.age.toString(),
            ],
          )
          .toList();
    });

    // Fetch conductors
    final conductorRows = await db.select(db.tableConductors).get();
    setState(() {
      conductors = conductorRows
          .map(
            (conductor) => [
              conductor.conductor_no.toString(),
              conductor.first_name,
              conductor.last_name,
              conductor.age.toString(),
            ],
          )
          .toList();
    });

    // Fetch terminals
    final terminalRows = await db.select(db.tableTerminals).get();
    setState(() {
      terminals = terminalRows
          .map(
            (terminal) => [
              terminal.terminal_id.toString(),
              terminal.status,
              terminal.vehicle_no.toString(),
              terminal.available.toString(),
            ],
          )
          .toList();
    });
  }

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
                CupertinoButton(
                  child: Text('DriftDbViewer'),
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => DriftDbViewer(db),
                      ),
                    );
                  },
                ),
                CupertinoButton(
                  child: Text('add dummy data'),
                  onPressed: () {
                    // insert dummy value into table_drivers
                    db
                        .into(db.tableDrivers)
                        .insert(
                          tableDriversCompanion.insert(
                            first_name: 'John',
                            last_name: 'Doe',
                            age: 30,
                          ),
                        );
                  },
                ),
                // add new vehicle
                DbTables(
                  tableTitle: 'Vehicles',
                  tableColumns: [
                    'Vehicle No.',
                    'Plate',
                    'Capacity',
                    'Vehicle Type',
                  ],
                  tableRows: vehicles,
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
                ),

                // add new terminals
                DbTables(
                  tableTitle: 'Terminals',
                  tableColumns: [
                    'Terminal ID',
                    'Status',
                    'Vehicle No.',
                    'Available',
                  ],
                  tableRows: terminals,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
