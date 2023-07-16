import 'package:flutter/material.dart';

import '../constants/constants.dart';

/// LaunchingScreen and ShowResultsScreen are example for this widget!!!
class RichTextWithMultipleRows extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final TextAlign textAlign;
  final String firstText;
  // final Color colorOfFirstText;
  final String secondText;
  final Color? colorOfSecondText;
  final TextStyle textStyle;
  final FontWeight? secondTextFontWeight;
  final TextDecoration? textDecoration;
  final TextDecorationStyle? textDecorationStyle;
  final double? sizeOfdecorationThickness;

  RichTextWithMultipleRows({
    required this.firstText,
    // required this.colorOfFirstText,
    required this.secondText,
    required this.textStyle,
    this.colorOfSecondText,
    this.secondTextFontWeight,
    this.textAlign = TextAlign.left,
    this.textDecorationStyle,
    this.textDecoration,
    this.sizeOfdecorationThickness,
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        text: firstText,
        style: textStyle,
        children: <TextSpan>[
          TextSpan(
            text: secondText,
            style: TextStyle(
                color: colorOfSecondText ?? _appColors.textColor,
                decoration: textDecoration ?? TextDecoration.none,
                decorationStyle: textDecorationStyle,
                decorationThickness: sizeOfdecorationThickness,
                decorationColor: colorOfSecondText ?? _appColors.textColor,
                fontWeight: secondTextFontWeight ?? FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
