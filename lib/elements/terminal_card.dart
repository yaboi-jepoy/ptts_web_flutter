import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptts_web_flutter/pages/terminal_page.dart';

class TerminalCard extends StatelessWidget {
  final String terminalName;
  final String terminalType;

  const TerminalCard({
    super.key,
    required this.terminalName,
    required this.terminalType,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            // ignore: avoid_print
            print("push to $terminalType - $terminalName");
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder:
                    (context) => TerminalPage(
                      terminalType: terminalType,
                      terminalName: terminalName,
                    ),
              ),
            );
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
                              terminalType,
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
