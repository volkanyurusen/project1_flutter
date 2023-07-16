import 'package:flutter/material.dart';

class SelectionAlertDialog extends StatelessWidget {
  final String? alertTitle;
  final String alertLabel;
  final String? textButtonLabel;
  const SelectionAlertDialog({
    required this.alertLabel,
    this.alertTitle = 'Alert',
    this.textButtonLabel = 'OK',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(alertTitle!),
      content: Text(alertLabel),
      actions: [
        TextButton(
          child: Text(textButtonLabel!),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}