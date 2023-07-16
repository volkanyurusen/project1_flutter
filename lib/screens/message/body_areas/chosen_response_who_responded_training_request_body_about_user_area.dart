import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenResponseWhoRespondedTrainingRequestBodyAboutUserArea
    extends StatelessWidget {
  const ChosenResponseWhoRespondedTrainingRequestBodyAboutUserArea({super.key});

  @override
  Widget build(BuildContext context) {
    final ChosenResponseAmongThoseWhoRespondedTrainingRequestState
        chosenResponseAmongThoseWhoRespondedTrainingRequestState = context
            .read<ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit>()
            .state;
    TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall!;

    return Column(
      children: [
        _displayAboutUser(
            context,
            chosenResponseAmongThoseWhoRespondedTrainingRequestState,
            displaySmall),
        const CustomAppSizedBox(height: 18),
      ],
    );
  }

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayAboutUser(
    BuildContext context,
    ChosenResponseAmongThoseWhoRespondedTrainingRequestState
        chosenResponseAmongThoseWhoRespondedTrainingRequestState,
    TextStyle displaySmall,
  ) =>
      AppHeaderText(
          textLabel: displayAboutUserText(
              chosenResponseAmongThoseWhoRespondedTrainingRequestState),
          textStyle: displaySmall.copyWith(fontWeight: FontWeight.normal));

  String displayAboutUserText(
          ChosenResponseAmongThoseWhoRespondedTrainingRequestState
              chosenResponseAmongThoseWhoRespondedTrainingRequestState) =>
      '${chosenResponseAmongThoseWhoRespondedTrainingRequestState.chosenTrainingRequestResponseDynamicWithDistanceList.last.coachDynamic.userDynamic.aboutUser} Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris';
}
