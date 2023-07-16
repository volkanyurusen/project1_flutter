import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';

import 'bodies/zbodies.dart';
import 'local_widgets/zlocal_widget.dart';
import 'pop_ups/zpop_ups.dart';

class ScreenOfCoachingDetails extends StatelessWidget {
  static const String routeName = 'screen_of_coaching_details';
  final AppColors _appColors = AppColors();

  ScreenOfCoachingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final CoachBloc coachBloc = context.read<CoachBloc>();
    final CoachDynamicBloc coachDynamicBloc = context.read<CoachDynamicBloc>();

    final Color lightTextColor = _appColors.textColor.withOpacity(0.75);
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar:
            _createAppBar(context, coachBloc, coachDynamicBloc, lightTextColor),
        body: CoachingDetailsBody(
            coachBloc: coachBloc, coachDynamicBloc: coachDynamicBloc));
  }

  /// CREATE ===========================================================================================================
  ProfilePageAppBar _createAppBar(
    BuildContext context,
    CoachBloc coachBloc,
    CoachDynamicBloc coachDynamicBloc,
    Color lightTextColor,
  ) =>
      ProfilePageAppBar(
        titleText: 'Coaching Details',
        icon: IconButton(
            icon: Icon(Icons.edit, color: lightTextColor),
            splashRadius: 20,
            onPressed: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => CoachingDetailsEditingPopUp(
                      coachBloc: coachBloc,
                      coachDynamicBloc: coachDynamicBloc));
            }),
      );
}
