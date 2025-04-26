import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VehiclesInTerminal extends StatefulWidget {
  const VehiclesInTerminal({super.key});

  @override
  State<VehiclesInTerminal> createState() => _VehiclesInTerminalState();
}

class _VehiclesInTerminalState extends State<VehiclesInTerminal> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      dividerThickness: 1,
      headingTextStyle: TextStyle(),
      border: TableBorder.all(),
      columns: <DataColumn>[
        DataColumn(
          label: Text("Vehicle No."),
          headingRowAlignment: MainAxisAlignment.center,
        ),
        DataColumn(
          label: Text("Driver"),
          headingRowAlignment: MainAxisAlignment.center,
        ),
        DataColumn(
          label: Text("Available"),
          headingRowAlignment: MainAxisAlignment.center,
        ),
        DataColumn(
          label: Text("Status"),
          headingRowAlignment: MainAxisAlignment.center,
        ),
      ],
      rows: <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(CupertinoButton(child: Text("0428"), onPressed: () {})),
            DataCell(CupertinoButton(child: Text("Ramon"), onPressed: () {})),
            DataCell(CupertinoButton(child: Text(""), onPressed: () {})),
            DataCell(Text('')),
          ],
        ),
      ],
    );
  }
}
