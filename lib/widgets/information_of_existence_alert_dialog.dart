import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/widgets/widget.dart';

class InformationOfExistenceAlertDialog extends StatelessWidget {
  final String detail;
  final int pageNumberThatWillBeClosed;

  const InformationOfExistenceAlertDialog({
    required this.detail,
    this.pageNumberThatWillBeClosed = 1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle? titleStyle = context.textTheme.headlineMedium;
    TextStyle? contentStyle = context.textTheme.titleSmall;

    return AlertDialog(
      title: AppHeaderText(textLabel: "Information", textStyle: titleStyle),
      content: AppHeaderText(
          textLabel:
              "The $detail which you chose exists. Please choose another $detail",
          textStyle: contentStyle),
      actions: [
        TextButton(
          child: const Text("OK"),
          onPressed: () {
            _closePopUp(context);
          },
        ),
      ],
    );
  }

  void _closePopUp(BuildContext context) {
    int pageCount = 0;
    Navigator.of(context)
        .popUntil((_) => pageCount++ >= pageNumberThatWillBeClosed);
  }
}
