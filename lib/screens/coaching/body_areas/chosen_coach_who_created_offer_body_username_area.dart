import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenCoachWhoCreatedOfferBodyUsernameArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit
      chosenOfferAmongThoseWhoCreatedTrainingOfferCubit;

  ChosenCoachWhoCreatedOfferBodyUsernameArea({
    required this.chosenOfferAmongThoseWhoCreatedTrainingOfferCubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle? displayMedium = Theme.of(context).textTheme.displayMedium!;
    TextStyle? bodyLarge = Theme.of(context).textTheme.bodyLarge!;
    Color distanceColor = _appColors.textColor.withOpacity(0.7);

    return Column(
      children: [
        _createUserNameArea(chosenOfferAmongThoseWhoCreatedTrainingOfferCubit,
            displayMedium, bodyLarge, distanceColor),
        CustomAppDivider(),
      ],
    );
  }

  /// CREATE ===========================================================================================================
  AppHeader _createUserNameArea(
    ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit
        chosenOfferAmongThoseWhoCreatedTrainingOfferCubit,
    TextStyle? displayMedium,
    TextStyle bodyLarge,
    Color distanceColor,
  ) =>
      AppHeader(
          firstWidget: _displayUsernameAndDistance(
              chosenOfferAmongThoseWhoCreatedTrainingOfferCubit,
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
    ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit
        chosenOfferAmongThoseWhoCreatedTrainingOfferCubit,
    TextStyle? displayMedium,
    TextStyle bodyLarge,
    Color distanceColor,
  ) =>
      ChoiceColumn(
          containerColor: Colors.transparent,
          headerLabel: _displayUserName(
              chosenOfferAmongThoseWhoCreatedTrainingOfferCubit),
          headerLabelTextStyle: displayMedium,
          detailLabel: _displayDistance(
              chosenOfferAmongThoseWhoCreatedTrainingOfferCubit),
          detailLabelTextStyle: bodyLarge.copyWith(color: distanceColor));

  String _displayUserName(
    ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit
        chosenOfferAmongThoseWhoCreatedTrainingOfferCubit,
  ) =>
      chosenOfferAmongThoseWhoCreatedTrainingOfferCubit
          .state
          .chosenTrainingOfferDynamicWithDistanceList
          .last
          .coachDynamic
          .userDynamic
          .username;

  String _displayDistance(
    ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit
        chosenOfferAmongThoseWhoCreatedTrainingOfferCubit,
  ) =>
      'nearly ${_findDistance(chosenOfferAmongThoseWhoCreatedTrainingOfferCubit).round().toString()} km';

  /// METHODS ==========================================================================================================
  /// Find Methods -----------------------------------------------------------------------------------------------------
  double _findDistance(
    ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit
        chosenOfferAmongThoseWhoCreatedTrainingOfferCubit,
  ) =>
      chosenOfferAmongThoseWhoCreatedTrainingOfferCubit.state
          .chosenTrainingOfferDynamicWithDistanceList.last.distanceBetween;
}
