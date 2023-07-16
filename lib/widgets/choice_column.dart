import 'package:flutter/material.dart';

class ChoiceColumn extends StatelessWidget {
  final Color containerColor;
  final String headerLabel;
  final TextStyle? headerLabelTextStyle;
  final String detailLabel;
  final TextStyle? detailLabelTextStyle;
  final Icon? icon;
  final Widget? widget;

  const ChoiceColumn({
    required this.containerColor,
    required this.headerLabel,
    required this.detailLabel,
    this.headerLabelTextStyle,
    this.detailLabelTextStyle,
    this.icon,
    this.widget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge!;
    TextStyle? bodyMedium = Theme.of(context).textTheme.bodyMedium!;
    return Column(
      children: [
        Container(
          color: containerColor,
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  icon ?? const SizedBox(),
                  //below width was 10 and I updated it because on the screenUserCardDetail username and user
                  //activitylevel was 10 pixel rght, it wasn't touch the most left side. I quickly checked and it
                  //haven't cause any issue at the other part.
                  const SizedBox(width: 0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(headerLabel,
                          style: headerLabelTextStyle ?? titleLarge),
                      Text(detailLabel,
                          style: detailLabelTextStyle ?? bodyMedium)
                    ],
                  ),
                ],
              ),
              widget ?? const SizedBox(),
            ],
          ),
        ),
        const SizedBox(height: 5)
      ],
    );
  }
}
