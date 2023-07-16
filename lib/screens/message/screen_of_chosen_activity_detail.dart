import 'package:flutter/material.dart';

import '../../logic/blocs/blocs.dart';
import '../../logic/cubits/cubits.dart';
import '../../widgets/widget.dart';
import 'bodies/zbodies.dart';

class ScreenOfChosenActivityDetail extends StatelessWidget {
  static const String routeName = 'screen_of_chosen_activity_detail';

  const ScreenOfChosenActivityDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        //
        // WillPopScope(
        //   onWillPop: () async {
        //     return Future(() => true);
        //   },
        //   child:
        Scaffold(
            appBar: _createActivityPictureOnTop(context),
            body: const ChosenActivityDetailBody());
    // );
  }

  /// CREATE ===========================================================================================================
  PreferredSizeForPicture _createActivityPictureOnTop(BuildContext context) =>
      PreferredSizeForPicture(
          context: context,
          child: AppBar(
              flexibleSpace:
                  _bringActivityNameFromDatabaseForDisplayingItsPhoto()));

  /// BLOC =============================================================================================================
  BlocBuilder<ChosenActivityConversationDynamicByUserCubit,
          ChosenActivityConversationDynamicByUserState>
      _bringActivityNameFromDatabaseForDisplayingItsPhoto() => BlocBuilder<
              ChosenActivityConversationDynamicByUserCubit,
              ChosenActivityConversationDynamicByUserState>(
          builder: (context, chosenState) => AppBarHero(
              tag: _heroTag(chosenState),
              image: _displayChoiceActivityImage(chosenState)));

  /// DISPLAY ==========================================================================================================
  AssetImage _displayChoiceActivityImage(
    ChosenActivityConversationDynamicByUserState chosenState,
  ) =>
      AssetImage(
          'assets/images/activities/${_findActivityTitle(chosenState).toLowerCase()}.jpg');

  /// METHODS ==========================================================================================================
  /// Hero Method ------------------------------------------------------------------------------------------------------
  String _heroTag(
    ChosenActivityConversationDynamicByUserState chosenState,
  ) =>
      '${chosenState.chosenActivityConversationDynamicList.first.consistedActivityDynamic.createdActivityDynamic.host.username}+${chosenState.chosenActivityConversationDynamicList.first.consistedActivityDynamic.createdActivityDynamic.createdActivityId}';

  /// Find Method ------------------------------------------------------------------------------------------------------
  String _findActivityTitle(
          ChosenActivityConversationDynamicByUserState chosenState) =>
      chosenState
          .chosenActivityConversationDynamicList
          .first
          .consistedActivityDynamic
          .createdActivityDynamic
          .activityNameDynamic
          .activityTitle;
}
