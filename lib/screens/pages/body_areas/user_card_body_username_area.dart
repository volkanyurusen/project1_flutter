import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/widgets/widget.dart';

class UserCardBodyUsernameArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final String username;
  final double distance;
  final VoidCallback clickFollowButton;

  UserCardBodyUsernameArea({
    required this.username,
    required this.distance,
    required this.clickFollowButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle? displayMedium = Theme.of(context).textTheme.displayMedium!;
    TextStyle? bodyLarge = Theme.of(context).textTheme.bodyLarge!;
    Color distanceColor = _appColors.textColor.withOpacity(0.7);

    return Column(
      children: [
        _createUserNameAndFollowButtonArea(
            displayMedium, bodyLarge, distanceColor),
        CustomAppDivider(),
      ],
    );
  }

  /// CREATE ===========================================================================================================
  AppHeader _createUserNameAndFollowButtonArea(
    TextStyle? displayMedium,
    TextStyle bodyLarge,
    Color distanceColor,
  ) =>
      AppHeader(
          firstWidget: _displayUsernameAndDistance(
              displayMedium, bodyLarge, distanceColor),
          thirdWidget: _displayFollowButton());

  /// DISPLAY ==========================================================================================================
  ChoiceColumn _displayUsernameAndDistance(
    TextStyle? displayMedium,
    TextStyle bodyLarge,
    Color distanceColor,
  ) =>
      ChoiceColumn(
          containerColor: Colors.transparent,
          headerLabel: username,
          headerLabelTextStyle: displayMedium,
          detailLabel: _displayDistance(),
          detailLabelTextStyle: bodyLarge.copyWith(color: distanceColor));

  String _displayDistance() => 'nearly ${distance.round().toString()} km';

  ChoiceContainer _displayFollowButton() => ChoiceContainer(
      containerText: 'Follow                ', onTap: () => clickFollowButton);
}
