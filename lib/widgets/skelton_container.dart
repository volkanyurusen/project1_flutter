import 'package:flutter/material.dart';

import '../constants/constants.dart';

class SkeltonContainer extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppVisualConstants _appVisualConstants = AppVisualConstants();

  final double height;
  final double width;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;

  SkeltonContainer({
    required this.height,
    required this.width,
    this.borderRadius,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: color ?? _appColors.unselectedContainerColor.withOpacity(0.4),
          borderRadius:
              borderRadius ?? _appVisualConstants.borderRadiusCircular),
    );
  }
}
