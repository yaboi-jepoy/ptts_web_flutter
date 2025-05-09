// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:PTTS/database/database_service.dart';
import 'package:PTTS/elements/addTrips.dart';
import 'package:flutter/cupertino.dart';
import 'package:PTTS/elements/db_tables.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

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

  //==//==//==//==// FOR DELETE OPERATION //==//==//==//==//
  int _todelete_vehicle = 0;
  int _todelete_driver = 0;
  int _todelete_conductor = 0;
  int _todelete_terminal = 0;
  int _todelete_trip = 0;

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

  void _showUpdateVehicleDialog(
    BuildContext context,
    List<String> vehicleData,
  ) {
    final vehicleNo = int.parse(vehicleData[0]);
    final plateNo = vehicleData[1];
    final capacity = int.parse(vehicleData[2]);
    final vehicleType = vehicleData[3];
    final terminalId = int.parse(vehicleData[4]);

    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Text("Update Vehicle"),
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
                controller: TextEditingController(text: plateNo),
                onChanged: (value) {
                  _plate = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: CupertinoTextField(
                placeholder: 'Capacity',
                controller: TextEditingController(text: capacity.toString()),
                onChanged: (value) {
                  _capacity = int.tryParse(value) ?? 0;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: CupertinoTextField(
                placeholder: 'Vehicle Type',
                controller: TextEditingController(text: vehicleType),
                onChanged: (value) {
                  _type = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: CupertinoTextField(
                placeholder: 'terminal_id',
                controller: TextEditingController(text: terminalId.toString()),
                onChanged: (value) {
                  _terminal_id = int.tryParse(value) ?? 0;
                },
              ),
            ),
            CupertinoButton(
              child: Text('Update'),
              onPressed: () {
                _databaseService.updateVehicle(
                  vehicleNo: vehicleNo,
                  plateNo: _plate ?? plateNo,
                  capacity: _capacity != 0 ? _capacity : capacity,
                  vehicleType: _type ?? vehicleType,
                  terminalId: _terminal_id != 0 ? _terminal_id : terminalId,
                );
                loadData();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showUpdateDriverDialog(BuildContext context, List<String> driverData) {
    final driverNo = int.parse(driverData[0]);
    final firstName = driverData[1];
    final lastName = driverData[2];
    final age = int.parse(driverData[3]);

    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Text("Update Driver"),
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
                controller: TextEditingController(text: firstName),
                onChanged: (value) {
                  _driver_first_name = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: CupertinoTextField(
                placeholder: 'Last Name',
                controller: TextEditingController(text: lastName),
                onChanged: (value) {
                  _driver_last_name = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: CupertinoTextField(
                placeholder: 'Age',
                controller: TextEditingController(text: age.toString()),
                onChanged: (value) {
                  _driver_age = int.tryParse(value);
                },
              ),
            ),
            CupertinoButton(
              child: Text('Update'),
              onPressed: () {
                _databaseService.updateDriver(
                  driverNo: driverNo,
                  firstName: _driver_first_name ?? firstName,
                  lastName: _driver_last_name ?? lastName,
                  age: _driver_age ?? age,
                );
                loadData();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showUpdateConductorDialog(
    BuildContext context,
    List<String> conductorData,
  ) {
    final conductorNo = int.parse(conductorData[0]);
    final firstName = conductorData[1];
    final lastName = conductorData[2];
    final age = int.parse(conductorData[3]);

    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Text("Update Conductor"),
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
                controller: TextEditingController(text: firstName),
                onChanged: (value) {
                  _conductor_first_name = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: CupertinoTextField(
                placeholder: 'Last Name',
                controller: TextEditingController(text: lastName),
                onChanged: (value) {
                  _conductor_last_name = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: CupertinoTextField(
                placeholder: 'Age',
                controller: TextEditingController(text: age.toString()),
                onChanged: (value) {
                  _conductor_age = int.tryParse(value);
                },
              ),
            ),
            CupertinoButton(
              child: Text('Update'),
              onPressed: () {
                _databaseService.updateConductor(
                  conductorNo: conductorNo,
                  firstName: _conductor_first_name ?? firstName,
                  lastName: _conductor_last_name ?? lastName,
                  age: _conductor_age ?? age,
                );
                loadData();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showUpdateTerminalDialog(
    BuildContext context,
    List<String> terminalData,
  ) {
    final terminalId = int.parse(terminalData[0]);
    final terminalName = terminalData[1];

    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Text("Update Terminal"),
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
                controller: TextEditingController(text: terminalName),
                onChanged: (value) {
                  _terminal_name = value;
                },
              ),
            ),
            CupertinoButton(
              child: Text('Update'),
              onPressed: () {
                _databaseService.updateTerminal(
                  terminalId,
                  _terminal_name ?? terminalName,
                );
                loadData();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
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
        trailing: FittedBox(fit: BoxFit.scaleDown, child: AddTrips()),
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
                // CupertinoButton(
                //   child: Text('print'),
                //   onPressed: () async {
                //     //! add the dummy data here
                //   },
                // ),

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
                  onRowTap: (rowData) {
                    _showUpdateVehicleDialog(context, rowData);
                  },
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
                  onRowTap: (rowData) {
                    _showUpdateDriverDialog(context, rowData);
                  },
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
                  onRowTap: (rowData) {
                    _showUpdateConductorDialog(context, rowData);
                  },
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
                  onRowTap: (rowData) {
                    _showUpdateTerminalDialog(context, rowData);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CupertinoColors.destructiveRed,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        // title
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'Delete',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: CupertinoColors.destructiveRed,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // del vehicles
                            CupertinoButton(
                              child: Text(
                                "Vehicle",
                                style: TextStyle(
                                  color: CupertinoColors.destructiveRed,
                                ),
                              ),
                              onPressed: () {
                                showCupertinoDialog(
                                  context: context,
                                  builder: (_) => CupertinoAlertDialog(
                                    title: Text("Enter Vehicle No."),
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
                                            placeholder: 'Ex. 1',
                                            textAlign: TextAlign.center,
                                            onChanged: (value) {
                                              _todelete_vehicle = int.parse(
                                                value,
                                              );
                                            },
                                          ),
                                        ),

                                        CupertinoButton(
                                          child: Text('Proceed'),
                                          onPressed: () {
                                            // check if input is invalid
                                            // return nothing if yes
                                            if (_todelete_vehicle == 0) return;
                                            // else continue
                                            _databaseService.deleteVehicle(
                                              _todelete_vehicle,
                                            );

                                            _todelete_vehicle = 0;

                                            loadData();
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            // del drivers
                            CupertinoButton(
                              child: Text(
                                "Driver",
                                style: TextStyle(
                                  color: CupertinoColors.destructiveRed,
                                ),
                              ),
                              onPressed: () {
                                showCupertinoDialog(
                                  context: context,
                                  builder: (_) => CupertinoAlertDialog(
                                    title: Text("Enter Driver No."),
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
                                            placeholder: 'Ex. 1',
                                            textAlign: TextAlign.center,
                                            onChanged: (value) {
                                              _todelete_driver = int.parse(
                                                value,
                                              );
                                            },
                                          ),
                                        ),

                                        CupertinoButton(
                                          child: Text('Proceed'),
                                          onPressed: () {
                                            // check if input is invalid
                                            // return nothing if yes
                                            if (_todelete_driver == 0) return;
                                            // else continue
                                            _databaseService.deleteDriver(
                                              _todelete_driver,
                                            );

                                            _todelete_driver = 0;

                                            loadData();
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            // del conductors
                            CupertinoButton(
                              child: Text(
                                "Conductor",
                                style: TextStyle(
                                  color: CupertinoColors.destructiveRed,
                                ),
                              ),
                              onPressed: () {
                                showCupertinoDialog(
                                  context: context,
                                  builder: (_) => CupertinoAlertDialog(
                                    title: Text("Enter Conductor No."),
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
                                            placeholder: 'Ex. 1',
                                            textAlign: TextAlign.center,
                                            onChanged: (value) {
                                              _todelete_conductor = int.parse(
                                                value,
                                              );
                                            },
                                          ),
                                        ),

                                        CupertinoButton(
                                          child: Text('Proceed'),
                                          onPressed: () {
                                            // check if input is invalid
                                            // return nothing if yes
                                            if (_todelete_conductor == 0)
                                              return;
                                            // else continue
                                            _databaseService.deleteConductor(
                                              _todelete_conductor,
                                            );

                                            _todelete_conductor = 0;

                                            loadData();
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            // del terminal
                            // CupertinoButton(
                            //   child: Text("Delete Terminal"),
                            //   onPressed: () {
                            //     showCupertinoDialog(
                            //       context: context,
                            //       builder: (_) => CupertinoAlertDialog(
                            //         title: Text("Enter Terminal No."),
                            //         content: Column(
                            //           children: [
                            //             Padding(
                            //               padding: const EdgeInsets.only(
                            //                 top: 16,
                            //                 bottom: 4,
                            //                 left: 4,
                            //                 right: 4,
                            //               ),
                            //               child: CupertinoTextField(
                            //                 placeholder: 'Ex. 1',
                            //                 textAlign: TextAlign.center,
                            //                 onChanged: (value) {
                            //                   _todelete_terminal = int.parse(value);
                            //                 },
                            //               ),
                            //             ),

                            //             CupertinoButton(
                            //               child: Text('Proceed'),
                            //               onPressed: () {
                            //                 // check if input is invalid
                            //                 // return nothing if yes
                            //                 if (_todelete_terminal == 0) return;
                            //                 // else continue
                            //                 _databaseService.deleteTerminal(
                            //                   _todelete_terminal,
                            //                 );

                            //                 _todelete_terminal = 0;

                            //                 loadData();
                            //                 Navigator.pop(context);
                            //               },
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     );
                            //   },
                            // ),
                            CupertinoButton(
                              child: Text(
                                "Trip",
                                style: TextStyle(
                                  color: CupertinoColors.destructiveRed,
                                ),
                              ),
                              onPressed: () {
                                showCupertinoDialog(
                                  context: context,
                                  builder: (_) => CupertinoAlertDialog(
                                    title: Text("Enter Trip No."),
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
                                            placeholder: 'Ex. 1',
                                            textAlign: TextAlign.center,
                                            onChanged: (value) {
                                              _todelete_trip = int.parse(value);
                                            },
                                          ),
                                        ),

                                        CupertinoButton(
                                          child: Text('Proceed'),
                                          onPressed: () {
                                            // check if input is invalid
                                            // return nothing if yes
                                            if (_todelete_trip == 0) return;
                                            // else continue
                                            _databaseService.deleteTrip(
                                              _todelete_trip,
                                            );

                                            _todelete_trip = 0;

                                            loadData();
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
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
