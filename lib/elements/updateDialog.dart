import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:PTTS/database/database_service.dart';

class UpdateRecordDialog extends StatefulWidget {
  final String tableName;
  final Map<String, dynamic> currentData;
  final Function() onUpdateComplete;

  const UpdateRecordDialog({
    Key? key,
    required this.tableName,
    required this.currentData,
    required this.onUpdateComplete,
  }) : super(key: key);

  @override
  _UpdateRecordDialogState createState() => _UpdateRecordDialogState();
}

class _UpdateRecordDialogState extends State<UpdateRecordDialog> {
  late final DatabaseService _dbService;
  late Map<String, dynamic> _formData;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _dbService = DatabaseService.instance;
    _formData = Map.from(widget.currentData);
  }

  Future<void> _handleUpdate() async {
    setState(() => _isLoading = true);

    try {
      final id =
          _formData['${widget.tableName.singularize()}_no'] ??
          _formData['terminal_id'] ??
          _formData['trip_no'];

      switch (widget.tableName) {
        case 'terminals':
          await _dbService.updateTerminal(id, _formData['terminal_name']);
          break;
        case 'vehicles':
          await _dbService.updateVehicle(
            vehicleNo: id,
            plateNo: _formData['plate_no'],
            capacity: _formData['capacity'],
            vehicleType: _formData['vehicle_type'],
            status: _formData['status'],
            terminalId: _formData['terminal_id'],
          );
          break;
        case 'drivers':
          await _dbService.updateDriver(
            driverNo: id,
            firstName: _formData['first_name'],
            lastName: _formData['last_name'],
            age: _formData['age'],
          );
          break;
        case 'conductors':
          await _dbService.updateConductor(
            conductorNo: id,
            firstName: _formData['first_name'],
            lastName: _formData['last_name'],
            age: _formData['age'],
          );
          break;
        case 'trips':
          await _dbService.updateTrip(
            tripNo: id,
            vehicleNo: _formData['vehicle_no'],
            startTerminalId: _formData['start_terminal_id'],
            endTerminalId: _formData['end_terminal_id'],
            driverNo: _formData['driver_no'],
            conductorNo: _formData['conductor_no'],
            status: _formData['status'],
            available: _formData['available'],
          );
          break;
      }

      widget.onUpdateComplete();
      Navigator.of(context).pop();
    } catch (e) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text('Update Failed'),
          content: Text(e.toString()),
          actions: [
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Widget _buildTextField(String label, String key, {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CupertinoTextField(
        placeholder: label,
        controller:
            TextEditingController(text: _formData[key]?.toString() ?? '')
              ..selection = TextSelection.fromPosition(
                TextPosition(offset: (_formData[key]?.toString() ?? '').length),
              ),
        onChanged: (text) {
          setState(() {
            _formData[key] = isNumber ? int.tryParse(text) ?? 0 : text;
          });
        },
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: CupertinoColors.systemGrey),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildFormFields() {
    switch (widget.tableName) {
      case 'terminals':
        return Column(
          children: [_buildTextField('Terminal Name', 'terminal_name')],
        );
      case 'vehicles':
        return Column(
          children: [
            _buildTextField('Plate Number', 'plate_no'),
            _buildTextField('Capacity', 'capacity', isNumber: true),
            _buildTextField('Vehicle Type', 'vehicle_type'),
            _buildTextField('Status', 'status'),
            _buildTextField('Terminal ID', 'terminal_id', isNumber: true),
          ],
        );
      case 'drivers':
        return Column(
          children: [
            _buildTextField('First Name', 'first_name'),
            _buildTextField('Last Name', 'last_name'),
            _buildTextField('Age', 'age', isNumber: true),
          ],
        );
      case 'conductors':
        return Column(
          children: [
            _buildTextField('First Name', 'first_name'),
            _buildTextField('Last Name', 'last_name'),
            _buildTextField('Age', 'age', isNumber: true),
          ],
        );
      case 'trips':
        return Column(
          children: [
            _buildTextField('Vehicle No', 'vehicle_no', isNumber: true),
            _buildTextField(
              'Start Terminal ID',
              'start_terminal_id',
              isNumber: true,
            ),
            _buildTextField(
              'End Terminal ID',
              'end_terminal_id',
              isNumber: true,
            ),
            _buildTextField('Driver No', 'driver_no', isNumber: true),
            _buildTextField('Conductor No', 'conductor_no', isNumber: true),
            _buildTextField('Available', 'available', isNumber: true),
          ],
        );
      default:
        return Text('Unsupported table: ${widget.tableName}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('Update ${widget.tableName.singularize()}'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            _buildFormFields(),
            if (_isLoading)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: CupertinoActivityIndicator(),
              ),
          ],
        ),
      ),
      actions: [
        CupertinoDialogAction(
          child: Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        CupertinoDialogAction(
          child: Text('Update'),
          onPressed: _isLoading ? null : _handleUpdate,
        ),
      ],
    );
  }
}

// Extension to handle singularizing table names
extension StringExtension on String {
  String singularize() {
    if (endsWith('s')) {
      return substring(0, length - 1);
    }
    return this;
  }
}
