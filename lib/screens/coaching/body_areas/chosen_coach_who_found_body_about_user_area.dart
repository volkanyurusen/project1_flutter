import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenCoachWhoFoundBodyAboutUserArea extends StatelessWidget {
  final ChosenCoachAmongThoseWhoFoundCubit chosenCoachAmongThoseWhoFoundCubit;

  const ChosenCoachWhoFoundBodyAboutUserArea({
    required this.chosenCoachAmongThoseWhoFoundCubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ChosenCoachAmongThoseWhoFoundState
        chosenCoachAmongThoseWhoFoundState =
        context.read<ChosenCoachAmongThoseWhoFoundCubit>().state;
    TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall!;

    return Column(
      children: [
        _displayAboutUser(
            context, chosenCoachAmongThoseWhoFoundState, displaySmall),
        const CustomAppSizedBox(height: 18),
      ],
    );
  }

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayAboutUser(
    BuildContext context,
    ChosenCoachAmongThoseWhoFoundState chosenCoachAmongThoseWhoFoundState,
    TextStyle displaySmall,
  ) =>
      AppHeaderText(
          textLabel: displayAboutUserText(chosenCoachAmongThoseWhoFoundState),
          textStyle: displaySmall.copyWith(fontWeight: FontWeight.normal));

  String displayAboutUserText(
          ChosenCoachAmongThoseWhoFoundState
              chosenCoachAmongThoseWhoFoundState) =>
      '${chosenCoachAmongThoseWhoFoundState.chosenTrainingOfferResponseDynamicWithDistanceList.last.trainingOfferDynamic.coachDynamic.userDynamic.aboutUser} Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris';
}
