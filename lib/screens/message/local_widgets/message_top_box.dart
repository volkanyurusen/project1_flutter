import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';

class MessageTopBox extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppVisualConstants _appVisualConstants = AppVisualConstants();
  final Widget child;

  MessageTopBox({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 76,
        padding: _appVisualConstants.messageBoxMargin,
        decoration: BoxDecoration(
            color: _appColors.primary.withOpacity(0.2),
            border:
                Border(top: _createBorderSide(), bottom: _createBorderSide())),
        child: child);
  }

  BorderSide _createBorderSide() {
    return BorderSide(width: 1, color: _appColors.primary.withOpacity(0.5));
  }
}
