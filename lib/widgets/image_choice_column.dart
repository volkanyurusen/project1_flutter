import 'package:flutter/material.dart';

import 'widget.dart';

class ImageChoiceColumn extends StatelessWidget {
  final Widget imageWidget;
  final String username;
  final String distance;
  final TextStyle? textStyle;
  const ImageChoiceColumn({
    required this.imageWidget,
    required this.username,
    required this.distance,
    this.textStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomAppSizedBox(height: 9),
        imageWidget,
        const CustomAppSizedBox(height: 5),
        Column(
          children: [
            AppHeaderText(
                textLabel: username.length > 10
                    ? '${username.substring(0, 9)}...'
                    : username,
                textStyle: textStyle ?? Theme.of(context).textTheme.bodyLarge),
            const CustomAppSizedBox(height: 5),
            AppHeaderText(
                textLabel: distance,
                textStyle: textStyle ?? Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }
}
