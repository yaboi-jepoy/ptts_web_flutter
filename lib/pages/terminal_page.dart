import 'package:flutter/cupertino.dart';
import 'package:ptts_web_flutter/elements/db_tables.dart';
import 'package:ptts_web_flutter/elements/terminal_image.dart';
import 'package:ptts_web_flutter/elements/vehicles_in_terminal.dart';

class TerminalPage extends StatelessWidget {
  final String terminalType;
  final String terminalName;

  const TerminalPage({
    super.key,
    required this.terminalType,
    required this.terminalName,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        middle: Text(
          '($terminalType) $terminalName',
          style: TextStyle(color: CupertinoColors.black),
        ),
        transitionBetweenRoutes: true,
        leading: CupertinoNavigationBarBackButton(
          previousPageTitle: "Terminals",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        trailing: FittedBox(
          fit: BoxFit.scaleDown,
          child: CupertinoButton(
            child: Text("About Terminal"),
            onPressed: () {},
          ),
        ),
      ),
      backgroundColor: CupertinoColors.white,
      resizeToAvoidBottomInset: true,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            // minWidth: MediaQuery.of(context).size.width * .35,
            maxWidth: MediaQuery.of(context).size.width * .75,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TerminalImage(),
                DbTables(
                  tableTitle: 'Available Vehicles',
                  tableColumns: [
                    'Trip#',
                    'Vehicle No.',
                    'From',
                    'To',
                    'Driver No.',
                    'Conductor No.',
                  ],
                  tableRows: [],
                  hideButton: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
