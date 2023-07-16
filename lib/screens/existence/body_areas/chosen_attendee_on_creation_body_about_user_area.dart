import 'package:flutter/material.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenAttendeeOnCreationBodyAboutUserArea extends StatelessWidget {
  final ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
      chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit;

  const ChosenAttendeeOnCreationBodyAboutUserArea({
    required this.chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChosenAttendeeOnCreationAmongThoseWhoSentRequestState
        chosenAttendeeOnCreationAmongThoseWhoSentRequestState =
        chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit.state;
    TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall!;

    return Column(
      children: [
        _displayAboutUser(
            context,
            chosenAttendeeOnCreationAmongThoseWhoSentRequestState,
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
    ChosenAttendeeOnCreationAmongThoseWhoSentRequestState state,
    TextStyle displaySmall,
  ) =>
      AppHeaderText(
          textLabel: displayAboutUserText(state),
          textStyle: displaySmall.copyWith(fontWeight: FontWeight.normal));

  String displayAboutUserText(
          ChosenAttendeeOnCreationAmongThoseWhoSentRequestState state) =>
      '${state.chosenConsistedActivityDynamicWithDistanceList.last.attendee.aboutUser} Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris';
}
