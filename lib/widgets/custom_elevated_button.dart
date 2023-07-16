import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final AppVisualConstants _appVisualConstants = AppVisualConstants();
  final VoidCallback? onPressed;
  final Color? buttonColor;
  final double? elevatedButtonWidth;
  final String textlabel;
  final TextStyle? textStyle;

  CustomElevatedButton({
    required this.textlabel,
    required this.onPressed,
    this.elevatedButtonWidth,
    this.buttonColor,
    this.textStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? bodyLarge = context.textTheme.displaySmall!
        .copyWith(color: Theme.of(context).scaffoldBackgroundColor);
    Color secondaryColor = Theme.of(context).colorScheme.secondary;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? secondaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: _appVisualConstants.borderRadiusCircular)),
      child: Container(
        width: elevatedButtonWidth ?? double.infinity,
        alignment: Alignment.center,
        margin: _appVisualConstants.verticalMargin,
        child: Text(textlabel, style: textStyle ?? bodyLarge),
      ),
    );
  }
}
