import 'package:flutter/cupertino.dart';

class TerminalImage extends StatelessWidget {
  const TerminalImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsetsGeometry.all(30),
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Placeholder(), // insert image here
      ),
    );
  }
}
