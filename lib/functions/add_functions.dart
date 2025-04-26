import 'package:flutter/cupertino.dart';

class AddVehicles extends StatelessWidget {
  const AddVehicles({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(title: Text('Add New Vehicle'));
  }
}

class AddDrivers extends StatelessWidget {
  const AddDrivers({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(title: Text('Add New Driver'));
  }
}

class AddConductors extends StatelessWidget {
  const AddConductors({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(title: Text('Add New Conductor'));
  }
}

class AddTerminal extends StatelessWidget {
  const AddTerminal({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(title: Text('Add New Terminal'));
  }
}

class AddTrips extends StatelessWidget {
  const AddTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(title: Text('Add New Trip'));
  }
}
