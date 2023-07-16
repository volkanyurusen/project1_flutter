import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/widgets/widget.dart';

class MessageContentAreaNoMessage extends StatelessWidget {
  final AppColors _appColors = AppColors();

  MessageContentAreaNoMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle titleLarge = Theme.of(context)
        .textTheme
        .titleLarge!
        .copyWith(color: _appColors.textColor.withOpacity(0.8));

    return Expanded(
        child: SizedBox(
      child: Center(
        child: AppHeaderText(
          textLabel: 'There is no message yet',
          textStyle: titleLarge,
        ),
      ),
    ));
  }
}
