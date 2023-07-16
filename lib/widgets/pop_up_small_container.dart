import 'package:flutter/material.dart';

import '../constants/constants.dart';

class PopUpSmallContainer extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final Widget child;
  final double? height;
  final double? width;

  PopUpSmallContainer({
    required this.child,
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = context.height * 0.55;
    double width = context.width * 0.90;

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: _appColors.backgroundColor),
      child: child,
    );
  }
}
