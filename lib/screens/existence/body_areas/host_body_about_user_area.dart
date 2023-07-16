import 'package:flutter/material.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class HostBodyAboutUserArea extends StatelessWidget {
  final ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit;

  const HostBodyAboutUserArea({
    required this.chosenHostWhoCreatedActivityCubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChosenHostWhoCreatedActivityState chosenHostWhoCreatedActivityState =
        chosenHostWhoCreatedActivityCubit.state;
    TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall!;

    return Column(
      children: [
        _displayAboutUser(
            context, chosenHostWhoCreatedActivityState, displaySmall),
        const CustomAppSizedBox(height: 9),
        CustomAppDivider(),
        const CustomAppSizedBox(height: 9),
      ],
    );
  }

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayAboutUser(
    BuildContext context,
    ChosenHostWhoCreatedActivityState chosenHostWhoCreatedActivityState,
    TextStyle displaySmall,
  ) =>
      AppHeaderText(
          textLabel: displayAboutUserText(chosenHostWhoCreatedActivityState),
          textStyle: displaySmall.copyWith(fontWeight: FontWeight.normal));

  String displayAboutUserText(
          ChosenHostWhoCreatedActivityState
              chosenHostWhoCreatedActivityState) =>
      '${chosenHostWhoCreatedActivityState.chosenConsistedActivityDynamicWithDistance.last.createdActivityDynamic.host.aboutUser} Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris';
}
