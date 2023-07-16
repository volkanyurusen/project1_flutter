import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/app_colors.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class UserCardDetailBodyUsernameArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final ChosenResultOfPreferredActivityDynamicCubit
      chosenResultOfPreferredActivityDynamicCubit;

  UserCardDetailBodyUsernameArea({
    required this.chosenResultOfPreferredActivityDynamicCubit,
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
            chosenResultOfPreferredActivityDynamicCubit,
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
    ChosenResultOfPreferredActivityDynamicCubit
        chosenResultOfPreferredActivityDynamicCubit,
    TextStyle displayMedium,
    TextStyle bodyLarge,
    Color distanceColor,
  ) =>
      AppHeader(
          firstWidget: _displayUsernameAndDistance(
              context,
              chosenResultOfPreferredActivityDynamicCubit,
              displayMedium,
              bodyLarge,
              distanceColor),
          thirdWidget: _displayFollowButton());

  /// DISPLAY ==========================================================================================================
  ChoiceColumn _displayUsernameAndDistance(
    BuildContext context,
    ChosenResultOfPreferredActivityDynamicCubit
        chosenResultOfPreferredActivityDynamicCubit,
    TextStyle displayMedium,
    TextStyle bodyLarge,
    Color distanceColor,
  ) =>
      ChoiceColumn(
          containerColor: Colors.transparent,
          headerLabel:
              displayUsername(chosenResultOfPreferredActivityDynamicCubit),
          headerLabelTextStyle: displayMedium,
          detailLabel:
              displayDistance(chosenResultOfPreferredActivityDynamicCubit),
          detailLabelTextStyle: bodyLarge.copyWith(color: distanceColor));

  ChoiceContainer _displayFollowButton() => ChoiceContainer(
      containerText: 'Follow                ',
      onTap: () {
        if (kDebugMode) {
          print('follow button has been clicked');
        }
      });

  String displayUsername(
          ChosenResultOfPreferredActivityDynamicCubit
              chosenResultOfPreferredActivityDynamicCubit) =>
      chosenResultOfPreferredActivityDynamicCubit
          .state.chosenCreatedActivityDynamicWithDistanceList.last.username;

  String displayDistance(
    ChosenResultOfPreferredActivityDynamicCubit
        chosenResultOfPreferredActivityDynamicCubit,
  ) =>
      'nearly ${chosenResultOfPreferredActivityDynamicCubit.state.chosenCreatedActivityDynamicWithDistanceList.last.distanceBetween.round().toString()} km';

  /// METHOD ===========================================================================================================
}
