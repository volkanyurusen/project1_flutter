import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class ProfileBodySupportArea extends StatelessWidget {
  final TextStyle headlineMedium;
  final TextStyle titleHeadline;

  const ProfileBodySupportArea({
    required this.headlineMedium,
    required this.titleHeadline,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomColumn(children: [
      AppHeaderText(textLabel: 'Support', textStyle: titleHeadline),
      CustomAppDivider(),
      const CustomAppSizedBox(height: 20),
      GestureDetector(
          onTap: () {
            if (kDebugMode) {
              print('Support button is clicked!!!');
            }
          },
          child:
              AppHeaderText(textLabel: 'Feedback', textStyle: headlineMedium)),
      const CustomAppSizedBox(height: 40),
    ]);
  }
}
