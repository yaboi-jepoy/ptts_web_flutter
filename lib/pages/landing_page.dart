// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';
import 'package:PTTS/elements/terminal_card.dart';
import 'admin_page.dart';
import 'package:responsive_layout_grid/responsive_layout_grid.dart';
import 'package:PTTS/database/database_service.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

// access database

class _LandingPageState extends State<LandingPage> {
  List<List<String>> terminalRows = [];

  @override
  void initState() {
    super.initState();
    loadTerminals();
    print(terminalRows);
  }

  void loadTerminals() async {
    final rows = await DatabaseService.instance.getTerminals();
    setState(() {
      terminalRows = rows;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: FittedBox(
          fit: BoxFit.scaleDown,
          child: CupertinoButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => AdminPage()),
              ).then((_) => loadTerminals());
            },
            child: Text(
              "Admin",
              style: TextStyle(color: CupertinoColors.systemBlue),
            ),
          ),
        ),
        middle: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Public Transport TimeTable System',
            style: TextStyle(color: CupertinoColors.black, fontSize: 24),
          ),
        ),
      ),

      backgroundColor: CupertinoColors.white,
      child: Center(
        child: ResponsiveLayoutGrid(
          maxNumberOfColumns: 4,
          layoutFactory: DefaultLayoutFactory(),
          minimumColumnWidth: 165,
          children: terminalRows.isEmpty
              ? [Text('No Terminals in Database')]
              : [
                  ...List.generate(
                    terminalRows.length,
                    (index) => ResponsiveLayoutCell(
                      child: TerminalCard(
                        terminalID: terminalRows[index][0],
                        terminalName: terminalRows[index][1],
                      ),
                    ),
                  ),
                ],
        ),
      ),
    );
  }
}
