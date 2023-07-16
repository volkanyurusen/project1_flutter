import 'package:flutter/material.dart';

import 'widget.dart';

class CircleImageDetailedChoiceColumn extends StatelessWidget {
  final Widget imageWidget;
  final String firstLabel;
  final Icon? icon;
  final String secondLabel;
  final TextStyle? textStyle;
  final double? additionalSpaceOnBottom;
  
  const CircleImageDetailedChoiceColumn({
    required this.imageWidget,
    required this.firstLabel,
    this.icon,
    required this.secondLabel,
    this.textStyle,
    this.additionalSpaceOnBottom,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? bodyLarge = Theme.of(context).textTheme.bodyLarge;

    return CustomColumn(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomAppSizedBox(),
        imageWidget,
        const CustomAppSizedBox(height: 9),
        Column(
          children: [
            CustomRow(
              children: [
                AppHeaderText(
                    textLabel: firstLabel, textStyle: textStyle ?? bodyLarge),
                const CustomAppSizedBox(width: 5),
                icon ?? const SizedBox(),
              ],
            ),
            AppHeaderText(
                textLabel: secondLabel, textStyle: textStyle ?? bodyLarge),
          ],
        ),
        SizedBox(height: additionalSpaceOnBottom ?? 0),
      ],
    );
  }
}
