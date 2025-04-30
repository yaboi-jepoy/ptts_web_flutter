import 'package:PTTS/database/database_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:PTTS/elements/db_tables.dart';
import 'package:PTTS/elements/sample_data.dart';

class AdminPage extends StatefulWidget {
  AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

// * functions
void loadVehicles() async {
  final rows = await DatabaseService.instance.getVehicles();
  // i can't do setState here
}

class _AdminPageState extends State<AdminPage> {
  // define database access
  late final DatabaseService _databaseService = DatabaseService.instance;

  // vehicles
  String? _plate;
  int _capacity = 0;
  String? _type;

  // init variables
  List<List<String>> vehicleRows = [];

  @override
  // init functions
  void initState() {
    super.initState();
    loadVehicles();
  }

  // * functions
  void loadVehicles() async {
    final rows = await DatabaseService.instance.getVehicles();
    setState(() {
      vehicleRows = rows;
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
                  child: Text('print'),
                  onPressed: () async {
                    //! add the dummy data here
                    await _databaseService.getVehicles();
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
                  tableRows: vehicleRows,
                  buttonPopup: CupertinoAlertDialog(
                    title: Text("Add Vehicle"),
                    content: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16,
                            bottom: 4,
                            left: 4,
                            right: 4,
                          ),
                          child: CupertinoTextField(
                            placeholder: 'Plate',
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              _plate = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CupertinoTextField(
                            placeholder: 'Capacity',
                            textAlign: TextAlign.center,
                            onSubmitted: (value) {
                              _capacity = int.parse(value);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CupertinoTextField(
                            placeholder: 'Vehicle Type',
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              _type = value;
                            },
                          ),
                        ),
                        CupertinoButton(
                          child: Text('Add'),
                          onPressed: () {
                            // check if plate or type is null
                            // do nothing if null
                            if (_plate == null || _type == null) return;
                            // else insert to table
                            _databaseService.addVehicle(
                              _plate.toString(),
                              _capacity,
                              _type.toString(),
                            );

                            // set variables back to null
                            // for insertion again later
                            print(
                              'pushed $_plate, $_capacity, $_type to table',
                            );
                            _plate = null;
                            _capacity = 0;
                            _type = null;
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
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
                  tableColumns: ['Type', 'Location'],
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
