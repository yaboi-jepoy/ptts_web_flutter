import 'package:flutter/cupertino.dart';
import 'package:PTTS/database/database_service.dart';

class AddTrips extends StatefulWidget {
  const AddTrips({super.key});

  @override
  State<AddTrips> createState() => _AddTripsState();
}

class _AddTripsState extends State<AddTrips> {
  // Controllers to display selected values
  final _startTerminalController = TextEditingController();
  final _endTerminalController = TextEditingController();
  final _vehicleController = TextEditingController();
  final _driverController = TextEditingController();
  final _conductorController = TextEditingController();

  // Actual selected IDs
  int? startTerminalId;
  int? endTerminalId;
  int? vehicleNo;
  int? driverNo;
  int? conductorNo;

  // Options loaded from the DB
  List<List<String>> terminals = [];
  List<List<String>> vehicles = [];
  List<List<String>> drivers = [];
  List<List<String>> conductors = [];

  @override
  void initState() {
    super.initState();
    loadOptions();
  }

  Future<void> loadOptions() async {
    terminals = await DatabaseService.instance.getTerminals();
    vehicles = await DatabaseService.instance.getVehicles();
    drivers = await DatabaseService.instance.getDrivers();
    conductors = await DatabaseService.instance.getConductors();
    setState(() {});
  }

  void _showPicker({
    required BuildContext context,
    required List<List<String>> options,
    required void Function(String label, int id) onSelect,
  }) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => CupertinoActionSheet(
        title: Text('Select an option'),
        actions: options.map((row) {
          final id = int.parse(row[0]);
          final label = row[1];
          return CupertinoActionSheetAction(
            child: Text(label),
            onPressed: () {
              onSelect(label, id);
              Navigator.pop(context);
            },
          );
        }).toList(),
        cancelButton: CupertinoActionSheetAction(
          isDestructiveAction: true,
          child: Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required TextEditingController controller,
    required List<List<String>> options,
    required void Function(String label, int id) onSelected,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: CupertinoTextField(
        placeholder: label,
        controller: controller,
        readOnly: true,
        onTap: () {
          _showPicker(context: context, options: options, onSelect: onSelected);
        },
      ),
    );
  }

  void _showTripDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Text('Add New Trip'),
        content: Column(
          children: [
            _buildDropdownField(
              label: 'Start Terminal',
              controller: _startTerminalController,
              options: terminals,
              onSelected: (label, id) {
                startTerminalId = id;
                _startTerminalController.text = label;
              },
            ),
            _buildDropdownField(
              label: 'End Terminal',
              controller: _endTerminalController,
              options: terminals,
              onSelected: (label, id) {
                endTerminalId = id;
                _endTerminalController.text = label;
              },
            ),
            _buildDropdownField(
              label: 'Vehicle',
              controller: _vehicleController,
              options: vehicles.map((v) => [v[0], v[1]]).toList(),
              onSelected: (label, id) {
                vehicleNo = id;
                _vehicleController.text = label;
              },
            ),
            _buildDropdownField(
              label: 'Driver',
              controller: _driverController,
              options: drivers.map((d) => [d[0], '${d[1]} ${d[2]}']).toList(),
              onSelected: (label, id) {
                driverNo = id;
                _driverController.text = label;
              },
            ),
            _buildDropdownField(
              label: 'Conductor',
              controller: _conductorController,
              options: conductors
                  .map((c) => [c[0], '${c[1]} ${c[2]}'])
                  .toList(),
              onSelected: (label, id) {
                conductorNo = id;
                _conductorController.text = label;
              },
            ),
          ],
        ),
        actions: [
          CupertinoDialogAction(
            child: Text('Create Trip'),
            onPressed: () {
              if (vehicleNo != null &&
                  startTerminalId != null &&
                  endTerminalId != null &&
                  driverNo != null &&
                  conductorNo != null) {
                // Replace this with your real insert method
                DatabaseService.instance.generateTrip(
                  vehicleNo!,
                  startTerminalId.toString(),
                  endTerminalId.toString(),
                  driverNo!,
                  conductorNo!,
                  'Scheduled',
                  1,
                );
                Navigator.pop(context);
              } else {
                print('Fill in all fields');
              }
            },
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text('Generate Trips'),
      onPressed: () => _showTripDialog(context),
    );
  }
}
