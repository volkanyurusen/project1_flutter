import 'package:flutter/material.dart';

class AppHeaderText extends StatelessWidget {
  final String textLabel;
  final TextStyle? textStyle;
  final TextOverflow? overflow;

  const AppHeaderText({
    required this.textLabel,
    this.textStyle,
    this.overflow,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(textLabel,
        overflow: TextOverflow.clip,
        style: textStyle ?? Theme.of(context).textTheme.headlineSmall);
  }
}
