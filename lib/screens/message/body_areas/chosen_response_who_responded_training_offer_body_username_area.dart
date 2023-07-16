import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenResponseWhoRespondedTrainingOfferBodyUsernameArea
    extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
      chosenResponseAmongThoseWhoRespondedTrainingOfferCubit;

  ChosenResponseWhoRespondedTrainingOfferBodyUsernameArea({
    required this.chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle? displayMedium = Theme.of(context).textTheme.displayMedium!;
    TextStyle? bodyLarge = Theme.of(context).textTheme.bodyLarge!;
    Color distanceColor = _appColors.textColor.withOpacity(0.7);

    return Column(
      children: [
        _createUserNameArea(
            chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
            displayMedium,
            bodyLarge,
            distanceColor),
        CustomAppDivider(),
      ],
    );
  }

  /// CREATE ===========================================================================================================
  AppHeader _createUserNameArea(
    ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
    TextStyle? displayMedium,
    TextStyle bodyLarge,
    Color distanceColor,
  ) =>
      AppHeader(
          firstWidget: _displayUsernameAndDistance(
              chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
              displayMedium,
              bodyLarge,
              distanceColor),
          thirdWidget: ChoiceContainer(
              containerText: 'Follow                ',
              onTap: () {
                if (kDebugMode) {
                  print('follow button has been clicked');
                }
              }));

  /// DISPLAY ==========================================================================================================
  ChoiceColumn _displayUsernameAndDistance(
    ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
    TextStyle? displayMedium,
    TextStyle bodyLarge,
    Color distanceColor,
  ) =>
      ChoiceColumn(
          containerColor: Colors.transparent,
          headerLabel: _displayUserName(
              chosenResponseAmongThoseWhoRespondedTrainingOfferCubit),
          headerLabelTextStyle: displayMedium,
          detailLabel: _displayDistance(
              chosenResponseAmongThoseWhoRespondedTrainingOfferCubit),
          detailLabelTextStyle: bodyLarge.copyWith(color: distanceColor));

  String _displayUserName(
    ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
  ) =>
      chosenResponseAmongThoseWhoRespondedTrainingOfferCubit
          .state
          .chosenTrainingOfferResponseDynamicWithDistanceList
          .last
          .traineeDynamic
          .username;

  String _displayDistance(
    ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
  ) =>
      'nearly ${_findDistance(chosenResponseAmongThoseWhoRespondedTrainingOfferCubit).round().toString()} km';

  /// METHODS ==========================================================================================================
  /// Find Methods -----------------------------------------------------------------------------------------------------
  double _findDistance(
    ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
  ) =>
      chosenResponseAmongThoseWhoRespondedTrainingOfferCubit
          .state
          .chosenTrainingOfferResponseDynamicWithDistanceList
          .last
          .distanceBetween;
}
