import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/widgets/widget.dart';

class MessageDateBox extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppVisualConstants _appVisualConstants = AppVisualConstants();
  final String dateDetail;
  final String dateDifference;

  MessageDateBox({
    required this.dateDetail,
    required this.dateDifference,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = _appColors.textColor.withOpacity(0.85);
    Color dateBoxColor = _appColors.secondary.withOpacity(0.15);
    TextStyle dateTextStyle = Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(fontWeight: FontWeight.bold, color: textColor);
    TextStyle dayDifferenceTextStyle =
        Theme.of(context).textTheme.bodyLarge!.copyWith(color: textColor);

    return Center(
      child: Container(
        padding: _appVisualConstants.messageBoxMargin,
        decoration: BoxDecoration(
            color: dateBoxColor,
            border: Border.all(width: 1, color: dateBoxColor),
            borderRadius: _appVisualConstants.borderRadiusCircular),
        child: CustomColumn(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppHeaderText(textLabel: dateDetail, textStyle: dateTextStyle),
            const CustomAppSizedBox(height: 2),
            AppHeaderText(
                textLabel: dateDifference, textStyle: dayDifferenceTextStyle),
          ],
        ),
      ),
    );
  }
}
