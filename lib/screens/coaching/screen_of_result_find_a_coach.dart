import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

import 'bodies/zbodies.dart';

class ScreenOfResultFindACoach extends StatelessWidget {
  static const String routeName = 'screen_of_result_find_a_coach';

  const ScreenOfResultFindACoach({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: ResultFindACoachBody(),
    );
  }
}
