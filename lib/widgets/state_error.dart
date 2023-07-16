import 'package:flutter/material.dart';

import '../constants/constants.dart';

class StateError extends StatelessWidget {
  final AppColors _appColors = AppColors();

  final String error;

  StateError({
    required this.error,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Error occured: $error',
        style: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(color: _appColors.seedColor),
      ),
    );
  }
}
