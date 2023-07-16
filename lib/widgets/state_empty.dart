import 'package:flutter/material.dart';

import '../constants/constants.dart';

class StateEmpty extends StatelessWidget {
  final _appColors = AppColors();

  StateEmpty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'A temporary issue has just occurred. Please try again later.',
        style: context.textTheme.headlineSmall!
            .copyWith(color: _appColors.textColor.withOpacity(0.7)),
      ),
    );
  }
}
