import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';

class MessageTextField extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppVisualConstants _appVisualConstants = AppVisualConstants();

  MessageTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color textFieldColor = _appColors.primaryColorDark.withOpacity(0.1);

    return Expanded(
      child: Container(
        padding: _appVisualConstants.messageTextFieldPadding,
        child: TextField(
          maxLines: null,
          decoration: InputDecoration(
              hintText: 'Message',
              border: InputBorder.none,
              filled: true,
              fillColor: textFieldColor),
        ),
      ),
    );
  }
}
