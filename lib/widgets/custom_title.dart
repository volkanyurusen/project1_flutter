import 'package:flutter/material.dart';

import 'widget.dart';

class CustomTitle extends StatelessWidget {
  final double spaceFromUpperWidget;
  final String textLabel;
  final Widget? tileWidget;

  const CustomTitle({
    required this.spaceFromUpperWidget,
    required this.textLabel,
    this.tileWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppHeader(
          spaceFromUpperWidget: spaceFromUpperWidget,
          firstWidget: AppHeaderText(textLabel: textLabel),
          thirdWidget: tileWidget ?? const SizedBox(),
        ),
        CustomAppDivider(),
      ],
    );
  }
}


// OLD VERSION
// class CustomTitle extends StatelessWidget {
//   final double spaceFromUpperWidget;
//   final String textLabel;
//   const CustomTitle({
//     required this.spaceFromUpperWidget,
//     required this.textLabel,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AppHeader(
//         spaceFromUpperWidget: spaceFromUpperWidget,
//         firstWidget: AppHeaderText(textLabel: textLabel));
//   }
// }
