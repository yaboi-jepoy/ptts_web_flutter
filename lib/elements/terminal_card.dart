import 'package:PTTS/database/database_service.dart';
import 'package:PTTS/pages/terminal_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TerminalCard extends StatelessWidget {
  final String terminalName;
  final String terminalID;

  const TerminalCard({
    super.key,
    required this.terminalName,
    required this.terminalID,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: CupertinoButton(
          onPressed: () async {
            // ignore: avoid_print
            print("push to $terminalID - $terminalName");
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => TerminalPage(
                  terminalID: terminalID,
                  terminalName: terminalName,
                ),
              ),
            );

            final trips = await DatabaseService.instance.showTrips(
              int.parse(terminalID),
            );
            print(int.parse(terminalID));
          },
          child: Card(
            borderOnForeground: true,
            color: CupertinoColors.white,
            elevation: 8,
            shadowColor: Colors.black,
            child: SizedBox(
              height: 235,
              width: 165,
              child: Padding(
                padding: EdgeInsetsGeometry.all(12),
                // per item
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    // image
                    SizedBox(
                      height: 150,
                      child: Placeholder(),
                    ), // replace with image
                    SizedBox(
                      height: 61,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              terminalID,
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: CupertinoColors.systemGrey,
                              ),
                            ),
                            Text(
                              terminalName,
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: CupertinoColors.activeBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
