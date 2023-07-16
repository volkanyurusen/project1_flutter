import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/widgets/widget.dart';

class LoadSuccessfullyAlertDialog extends StatelessWidget {
  final String? title;
  final String? content;

  const LoadSuccessfullyAlertDialog({this.title, this.content, super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle? titleStyle = context.textTheme.headlineMedium;
    TextStyle? contentStyle = context.textTheme.titleSmall;

    return AlertDialog(
      title: AppHeaderText(
          textLabel: title ?? "Information", textStyle: titleStyle),
      content: AppHeaderText(
          textLabel:
              content ?? "The new template has been added in the database",
          textStyle: contentStyle),
    );
  }
}
