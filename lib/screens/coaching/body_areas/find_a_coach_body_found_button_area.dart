import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/screens/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class FindACoachBodyFoundButtonArea extends StatelessWidget {
  final AppColors _appColors = AppColors();

  FindACoachBodyFoundButtonArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        const CustomAppSizedBox(),
        _foundCoachesButton(context),
      ],
    );
  }

  CustomElevatedButton _foundCoachesButton(BuildContext context) =>
      CustomElevatedButton(
          textlabel: 'Go found coaches',
          buttonColor: _appColors.buttonDarkColor,
          onPressed: () {
            goToScreenOfFoundCoaches(context);
          });

  void goToScreenOfFoundCoaches(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenOfFoundCoaches.routeName);
  }
}
