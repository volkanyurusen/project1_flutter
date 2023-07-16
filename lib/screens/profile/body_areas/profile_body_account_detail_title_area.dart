import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class ProfileBodyAccountDetailTitleArea extends StatelessWidget {
  const ProfileBodyAccountDetailTitleArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        const AppHeader(
            firstWidget: AppHeaderText(textLabel: 'Account Details')),
        CustomAppDivider(),
      ],
    );
  }
}
