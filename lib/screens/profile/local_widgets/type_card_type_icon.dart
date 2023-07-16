import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';

class TypeCardTypeIcon extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final Widget child;

  TypeCardTypeIcon({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    Color whiteColor = _appColors.scaffoldBackgroundColor;

    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2.0, color: whiteColor),
        ),
        child: child);
  }
}
