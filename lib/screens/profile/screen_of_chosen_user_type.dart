import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/widgets/widget.dart';

import 'bodies/zbodies.dart';

class ScreenOfChosenUserType extends StatelessWidget {
  static const String routeName = 'screen_of_chosen_user_type';
  final AppColors _appColors = AppColors();

  ScreenOfChosenUserType({super.key});

  @override
  Widget build(BuildContext context) {
    //
    // final ChosenMembershipTypeCubit chosenMembershipTypeCubit =
    //     context.read<ChosenMembershipTypeCubit>();
    TextStyle? titleHeadline = Theme.of(context)
        .textTheme
        .displayMedium!
        .copyWith(color: _appColors.dividerColor.withOpacity(0.75));

    return
        //
        // WillPopScope(
        //   onWillPop: () async {
        //     _closeTheScreen(context);
        //     _unchooseChosenMembershipType(chosenMembershipTypeCubit);
        //     return Future(() => true);
        //   },
        //   child:
        Scaffold(
      appBar: _createAppBar(titleHeadline),
      body: const ChosenUserTypeBody(),
    );
    // );
  }

  /// CREATE ==========================================================================================================
  AppBar _createAppBar(TextStyle titleHeadline) => AppBar(
      title: AppHeaderText(
          textLabel: 'Chosen User Type', textStyle: titleHeadline));

  /// METHODS ==========================================================================================================
  /// Unchose Method ---------------------------------------------------------------------------------------------------
  //
  //void _unchooseChosenMembershipType(
  //   ChosenMembershipTypeCubit chosenMembershipTypeCubit,
  // ) =>
  //     chosenMembershipTypeCubit.pressBackButton(
  //         chosenMembershipTypeCubit.state.chosenMembershipTypeList.last);

  /// Screen Method ----------------------------------------------------------------------------------------------------
  //
  //void _closeTheScreen(BuildContext context) => Navigator.of(context).pop();
}
