import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenTraineeWhoCreatedRequestBodyAboutUserArea extends StatelessWidget {
  final ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit
      chosenRequestAmongThoseWhoCreatedTrainingRequestCubit;

  const ChosenTraineeWhoCreatedRequestBodyAboutUserArea({
    required this.chosenRequestAmongThoseWhoCreatedTrainingRequestCubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ChosenRequestAmongThoseWhoCreatedTrainingRequestState
        chosenRequestAmongThoseWhoCreatedTrainingRequestState = context
            .read<ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit>()
            .state;
    TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall!;

    return Column(
      children: [
        _displayAboutUser(
            context,
            chosenRequestAmongThoseWhoCreatedTrainingRequestState,
            displaySmall),
        const CustomAppSizedBox(height: 18),
      ],
    );
  }

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayAboutUser(
    BuildContext context,
    ChosenRequestAmongThoseWhoCreatedTrainingRequestState
        chosenRequestAmongThoseWhoCreatedTrainingRequestState,
    TextStyle displaySmall,
  ) =>
      AppHeaderText(
          textLabel: displayAboutUserText(
              chosenRequestAmongThoseWhoCreatedTrainingRequestState),
          textStyle: displaySmall.copyWith(fontWeight: FontWeight.normal));

  String displayAboutUserText(
          ChosenRequestAmongThoseWhoCreatedTrainingRequestState
              chosenRequestAmongThoseWhoCreatedTrainingRequestState) =>
      '${chosenRequestAmongThoseWhoCreatedTrainingRequestState.chosenTrainingRequestDynamicWithDistanceList.last.trainingRequester.aboutUser} Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris';
}
