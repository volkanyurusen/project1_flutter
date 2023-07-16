import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';

class SendingButton extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppVisualConstants _appVisualConstants = AppVisualConstants();
  final VoidCallback sendMessageContent;

  SendingButton({
    Key? key,
    required this.sendMessageContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color buttonColor = _appColors.primary;
    final Color iconColor = _appColors.scaffoldBackgroundColor;

    return GestureDetector(
      onTap: sendMessageContent,
      child: Container(
          margin: _appVisualConstants.messageSendingIconMargin,
          padding: _appVisualConstants.messageContentBoxPadding,
          decoration: BoxDecoration(shape: BoxShape.circle, color: buttonColor),
          child: Icon(Icons.send_rounded, color: iconColor)),
    );
  }
}
