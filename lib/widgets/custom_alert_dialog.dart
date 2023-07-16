import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';

class CustomAlertDialog extends StatelessWidget {
  final AppTextStyleConstants _appTextStyleConstants = AppTextStyleConstants();
  final String contextText;
  final String? buttonText;
  final void Function()? onPressed;

  CustomAlertDialog(
      {super.key, required this.contextText, this.onPressed, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return _createAlertDialog(context);
  }

  // ALERT DIALOG ======================================================================================================
  // CREATE ============================================================================================================
  AlertDialog _createAlertDialog(BuildContext context) {
    return AlertDialog(
      title: _createTitleArea(),
      content: _createContentArea(),
      actions: [
        _createButtonArea(context),
      ],
    );
  }

  // TITLE AREA ========================================================================================================
  // CREATE ============================================================================================================
  Text _createTitleArea() =>
      Text('Information', style: _appTextStyleConstants.titleTextStyle);

  // CONTENT AREA ======================================================================================================
  // CREATE ============================================================================================================
  Text _createContentArea() =>
      Text(contextText, style: _appTextStyleConstants.contentTextStyle);

  // BUTTON AREA =======================================================================================================
  // CREATE ============================================================================================================
  TextButton _createButtonArea(BuildContext context) => TextButton(
      onPressed: onPressed,
      child: Text(buttonText ?? 'OK',
          style: _appTextStyleConstants.actionTextStyle));
}
