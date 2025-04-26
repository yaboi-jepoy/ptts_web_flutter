import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DbTables extends StatefulWidget {
  const DbTables({
    super.key,
    required this.tableTitle,
    required this.tableColumns,
    required this.tableRows,
    required this.buttonPopup,
  });

  final String tableTitle;
  final List<String> tableColumns;
  final List<List<String>> tableRows;
  final Widget buttonPopup;

  @override
  State<DbTables> createState() => _DbTablesState();
}

class _DbTablesState extends State<DbTables> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Title
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            widget.tableTitle,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.black,
            ),
          ),
        ),
        // Table
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: WidgetStateProperty.all(Colors.grey[200]),
            columns:
                widget.tableColumns
                    .map(
                      (colName) => DataColumn(
                        label: Text(
                          colName,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                    .toList(),
            rows:
                widget.tableRows.map((row) {
                  return DataRow(
                    cells:
                        row
                            .map((cellValue) => DataCell(Text(cellValue)))
                            .toList(),
                  );
                }).toList(),
          ),
        ),
        // Button
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * .15,
            maxHeight: MediaQuery.of(context).size.height * .15,
          ),
          child: CupertinoButton(
            onPressed: () {
              showCupertinoDialog(
                barrierDismissible: true,
                context: context,
                builder: (_) => widget.buttonPopup,
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.add_circled),
                Text(' Add ${widget.tableTitle}'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
