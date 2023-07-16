import 'package:flutter/material.dart';

import '../constants/constants.dart';

class NumberOfActivityAmountBox extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final String numberLabel;
  NumberOfActivityAmountBox({
    required this.numberLabel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      numberLabel,
      style: Theme.of(context)
          .textTheme
          .displayLarge !
          .copyWith(color: _appColors.scaffoldBackgroundColor),
    );
  }
}
