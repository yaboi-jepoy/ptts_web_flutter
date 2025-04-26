import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptts_web_flutter/elements/terminal_image.dart';
import 'package:ptts_web_flutter/elements/vehicles_in_terminal.dart';

// sample data
var vehicles = [
  ["039", "Ramon", "3", "Loading"],
  ["29", "Juniper", "18", "Idle"],
  ["43", "Antonio", "18", "Idle"],
];

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
            child: Column(children: [TerminalImage(), VehiclesInTerminal()]),
          ),
        ),
      ),
    );
  }
}
