import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';

class CustomAppDivider extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final double? height;
  final Color? divColor;

  CustomAppDivider({
    this.height = 18,
    this.divColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      color: divColor ?? _appColors.dividerColor,
    );
  }
}
