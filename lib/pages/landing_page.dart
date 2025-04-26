// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';
import 'package:ptts_web_flutter/elements/terminal_card.dart';
import 'package:ptts_web_flutter/pages/admin_page.dart';
import 'package:ptts_web_flutter/services/database_service.dart';
import 'package:responsive_layout_grid/responsive_layout_grid.dart';
import 'package:ptts_web_flutter/elements/sample_data.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

// access database
final DatabaseService _databaseService = DatabaseService.instance;

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: FittedBox(
          fit: BoxFit.scaleDown,
          child: CupertinoButton(
            onPressed: () {
              // ignore: avoid_print
              print("sup gay fucker");
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => AdminPage()),
              );
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
          children: [
            ...List.generate(
              terminals.length,
              (index) => ResponsiveLayoutCell(
                child: TerminalCard(
                  terminalType: terminals[index][0],
                  terminalName: terminals[index][1],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
