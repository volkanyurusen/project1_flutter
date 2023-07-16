import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

import 'bodies/zbodies.dart';

class ScreenOfChosenTraineeWhoCreatedRequest extends StatelessWidget {
  static const String routeName =
      'screen_of_chosen_trainee_who_created_request';

  const ScreenOfChosenTraineeWhoCreatedRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ChosenTraineeWhoCreatedRequestBody(),
    );
  }
}
