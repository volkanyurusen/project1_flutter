import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class HomeScreenChoiceContainer extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final BorderRadiusGeometry borderRadius;
  final Widget child;
  HomeScreenChoiceContainer({
    required this.borderRadius,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: (screenWidth - 100) / 2,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: _appColors.unselectedContainerColor),
        borderRadius: borderRadius,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: child,
    );
  }
}
