import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class HostBodyUsernameArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit;

  HostBodyUsernameArea({
    required this.chosenHostWhoCreatedActivityCubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? displayMedium = Theme.of(context).textTheme.displayMedium!;
    TextStyle? bodyLarge = Theme.of(context).textTheme.bodyLarge!;
    Color distanceColor = _appColors.textColor.withOpacity(0.7);

    return Column(
      children: [
        _createUserNameArea(context, chosenHostWhoCreatedActivityCubit,
            displayMedium, bodyLarge, distanceColor),
        CustomAppDivider(),
      ],
    );
  }

  /// CREATE ===========================================================================================================
  AppHeader _createUserNameArea(
    BuildContext context,
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit,
    TextStyle? displayMedium,
    TextStyle? bodyLarge,
    Color distanceColor,
  ) =>
      AppHeader(
          firstWidget: _displayUsernameAndDistance(
              context,
              chosenHostWhoCreatedActivityCubit,
              displayMedium,
              bodyLarge,
              distanceColor),
          thirdWidget: chosenHostWhoCreatedActivityCubit
                      .state
                      .chosenConsistedActivityDynamicWithDistance
                      .last
                      .createdActivityDynamic
                      .host
                      .uId ==
                  _appNumberConstants.appUserId
              ? const SizedBox()
              : _displayFollowButton());

  /// DISPLAY ==========================================================================================================
  ChoiceColumn _displayUsernameAndDistance(
    BuildContext context,
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit,
    TextStyle? displayMedium,
    TextStyle? bodyLarge,
    Color distanceColor,
  ) =>
      ChoiceColumn(
          containerColor: Colors.transparent,
          headerLabel: _displayUsername(chosenHostWhoCreatedActivityCubit),
          headerLabelTextStyle: displayMedium,
          detailLabel: displayDistance(chosenHostWhoCreatedActivityCubit),
          detailLabelTextStyle: bodyLarge!.copyWith(color: distanceColor));

  ChoiceContainer _displayFollowButton() => ChoiceContainer(
        containerText: 'Follow                ',
        onTap: () {
          if (kDebugMode) {
            print('follow button has been clicked');
          }
        },
      );

  String _displayUsername(
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit,
  ) =>
      chosenHostWhoCreatedActivityCubit
          .state
          .chosenConsistedActivityDynamicWithDistance
          .last
          .createdActivityDynamic
          .host
          .username;

  String displayDistance(
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit,
  ) =>
      chosenHostWhoCreatedActivityCubit
                  .state
                  .chosenConsistedActivityDynamicWithDistance
                  .last
                  .createdActivityDynamic
                  .host
                  .uId ==
              _appNumberConstants.appUserId
          ? ''
          : 'nearly ${chosenHostWhoCreatedActivityCubit.state.chosenConsistedActivityDynamicWithDistance.last.distanceBetween.round().toString()} km';
}
