import 'package:flutter/material.dart';
import 'package:my_project/screens/profile/bodies/zbodies.dart';
import 'package:my_project/screens/profile/local_widgets/zlocal_widget.dart';

class ScreenOfCoachingTypeDetails extends StatelessWidget {
  static const String routeName = 'screen_of_coaching_type_details';

  const ScreenOfCoachingTypeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfilePageAppBar(titleText: 'Coaching Type Details'),
      body: const CoachingTypeDetailsBody(),
    );
  }
}
