import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenResponseWhoRespondedTrainingRequestBodyUsernameArea
    extends StatelessWidget {
  final AppColors _appColors = AppColors();

  ChosenResponseWhoRespondedTrainingRequestBodyUsernameArea({super.key});

  @override
  Widget build(BuildContext context) {
    final ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
        chosenResponseAmongThoseWhoRespondedTrainingRequestCubit = context
            .read<ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit>();

    TextStyle? displayMedium = Theme.of(context).textTheme.displayMedium!;
    TextStyle? bodyLarge = Theme.of(context).textTheme.bodyLarge!;
    Color distanceColor = _appColors.textColor.withOpacity(0.7);

    return Column(
      children: [
        _createUserNameArea(
            chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
            displayMedium,
            bodyLarge,
            distanceColor),
        CustomAppDivider(),
      ],
    );
  }

  /// CREATE ===========================================================================================================
  AppHeader _createUserNameArea(
    ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
        chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
    TextStyle? displayMedium,
    TextStyle bodyLarge,
    Color distanceColor,
  ) =>
      AppHeader(
          firstWidget: _displayUsernameAndDistance(
              chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
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
    ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
        chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
    TextStyle? displayMedium,
    TextStyle bodyLarge,
    Color distanceColor,
  ) =>
      ChoiceColumn(
          containerColor: Colors.transparent,
          headerLabel: _displayUserName(
              chosenResponseAmongThoseWhoRespondedTrainingRequestCubit),
          headerLabelTextStyle: displayMedium,
          detailLabel: _displayDistance(
              chosenResponseAmongThoseWhoRespondedTrainingRequestCubit),
          detailLabelTextStyle: bodyLarge.copyWith(color: distanceColor));

  String _displayUserName(
    ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
        chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
  ) =>
      chosenResponseAmongThoseWhoRespondedTrainingRequestCubit
          .state
          .chosenTrainingRequestResponseDynamicWithDistanceList
          .last
          .coachDynamic
          .userDynamic
          .username;

  String _displayDistance(
    ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
        chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
  ) =>
      'nearly ${_findDistance(chosenResponseAmongThoseWhoRespondedTrainingRequestCubit).round().toString()} km';

  /// METHODS ==========================================================================================================
  /// Find Methods -----------------------------------------------------------------------------------------------------
  double _findDistance(
    ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
        chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
  ) =>
      chosenResponseAmongThoseWhoRespondedTrainingRequestCubit
          .state
          .chosenTrainingRequestResponseDynamicWithDistanceList
          .last
          .distanceBetween;
}
