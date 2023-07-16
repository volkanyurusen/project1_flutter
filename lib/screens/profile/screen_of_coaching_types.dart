import 'package:flutter/material.dart';
import 'package:my_project/screens/profile/bodies/zbodies.dart';
import 'package:my_project/screens/profile/local_widgets/zlocal_widget.dart';

class ScreenOfCoachingTypes extends StatelessWidget {
  static const String routeName = 'screen_of_coaching_types';

  const ScreenOfCoachingTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ProfilePageAppBar(titleText: 'Coaching Types'),
        body: CoachingTypesBody());
  }
}
