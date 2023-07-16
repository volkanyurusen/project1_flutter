import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class UserCardBodyAboutUserArea extends StatelessWidget {
  final String aboutUser;

  const UserCardBodyAboutUserArea({
    required this.aboutUser,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall!;

    return Column(
      children: [
        _displayAboutUser(context, displaySmall),
        const CustomAppSizedBox(height: 18),
      ],
    );
  }

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayAboutUser(
    BuildContext context,
    TextStyle displaySmall,
  ) =>
      AppHeaderText(
          textLabel: aboutUser,
          textStyle: displaySmall.copyWith(fontWeight: FontWeight.normal));
}

      // '${chosenResponseAmongThoseWhoRespondedTrainingOfferState.chosenResponseAmongThoseWhoRespondedTrainingOffer.last.traineeDynamic.aboutUser} Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris';