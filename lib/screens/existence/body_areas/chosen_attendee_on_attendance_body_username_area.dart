import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/app_colors.dart';
import 'package:my_project/constants/app_constants.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenAttendeeOnAttendanceBodyUsernameArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
      chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit;

  ChosenAttendeeOnAttendanceBodyUsernameArea({
    required this.chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
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
            chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
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
    ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
        chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
    TextStyle displayMedium,
    TextStyle bodyLarge,
    Color distanceColor,
  ) =>
      AppHeader(
          firstWidget: _displayUsernameAndDistance(
              context,
              chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
              displayMedium,
              bodyLarge,
              distanceColor),
          thirdWidget: chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
                      .state
                      .chosenConsistedActivityDynamicWithDistanceList
                      .last
                      .attendee
                      .uId ==
                  _appNumberConstants.appUserId
              ? const SizedBox()
              : _displayFollowButton());

  /// DISPLAY ==========================================================================================================
  ChoiceColumn _displayUsernameAndDistance(
    BuildContext context,
    ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
        chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
    TextStyle displayMedium,
    TextStyle bodyLarge,
    Color distanceColor,
  ) =>
      ChoiceColumn(
          containerColor: Colors.transparent,
          headerLabel: displayUsername(
              chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit),
          headerLabelTextStyle: displayMedium,
          detailLabel: displayDistance(
              chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit),
          detailLabelTextStyle: bodyLarge.copyWith(color: distanceColor));

  ChoiceContainer _displayFollowButton() => ChoiceContainer(
      containerText: 'Follow                ',
      onTap: () {
        if (kDebugMode) {
          print('follow button has been clicked');
        }
      });

  String displayUsername(
          ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
              chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit) =>
      chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
          .state
          .chosenConsistedActivityDynamicWithDistanceList
          .last
          .attendee
          .username;

  String displayDistance(
    ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
        chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
  ) =>
      chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
                  .state
                  .chosenConsistedActivityDynamicWithDistanceList
                  .last
                  .attendee
                  .uId ==
              _appNumberConstants.appUserId
          ? ''
          : 'nearly ${chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit.state.chosenConsistedActivityDynamicWithDistanceList.last.distanceBetween.round().toString()} km';

  /// METHODS ==========================================================================================================
}
