import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenCoachWhoCreatedOfferBodyAboutUserArea extends StatelessWidget {
  final ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit
      chosenOfferAmongThoseWhoCreatedTrainingOfferCubit;

  const ChosenCoachWhoCreatedOfferBodyAboutUserArea({
    required this.chosenOfferAmongThoseWhoCreatedTrainingOfferCubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ChosenOfferAmongThoseWhoCreatedTrainingOfferState
        chosenOfferAmongThoseWhoCreatedTrainingOfferState =
        context.read<ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit>().state;
    TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall!;

    return Column(
      children: [
        _displayAboutUser(context,
            chosenOfferAmongThoseWhoCreatedTrainingOfferState, displaySmall),
        const CustomAppSizedBox(height: 18),
      ],
    );
  }

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayAboutUser(
    BuildContext context,
    ChosenOfferAmongThoseWhoCreatedTrainingOfferState
        chosenOfferAmongThoseWhoCreatedTrainingOfferState,
    TextStyle displaySmall,
  ) =>
      AppHeaderText(
          textLabel: displayAboutUserText(
              chosenOfferAmongThoseWhoCreatedTrainingOfferState),
          textStyle: displaySmall.copyWith(fontWeight: FontWeight.normal));

  String displayAboutUserText(
          ChosenOfferAmongThoseWhoCreatedTrainingOfferState
              chosenOfferAmongThoseWhoCreatedTrainingOfferState) =>
      '${chosenOfferAmongThoseWhoCreatedTrainingOfferState.chosenTrainingOfferDynamicWithDistanceList.last.coachDynamic.userDynamic.aboutUser} Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris';
}
