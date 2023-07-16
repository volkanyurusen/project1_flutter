import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';

class MessageTopHostImageBox extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final Widget child;
  final int numberOfAttendees;

  MessageTopHostImageBox({
    required this.numberOfAttendees,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.maxFinite,
        padding: const EdgeInsets.only(right: 13),
        decoration: BoxDecoration(
          border: Border(
              right: BorderSide(
                  width: 1.5,
                  color: numberOfAttendees > 5
                      ? _appColors.primary.withOpacity(0.3)
                      : _appColors.primary.withOpacity(0.0))),
        ),
        child: child);
  }
}
