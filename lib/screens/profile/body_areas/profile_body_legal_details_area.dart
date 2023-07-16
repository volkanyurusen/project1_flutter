import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class ProfileBodyLegalDetailsArea extends StatelessWidget {
  final TextStyle headlineMedium;
  final TextStyle titleHeadline;

  const ProfileBodyLegalDetailsArea({
    required this.headlineMedium,
    required this.titleHeadline,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomColumn(children: [
      AppHeaderText(textLabel: 'Legal Settings', textStyle: titleHeadline),
      CustomAppDivider(),
      const CustomAppSizedBox(height: 20),
      GestureDetector(
          onTap: () {
            if (kDebugMode) {
              print('Legal details button is clicked!!!');
            }
          },
          child: AppHeaderText(
              textLabel: 'Legal Details', textStyle: headlineMedium)),
      const CustomAppSizedBox(height: 40),
    ]);
  }
}
