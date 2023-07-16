import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenCoachWhoFoundBodyUsernameArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final ChosenCoachAmongThoseWhoFoundCubit chosenCoachAmongThoseWhoFoundCubit;

  ChosenCoachWhoFoundBodyUsernameArea({
    required this.chosenCoachAmongThoseWhoFoundCubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle? displayMedium = Theme.of(context).textTheme.displayMedium!;
    TextStyle? bodyLarge = Theme.of(context).textTheme.bodyLarge!;
    Color distanceColor = _appColors.textColor.withOpacity(0.7);

    return Column(
      children: [
        _createUserNameArea(chosenCoachAmongThoseWhoFoundCubit, displayMedium,
            bodyLarge, distanceColor),
        CustomAppDivider(),
      ],
    );
  }

  /// CREATE ===========================================================================================================
  AppHeader _createUserNameArea(
    ChosenCoachAmongThoseWhoFoundCubit chosenCoachAmongThoseWhoFoundCubit,
    TextStyle? displayMedium,
    TextStyle bodyLarge,
    Color distanceColor,
  ) =>
      AppHeader(
          firstWidget: _displayUsernameAndDistance(
              chosenCoachAmongThoseWhoFoundCubit,
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
    ChosenCoachAmongThoseWhoFoundCubit chosenCoachAmongThoseWhoFoundCubit,
    TextStyle? displayMedium,
    TextStyle bodyLarge,
    Color distanceColor,
  ) =>
      ChoiceColumn(
          containerColor: Colors.transparent,
          headerLabel: _displayUserName(chosenCoachAmongThoseWhoFoundCubit),
          headerLabelTextStyle: displayMedium,
          detailLabel: _displayDistance(chosenCoachAmongThoseWhoFoundCubit),
          detailLabelTextStyle: bodyLarge.copyWith(color: distanceColor));

  String _displayUserName(
    ChosenCoachAmongThoseWhoFoundCubit chosenCoachAmongThoseWhoFoundCubit,
  ) =>
      chosenCoachAmongThoseWhoFoundCubit
          .state
          .chosenTrainingOfferResponseDynamicWithDistanceList
          .last
          .trainingOfferDynamic
          .coachDynamic
          .userDynamic
          .username;

  String _displayDistance(
    ChosenCoachAmongThoseWhoFoundCubit chosenCoachAmongThoseWhoFoundCubit,
  ) =>
      'nearly ${_findDistance(chosenCoachAmongThoseWhoFoundCubit).round().toString()} km';

  /// METHODS ==========================================================================================================
  /// Find Methods -----------------------------------------------------------------------------------------------------
  double _findDistance(
    ChosenCoachAmongThoseWhoFoundCubit chosenCoachAmongThoseWhoFoundCubit,
  ) =>
      chosenCoachAmongThoseWhoFoundCubit
          .state
          .chosenTrainingOfferResponseDynamicWithDistanceList
          .last
          .distanceBetween;
}
