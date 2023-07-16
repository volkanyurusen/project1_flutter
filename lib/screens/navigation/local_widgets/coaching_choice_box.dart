import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';

class CoachingChoiceBox extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final double height;
  final double width;
  final String boxName;
  final TextStyle? textStyle;
  CoachingChoiceBox({
    required this.height,
    required this.width,
    required this.boxName,
    required this.textStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: _appColors.primary.withOpacity(0.75),
          border: Border(
              bottom:
                  BorderSide(width: 1.0, color: _appColors.backgroundColor))),
      child: Center(
        child: Text(
          boxName,
          style: textStyle!.copyWith(color: _appColors.backgroundColor),
        ),
      ),
    );
  }
}
