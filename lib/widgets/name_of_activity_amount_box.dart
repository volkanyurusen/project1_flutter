import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

import '../constants/constants.dart';

class NameOfActivityAmountBox extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppVisualConstants _appVisualConstants = AppVisualConstants();
  final String boxLabel;
  NameOfActivityAmountBox({
    required this.boxLabel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? headline3 = Theme.of(context).textTheme.displaySmall!;
    Color? color = _appColors.scaffoldBackgroundColor.withOpacity(0.45);

    return Padding(
      padding: _appVisualConstants.horizontalMargin,
      child: AppHeader(
        firstWidget: AppHeaderText(
          textLabel: boxLabel,
          textStyle: headline3.copyWith(color: color),
        ),
        thirdWidget: Icon(Icons.content_paste, color: color),
      ),
    );
  }
}

// Icons.auto_awesome_motion
// Icons.content_copy
