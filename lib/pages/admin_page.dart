import 'package:flutter/cupertino.dart';
import 'package:ptts_web_flutter/elements/db_tables.dart';
import 'package:ptts_web_flutter/elements/sample_data.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        previousPageTitle: 'Landing Page',
        middle: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "Administrator",
            style: TextStyle(color: CupertinoColors.black),
          ),
        ),
      ),
      backgroundColor: CupertinoColors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * .75,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DbTables(
                tableTitle: 'Vehicles',
                tableColumns: ['Vehicle No.', 'Plate', 'Capacity'],
                tableRows: vehicles,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
