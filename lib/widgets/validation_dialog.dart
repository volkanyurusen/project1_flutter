import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/widgets/widget.dart';

class ValidationDialog extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final Widget child;
  final num ratioOfScreen;

  ValidationDialog({
    required this.child,
    this.ratioOfScreen = 0.25,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBackDropFilter(
      child: PopUpDialog(
        child: Container(
          height: context.height * ratioOfScreen,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: _appColors.backgroundColor),
          child: AppBody(child: child),
        ),
      ),
    );
  }
}
