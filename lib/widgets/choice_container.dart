import 'package:flutter/material.dart';
import 'package:my_project/constants/app_colors.dart';
import 'package:my_project/constants/app_constants.dart';

class ChoiceContainer extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppVisualConstants _appVisualConstants = AppVisualConstants();
  final String containerText;
  final Color? buttonColor;
  final Color? buttonBorderColor;
  final Color? labelColor;
  final VoidCallback? onTap;
  final TextStyle? labelStyle;

  ChoiceContainer({
    required this.containerText,
    this.buttonColor,
    this.buttonBorderColor,
    this.labelColor,
    required this.onTap,
    this.labelStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minWidth: 60),
        decoration: BoxDecoration(
          color: buttonColor ?? _appColors.selectedButtonColor,
          border: Border.all(
              color: buttonBorderColor ?? _appColors.selectedContainerColor),
          borderRadius: _appVisualConstants.borderRadiusCircular,
        ),
        padding: const EdgeInsets.all(10.0),
        child: Text(
          containerText,
          style: labelStyle ??
              Theme.of(context)
                  .textTheme
                  .headlineSmall !
                  .copyWith(color: labelColor ?? _appColors.selectedLabelColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
