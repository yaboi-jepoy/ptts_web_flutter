import 'package:PTTS/database/database_service.dart';
import 'package:flutter/cupertino.dart';

class AddVehicle extends StatelessWidget {
  AddVehicle({super.key});

  late final DatabaseService _databaseService = DatabaseService.instance;
  // vehicles
  String? _plate = null;
  int _capacity = 0;
  String? _type = null;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
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
              print('pushed $_plate, $_capacity, $_type to table');
              _plate = null;
              _capacity = 0;
              _type = null;
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
