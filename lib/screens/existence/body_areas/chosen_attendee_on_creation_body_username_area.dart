import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/app_colors.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenAttendeeOnCreationBodyUsernameArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
      chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit;

  ChosenAttendeeOnCreationBodyUsernameArea({
    required this.chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? displayMedium = Theme.of(context).textTheme.displayMedium!;
    TextStyle? bodyLarge = Theme.of(context).textTheme.bodyLarge!;
    Color distanceColor = _appColors.textColor.withOpacity(0.7);

    return Column(
      children: [
        _createUserNameArea(
            context,
            chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit,
            displayMedium,
            bodyLarge,
            distanceColor),
        CustomAppDivider(),
      ],
    );
  }

  /// CREATE ===========================================================================================================
  AppHeader _createUserNameArea(
    BuildContext context,
    ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
        chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit,
    TextStyle displayMedium,
    TextStyle bodyLarge,
    Color distanceColor,
  ) =>
      AppHeader(
          firstWidget: _displayUsernameAndDistance(
              context,
              chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit,
              displayMedium,
              bodyLarge,
              distanceColor),
          thirdWidget: _displayFollowButton());

  /// DISPLAY ==========================================================================================================
  ChoiceColumn _displayUsernameAndDistance(
    BuildContext context,
    ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
        chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit,
    TextStyle displayMedium,
    TextStyle bodyLarge,
    Color distanceColor,
  ) =>
      ChoiceColumn(
          containerColor: Colors.transparent,
          headerLabel: displayUsername(
              chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit),
          headerLabelTextStyle: displayMedium,
          detailLabel: displayDistance(
              chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit),
          detailLabelTextStyle: bodyLarge.copyWith(color: distanceColor));

  ChoiceContainer _displayFollowButton() => ChoiceContainer(
      containerText: 'Follow                ',
      onTap: () {
        if (kDebugMode) {
          print('follow button has been clicked');
        }
      });

  String displayUsername(
          ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
              chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit) =>
      chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
          .state
          .chosenConsistedActivityDynamicWithDistanceList
          .last
          .attendee
          .username;

  String displayDistance(
    ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
        chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit,
  ) =>
      'nearly ${chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit.state.chosenConsistedActivityDynamicWithDistanceList.last.distanceBetween.round().toString()} km';

  /// METHODS ==========================================================================================================
}
