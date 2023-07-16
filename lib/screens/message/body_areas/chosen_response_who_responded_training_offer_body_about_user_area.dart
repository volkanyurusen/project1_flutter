import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenResponseWhoRespondedTrainingOfferBodyAboutUserArea
    extends StatelessWidget {
  final ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
      chosenResponseAmongThoseWhoRespondedTrainingOfferCubit;

  const ChosenResponseWhoRespondedTrainingOfferBodyAboutUserArea({
    required this.chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ChosenResponseAmongThoseWhoRespondedTrainingOfferState
        chosenResponseAmongThoseWhoRespondedTrainingOfferState = context
            .read<ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit>()
            .state;
    TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall!;

    return Column(
      children: [
        _displayAboutUser(
            context,
            chosenResponseAmongThoseWhoRespondedTrainingOfferState,
            displaySmall),
        const CustomAppSizedBox(height: 18),
      ],
    );
  }

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayAboutUser(
    BuildContext context,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferState
        chosenResponseAmongThoseWhoRespondedTrainingOfferState,
    TextStyle displaySmall,
  ) =>
      AppHeaderText(
          textLabel: displayAboutUserText(
              chosenResponseAmongThoseWhoRespondedTrainingOfferState),
          textStyle: displaySmall.copyWith(fontWeight: FontWeight.normal));

  String displayAboutUserText(
          ChosenResponseAmongThoseWhoRespondedTrainingOfferState
              chosenResponseAmongThoseWhoRespondedTrainingOfferState) =>
      '${chosenResponseAmongThoseWhoRespondedTrainingOfferState.chosenTrainingOfferResponseDynamicWithDistanceList.last.traineeDynamic.aboutUser} Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris';
}
