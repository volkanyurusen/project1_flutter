import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/message/bodies/zbodies.dart';
import 'package:my_project/widgets/widget.dart';

class ScreenOfChosenTrainingRequestDetail extends StatelessWidget {
  static const String routeName = 'screen_of_chosen_training_Request_detail';

  const ScreenOfChosenTrainingRequestDetail({Key? key}) : super(key: key);

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
            body: const ChosenTrainingRequestDetailBody());
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
  BlocBuilder<GroupedTrainingRequestConversationDynamicByUserCubit,
          GroupedTrainingRequestConversationDynamicByUserState>
      _bringActivityNameFromDatabaseForDisplayingItsPhoto() => BlocBuilder<
              GroupedTrainingRequestConversationDynamicByUserCubit,
              GroupedTrainingRequestConversationDynamicByUserState>(
          builder: (context, groupedState) => AppBarHero(
              tag: _heroTag(groupedState),
              image: _displayChoiceActivityImage(groupedState)));

  /// DISPLAY ==========================================================================================================
  AssetImage _displayChoiceActivityImage(
    GroupedTrainingRequestConversationDynamicByUserState groupedState,
  ) =>
      AssetImage(
          'assets/images/activities/${groupedState.groupedTrainingRequestConversationDynamicList.first.trainingRequestResponseDynamic.trainingRequestDynamic.trainingDetailDynamic.activityNameDynamic.activityTitle.toLowerCase()}.jpg');

  /// METHODS ==========================================================================================================
  /// Hero Method ------------------------------------------------------------------------------------------------------
  String _heroTag(
    GroupedTrainingRequestConversationDynamicByUserState groupedState,
  ) =>
      '${groupedState.groupedTrainingRequestConversationDynamicList.first.trainingRequestResponseDynamic..coachDynamic.userDynamic.username}+${groupedState.groupedTrainingRequestConversationDynamicList.first.trainingRequestResponseDynamic.trainingRequestDynamic.trainingRequestId}';

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  // void _closeTheScreen(BuildContext context) => Navigator.of(context).pop();
}
