// ignore_for_file: non_constant_identifier_names

import 'package:PTTS/database/database_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:PTTS/elements/db_tables.dart';
import 'package:PTTS/elements/sample_data.dart';

class AdminPage extends StatefulWidget {
  AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  // define database access
  late final DatabaseService _databaseService = DatabaseService.instance;

  // terminals
  String? _terminal_name;

  // vehicles
  String? _plate;
  int _capacity = 0;
  String? _type;
  int _terminal_id = 0;

  // drivers
  String? _driver_first_name;
  String? _driver_last_name;
  int? _driver_age;

  // conductors
  String? _conductor_first_name;
  String? _conductor_last_name;
  int? _conductor_age;

  //==//==//==//==//==//==//==//==//==//==//

  // init variables
  List<List<String>> vehicleRows = [];
  List<List<String>> driverRows = [];
  List<List<String>> conductorRows = [];
  List<List<String>> terminalRows = [];

  @override
  // init functions
  void initState() {
    super.initState();
    loadData();
  }

  // * functions
  void loadData() async {
    final _vehicles = await DatabaseService.instance.getVehicles();
    final _drivers = await DatabaseService.instance.getDrivers();
    final _conductors = await DatabaseService.instance.getConductors();
    final _terminals = await DatabaseService.instance.getTerminals();
    setState(() {
      vehicleRows = _vehicles;
      driverRows = _drivers;
      conductorRows = _conductors;
      terminalRows = _terminals;
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
                    'Terminal',
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
                            onChanged: (value) {
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
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CupertinoTextField(
                            placeholder: 'terminal_id',
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              _terminal_id = int.parse(value);
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
                              _terminal_id,
                            );

                            // set variables back to null
                            // for insertion again later
                            print(
                              'pushed $_plate, $_capacity, $_type to table',
                            );
                            _plate = null;
                            _capacity = 0;
                            _type = null;
                            loadData();
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
                  tableRows: driverRows,
                  buttonPopup: CupertinoAlertDialog(
                    title: Text("Add Driver"),
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
                            placeholder: 'First Name',
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              _driver_first_name = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 4,
                            bottom: 4,
                            left: 4,
                            right: 4,
                          ),
                          child: CupertinoTextField(
                            placeholder: 'Last Name',
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              _driver_last_name = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 4,
                            bottom: 4,
                            left: 4,
                            right: 4,
                          ),
                          child: CupertinoTextField(
                            placeholder: 'Age',
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              _driver_age = int.parse(value);
                            },
                          ),
                        ),

                        CupertinoButton(
                          child: Text('Add'),
                          onPressed: () {
                            // check if plate or type is null
                            // do nothing if null
                            if (_driver_first_name == null ||
                                _driver_last_name == null)
                              return;
                            // else insert to table
                            _databaseService.addDriver(
                              _driver_first_name,
                              _driver_last_name,
                              _driver_age,
                            );

                            // set variables back to null
                            // for insertion again later
                            print(
                              'pushed $_driver_first_name, $_driver_last_name, $_driver_age to table',
                            );
                            _driver_first_name = null;
                            _driver_last_name = null;
                            _driver_age = null;

                            loadData();
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
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
                  tableRows: conductorRows,
                  buttonPopup: CupertinoAlertDialog(
                    title: Text("Add Conductor"),
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
                            placeholder: 'First Name',
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              _conductor_first_name = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 4,
                            bottom: 4,
                            left: 4,
                            right: 4,
                          ),
                          child: CupertinoTextField(
                            placeholder: 'Last Name',
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              _conductor_last_name = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 4,
                            bottom: 4,
                            left: 4,
                            right: 4,
                          ),
                          child: CupertinoTextField(
                            placeholder: 'Age',
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              _conductor_age = int.parse(value);
                            },
                          ),
                        ),

                        CupertinoButton(
                          child: Text('Add'),
                          onPressed: () {
                            // check if plate or type is null
                            // do nothing if null
                            if (_conductor_first_name == null ||
                                _conductor_last_name == null)
                              return;
                            // else insert to table
                            _databaseService.addConductor(
                              _conductor_first_name,
                              _conductor_last_name,
                              _conductor_age,
                            );

                            // set variables back to null
                            // for insertion again later
                            print(
                              'pushed $_conductor_first_name, $_conductor_last_name, $_conductor_age to table',
                            );
                            _conductor_first_name = null;
                            _conductor_last_name = null;
                            _conductor_age = null;

                            loadData();
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                // add new terminals
                DbTables(
                  tableTitle: 'Terminals',
                  tableColumns: ['Terminal ID', 'Location'],
                  tableRows: terminalRows,
                  buttonPopup: CupertinoAlertDialog(
                    title: Text("Add Terminal"),
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
                            placeholder: 'Terminal Name',
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              _terminal_name = value;
                            },
                          ),
                        ),

                        CupertinoButton(
                          child: Text('Add'),
                          onPressed: () {
                            // check if plate or type is null
                            // do nothing if null
                            if (_terminal_name == null) return;
                            // else insert to table
                            _databaseService.addTerminal(_terminal_name);

                            // set variables back to null
                            // for insertion again later
                            print('pushed $_terminal_name to table');
                            _terminal_name = null;

                            loadData();
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
