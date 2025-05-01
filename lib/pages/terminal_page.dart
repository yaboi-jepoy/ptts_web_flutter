// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';
import 'package:PTTS/elements/db_tables.dart';
import 'package:PTTS/elements/terminal_image.dart';
import 'package:PTTS/database/database_service.dart';

class TerminalPage extends StatefulWidget {
  final String terminalID;
  final String terminalName;
  final bool showImage;

  const TerminalPage({
    super.key,
    required this.terminalID,
    required this.terminalName,
    this.showImage = false,
  });

  @override
  State<TerminalPage> createState() => _TerminalPageState();
}

class _TerminalPageState extends State<TerminalPage> {
  List<List<String>> trips = [];

  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final _trips = await DatabaseService.instance.showTrips(
      int.parse(widget.terminalID),
    );
    setState(() {
      trips = _trips;
      print(trips);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        middle: Text(
          '(${widget.terminalID}) ${widget.terminalName}',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.showImage == true) TerminalImage(),
                DbTables(
                  tableTitle: 'Available Vehicles',
                  tableColumns: [
                    'Trip#',
                    'Vehicle No.',
                    'From',
                    'To',
                    'Driver',
                    'Conductor',
                  ],
                  tableRows: trips,
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
