import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final TabController tabController;

  const CustomFloatingActionButton({
    Key? key,
    required this.appColors,
    required this.tabController,
  }) : super(key: key);

  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.play_arrow,
        size: 50.0,
        color: appColors.scaffoldBackgroundColor,
      ),
      onPressed: () {
        tabController.animateTo(tabController.index + 1);
        if (kDebugMode) {
          print('Button has been clicked');
        }
      },
    );
  }
}
