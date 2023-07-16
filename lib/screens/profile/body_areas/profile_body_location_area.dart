import 'package:flutter/material.dart';
import 'package:my_project/screens/profile/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class ProfileBodyLocationArea extends StatelessWidget {
  final TextStyle headlineMedium;
  final TextStyle titleHeadline;

  const ProfileBodyLocationArea({
    required this.headlineMedium,
    required this.titleHeadline,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomColumn(children: [
      AppHeaderText(textLabel: 'Location', textStyle: titleHeadline),
      CustomAppDivider(),
      const CustomAppSizedBox(height: 20),
      GestureDetector(
          onTap: () {
            _goToLocationDetailsScreen(context);
          },
          child: AppHeaderText(
              textLabel: 'Location Detail', textStyle: headlineMedium)),
      const CustomAppSizedBox(height: 40),
    ]);
  }

  _goToLocationDetailsScreen(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenOfLocationDetails.routeName);
  }
}
