import 'package:flutter/material.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class UserCardDetailBodyAboutUserArea extends StatelessWidget {
  final ChosenResultOfPreferredActivityDynamicCubit
      chosenResultOfPreferredActivityDynamicCubit;

  const UserCardDetailBodyAboutUserArea({
    required this.chosenResultOfPreferredActivityDynamicCubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChosenResultOfPreferredActivityDynamicState
        chosenResultOfPreferredActivityDynamicState =
        chosenResultOfPreferredActivityDynamicCubit.state;
    TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall!;

    return Column(
      children: [
        _displayAboutUser(
            context, chosenResultOfPreferredActivityDynamicState, displaySmall),
        const CustomAppSizedBox(),
        CustomAppDivider(height: 0),
        const CustomAppSizedBox(),
      ],
    );
  }

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayAboutUser(
    BuildContext context,
    ChosenResultOfPreferredActivityDynamicState state,
    TextStyle displaySmall,
  ) =>
      AppHeaderText(
          textLabel: displayAboutUserText(state),
          textStyle: displaySmall.copyWith(fontWeight: FontWeight.normal));

  String displayAboutUserText(
          ChosenResultOfPreferredActivityDynamicState state) =>
      // '${state.chosenCreatedActivityDynamicWithDistanceList.last.}
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris';
}
