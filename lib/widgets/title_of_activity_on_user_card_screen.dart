import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'widget.dart';

class TitleOfActivityOnUserCardScreen extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final String title;
  TitleOfActivityOnUserCardScreen({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleTextStyle = context.textTheme.titleLarge!.copyWith(
        color: _appColors.textColor.withOpacity(0.75),
        decoration: TextDecoration.underline);

    return AppHeader(
      spaceFromUpperWidget: 0,
      firstWidget: AppHeaderText(textLabel: title, textStyle: titleTextStyle),
    );
  }
}
