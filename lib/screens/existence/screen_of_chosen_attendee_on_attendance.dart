import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import 'bodies/zbodies.dart';

class ScreenOfChosenAttendeeOnAttendance extends StatelessWidget {
  static const String routeName = 'screen_of_chosen_attendee_on_attendance';

  const ScreenOfChosenAttendeeOnAttendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
        chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit =
        context.read<ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit>();
    double screenWidth = MediaQuery.of(context).size.width;

    return
        //
        // WillPopScope(
        //   onWillPop: () async {
        //     Navigator.of(context).pop();
        //     // _unchoseChosenAttendee(
        //     //     chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit);
        //     return Future(() => true);
        //   },
        //   child:
        SafeArea(
      child: Scaffold(
          appBar: const CustomAppBar(),
          body: ChosenAttendeeOnAttendanceBody(
              chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit:
                  chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
              screenWidth: screenWidth)),
    );
    // );
  }

  /// METHOD ===========================================================================================================
  //
  //void _unchoseChosenAttendee(
  //   ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
  //       chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
  // ) =>
  //     chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit.pressBackButton(
  //         chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
  //             .state.chosenConsistedActivityDynamicWithDistanceList.last);
}
