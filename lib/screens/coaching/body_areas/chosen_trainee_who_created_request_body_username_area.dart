import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenTraineeWhoCreatedRequestBodyUsernameArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit
      chosenRequestAmongThoseWhoCreatedTrainingRequestCubit;

  ChosenTraineeWhoCreatedRequestBodyUsernameArea({
    required this.chosenRequestAmongThoseWhoCreatedTrainingRequestCubit,
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
            chosenRequestAmongThoseWhoCreatedTrainingRequestCubit,
            displayMedium,
            bodyLarge,
            distanceColor),
        CustomAppDivider(),
      ],
    );
  }

  /// CREATE ===========================================================================================================
  AppHeader _createUserNameArea(
    ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit
        chosenRequestAmongThoseWhoCreatedTrainingRequestCubit,
    TextStyle? displayMedium,
    TextStyle bodyLarge,
    Color distanceColor,
  ) =>
      AppHeader(
          firstWidget: _displayUsernameAndDistance(
              chosenRequestAmongThoseWhoCreatedTrainingRequestCubit,
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
    ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit
        chosenRequestAmongThoseWhoCreatedTrainingRequestCubit,
    TextStyle? displayMedium,
    TextStyle bodyLarge,
    Color distanceColor,
  ) =>
      ChoiceColumn(
          containerColor: Colors.transparent,
          headerLabel: _displayUserName(
              chosenRequestAmongThoseWhoCreatedTrainingRequestCubit),
          headerLabelTextStyle: displayMedium,
          detailLabel: _displayDistance(
              chosenRequestAmongThoseWhoCreatedTrainingRequestCubit),
          detailLabelTextStyle: bodyLarge.copyWith(color: distanceColor));

  String _displayUserName(
    ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit
        chosenRequestAmongThoseWhoCreatedTrainingRequestCubit,
  ) =>
      chosenRequestAmongThoseWhoCreatedTrainingRequestCubit
          .state
          .chosenTrainingRequestDynamicWithDistanceList
          .last
          .trainingRequester
          .username;

  String _displayDistance(
    ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit
        chosenRequestAmongThoseWhoCreatedTrainingRequestCubit,
  ) =>
      'nearly ${_findDistance(chosenRequestAmongThoseWhoCreatedTrainingRequestCubit).round().toString()} km';

  /// METHODS ==========================================================================================================
  /// Find Methods -----------------------------------------------------------------------------------------------------
  double _findDistance(
    ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit
        chosenRequestAmongThoseWhoCreatedTrainingRequestCubit,
  ) =>
      chosenRequestAmongThoseWhoCreatedTrainingRequestCubit.state
          .chosenTrainingRequestDynamicWithDistanceList.last.distanceBetween;
}
