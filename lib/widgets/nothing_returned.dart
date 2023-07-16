import 'package:flutter/material.dart';

import '../constants/constants.dart';

class NothingReturned extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final TextStyle? textStyle;
  NothingReturned({
    this.textStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '?!',
        style: textStyle ??
            Theme.of(context)
                .textTheme
                .displayMedium !
                .copyWith(color: _appColors.textColor),
      ),
    );
  }
}
