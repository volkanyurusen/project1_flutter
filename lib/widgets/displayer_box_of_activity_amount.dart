import 'package:flutter/material.dart';

import '../constants/constants.dart';

class DisplayerBoxOfActivityAmount extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppVisualConstants _appVisualConstants = AppVisualConstants();
  final double screenWidth;
  final Widget widget;

  DisplayerBoxOfActivityAmount({
    required this.screenWidth,
    required this.widget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor.withOpacity(0.75);

    return Container(
      height: 100,
      width: (screenWidth - (18 * 3)) / 2,
      decoration: BoxDecoration(
        color: primaryColor,
        border: Border.all(color: _appColors.primaryColor.withOpacity(0.75)),
        borderRadius: _appVisualConstants.borderRadiusSmallCircular,
      ),
      child: widget,
    );
  }
}
