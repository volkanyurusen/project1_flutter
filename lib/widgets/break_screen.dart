import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/widgets/widget.dart';

class BreakScreen extends StatelessWidget {
  final AppColors _appColors = AppColors();

  final Widget? button;
  final String detailLabel;
  final double screenHeight;
  // final

  BreakScreen({
    this.button,
    required this.detailLabel,
    required this.screenHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.warning_amber,
            size: 100, color: _appColors.secondary.withOpacity(0.75)),
        Column(
          children: [
            AppHeaderText(
                textLabel: 'OPPS!!!',
                textStyle: TextStyle(
                    fontSize: 36,
                    color: _appColors.textColor.withOpacity(0.75))),
            const CustomAppSizedBox(),
            InformationAboutExisting(detailLabel: detailLabel),
          ],
        ),
        button ?? const CustomAppSizedBox(),
        const CustomAppSizedBox(),
      ],
    );
  }
}
