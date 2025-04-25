import 'package:flutter/cupertino.dart';

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
        middle: Text(
          '($terminalType) $terminalName',
          style: TextStyle(color: CupertinoColors.black),
        ),
        transitionBetweenRoutes: true,
        leading: CupertinoButton(
          child: Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        trailing: CupertinoButton(
          child: Text("More Details"),
          onPressed: () {},
        ),
      ),
      backgroundColor: CupertinoColors.white,
      child: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .5,
            height: MediaQuery.of(context).size.height * .5,
            child: Placeholder(),
          ), // placeholder for image
        ],
      ),
    );
  }
}
