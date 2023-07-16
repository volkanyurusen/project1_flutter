import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';

import 'widget.dart';

class CircleImageChoiceColumn extends StatelessWidget {
  final AppColors _appColors = AppColors();

  final String heroTag;
  final Widget imageWidget;
  final String firstLabel;
  final TextStyle? textStyle;
  final String secondLabel;
  final double? additionalSpaceOnBottom;
  final bool isResponded;

  CircleImageChoiceColumn({
    required this.heroTag,
    required this.imageWidget,
    required this.firstLabel,
    required this.secondLabel,
    this.textStyle,
    this.additionalSpaceOnBottom,
    this.isResponded = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? bodyLarge = context.textTheme.bodyLarge;
    TextStyle? bodyLargeResponded =
        context.textTheme.bodyLarge!.copyWith(color: _appColors.secondary);

    return CustomColumn(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomAppSizedBox(),
        Hero(tag: heroTag, child: imageWidget),
        const CustomAppSizedBox(height: 9),
        Column(
          children: [
            CustomRow(
              children: [
                AppHeaderText(
                    textLabel: firstLabel,
                    textStyle: textStyle ??
                        (isResponded ? bodyLargeResponded : bodyLarge)),
                const CustomAppSizedBox(width: 5),
              ],
            ),
            AppHeaderText(
                textLabel: secondLabel,
                textStyle: textStyle ??
                    (isResponded ? bodyLargeResponded : bodyLarge)),
          ],
        ),
        SizedBox(height: additionalSpaceOnBottom ?? 0),
      ],
    );
  }
}
