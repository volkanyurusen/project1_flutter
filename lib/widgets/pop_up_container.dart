import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';

class PopUpContainer extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final Widget child;
  final double? height;
  final double? width;

  PopUpContainer({
    required this.child,
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
