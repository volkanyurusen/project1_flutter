import 'package:flutter/material.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenAttendeeOnAttendanceBodyAboutUserArea extends StatelessWidget {
  final ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
      chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit;

  const ChosenAttendeeOnAttendanceBodyAboutUserArea({
    required this.chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestState
        chosenAttendeeOnAttendanceAmongThoseWhoSentRequestState =
        chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit.state;
    TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall!;

    return Column(
      children: [
        _displayAboutUser(
            context,
            chosenAttendeeOnAttendanceAmongThoseWhoSentRequestState,
            displaySmall),
        const CustomAppSizedBox(height: 9),
        CustomAppDivider(),
        const CustomAppSizedBox(height: 9),
      ],
    );
  }

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayAboutUser(
    BuildContext context,
    ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestState state,
    TextStyle displaySmall,
  ) =>
      AppHeaderText(
          textLabel: displayAboutUserText(state),
          textStyle: displaySmall.copyWith(fontWeight: FontWeight.normal));

  String displayAboutUserText(
          ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestState state) =>
      '${state.chosenConsistedActivityDynamicWithDistanceList.last.attendee.aboutUser} Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris';
}
