import 'package:flutter/material.dart';

class InsertDialog extends StatelessWidget {
  const InsertDialog({super.key, required this.dialogTitle});

  final String dialogTitle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(title: Text(dialogTitle));
  }
}
