import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/existence/body_areas/zareas.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenAttendeeOnAttendanceBody extends StatelessWidget {
  final ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
      chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit;
  final double screenWidth;

  const ChosenAttendeeOnAttendanceBody({
    required this.chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;

    return UserCardScrollAppBody(
      child: BlocBuilder<
              ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
              ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestState>(
          builder: (context, chosenState) {
        return Column(children: [
          ChosenAttendeeOnAttendanceBodyProfilePhotoArea(
              chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit:
                  chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit),
          ChosenAttendeeOnAttendanceBodyUsernameArea(
              chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit:
                  chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit),
          ChosenAttendeeOnAttendanceBodyFollowsAndLikesArea(
              chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit:
                  chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
              screenWidth: screenWidth),
          ChosenAttendeeOnAttendanceBodyAmountBoxArea(
              chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit:
                  chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
              screenWidth: screenWidth),
          ChosenAttendeeOnAttendanceBodyAboutUserArea(
              chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit:
                  chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit),
          ChosenAttendeeOnAttendanceBodyRecentActivityArea(
              screenWidth: screenWidth),
          const CustomAppSizedBox(),
        ]);
      }),
    );
  }

  /// CREATE ===========================================================================================================

  /// DISPLAY ==========================================================================================================

  /// METHOD ===========================================================================================================

  /// Check Method -----------------------------------------------------------------------------------------------------
}
