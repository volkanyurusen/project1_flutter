import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/message/bodies/zbodies.dart';
import 'package:my_project/widgets/widget.dart';

class ScreenOfChosenFindACoachDetail extends StatelessWidget {
  static const String routeName = 'screen_of_chosen_find_a_coach_detail';

  const ScreenOfChosenFindACoachDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // WillPopScope(
        //   onWillPop: () async {
        //     _closeTheScreen(context);
        //     return Future(() => true);
        //   },
        //   child:
        Scaffold(
            appBar: _createActivityPictureOnTop(context),
            body: const ChosenFindACoachDetailBody());
    // );
  }

  /// CREATE ===========================================================================================================
  PreferredSizeForPicture _createActivityPictureOnTop(BuildContext context) =>
      PreferredSizeForPicture(
          context: context,
          child: AppBar(
            flexibleSpace:
                _bringActivityNameFromDatabaseForDisplayingItsPhoto(),
          ));

  /// BLOC =============================================================================================================
  BlocBuilder<GroupedFindACoachConversationDynamicByTraineeCubit,
          GroupedFindACoachConversationDynamicByTraineeState>
      _bringActivityNameFromDatabaseForDisplayingItsPhoto() => BlocBuilder<
              GroupedFindACoachConversationDynamicByTraineeCubit,
              GroupedFindACoachConversationDynamicByTraineeState>(
          builder: (context, groupedState) => AppBarHero(
              tag: _heroTag(groupedState),
              image: _displayChoiceActivityImage(groupedState)));

  /// DISPLAY ==========================================================================================================
  AssetImage _displayChoiceActivityImage(
    GroupedFindACoachConversationDynamicByTraineeState groupedState,
  ) =>
      AssetImage(
          'assets/images/activities/${groupedState.groupedFindACoachConversationDynamicList.first.trainingOfferResponseDynamic.trainingOfferDynamic.trainingDetailDynamic.activityNameDynamic.activityTitle.toLowerCase()}.jpg');

  /// METHODS ==========================================================================================================
  /// Hero Method ------------------------------------------------------------------------------------------------------
  String _heroTag(
    GroupedFindACoachConversationDynamicByTraineeState groupedState,
  ) =>
      '${groupedState.groupedFindACoachConversationDynamicList.first.trainingOfferResponseDynamic.trainingOfferDynamic.coachDynamic.userDynamic.username}+${groupedState.groupedFindACoachConversationDynamicList.first.trainingOfferResponseDynamic.trainingOfferDynamic.trainingOfferId}';

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  // void _closeTheScreen(BuildContext context) => Navigator.of(context).pop();
}
