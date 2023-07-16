import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/widgets/widget.dart';

import 'bodies/zbodies.dart';

class ScreenOfChosenCoachingType extends StatelessWidget {
  static const String routeName = 'screen_of_chosen_coaching_type';
  final AppColors _appColors = AppColors();

  ScreenOfChosenCoachingType({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle? titleHeadline = Theme.of(context)
        .textTheme
        .displayMedium!
        .copyWith(color: _appColors.dividerColor.withOpacity(0.75));

    return
        //
        // WillPopScope(
        //   onWillPop: () async {
        //     _closeTheScreen(context);
        //     // _unchooseChosenCoachingType(chosenCoachingTypeCubit);
        //     return Future(() => true);
        //   },
        //   child:
        Scaffold(
      appBar: _createAppBar(titleHeadline),
      body: ChosenCoachingTypeBody(),
    );
    // );
  }

  /// CREATE ==========================================================================================================
  AppBar _createAppBar(TextStyle titleHeadline) => AppBar(
      title: AppHeaderText(
          textLabel: 'Chosen Coaching Type', textStyle: titleHeadline));

  /// METHODS ==========================================================================================================
  /// Unchose Method ---------------------------------------------------------------------------------------------------
  //
  //void _unchooseChosenCoachingType(
  //   ChosenCoachingTypeCubit chosenCoachingTypeCubit,
  // ) =>
  //     chosenCoachingTypeCubit.pressBackButton();

  /// Screen Method ----------------------------------------------------------------------------------------------------
  //
  //void _closeTheScreen(BuildContext context) => Navigator.of(context).pop();
}
