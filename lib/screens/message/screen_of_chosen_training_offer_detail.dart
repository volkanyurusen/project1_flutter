import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/message/bodies/zbodies.dart';
import 'package:my_project/widgets/widget.dart';



class ScreenOfChosenTrainingOfferDetail extends StatelessWidget {
  static const String routeName = 'screen_of_chosen_training_offer_detail';

  const ScreenOfChosenTrainingOfferDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        //
        // WillPopScope(
        //   onWillPop: () async {
        //     _closeTheScreen(context);
        //     return Future(() => true);
        //   },
        //   child:
        Scaffold(
            appBar: _createActivityPictureOnTop(context),
            body: const ChosenTrainingOfferDetailBody());
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
  BlocBuilder<GroupedTrainingOfferConversationDynamicByUserCubit,
          GroupedTrainingOfferConversationDynamicByUserState>
      _bringActivityNameFromDatabaseForDisplayingItsPhoto() => BlocBuilder<
              GroupedTrainingOfferConversationDynamicByUserCubit,
              GroupedTrainingOfferConversationDynamicByUserState>(
          builder: (context, groupedState) => AppBarHero(
              tag: _heroTag(groupedState),
              image: _displayChoiceActivityImage(groupedState)));

  /// DISPLAY ==========================================================================================================
  AssetImage _displayChoiceActivityImage(
    GroupedTrainingOfferConversationDynamicByUserState groupedState,
  ) =>
      AssetImage(
          'assets/images/activities/${groupedState.groupedTrainingOfferConversationDynamicList.first.trainingOfferResponseDynamic.trainingOfferDynamic.trainingDetailDynamic.activityNameDynamic.activityTitle.toLowerCase()}.jpg');

  /// METHODS ==========================================================================================================
  /// Hero Method ------------------------------------------------------------------------------------------------------
  String _heroTag(
    GroupedTrainingOfferConversationDynamicByUserState groupedState,
  ) =>
      '${groupedState.groupedTrainingOfferConversationDynamicList.first.trainingOfferResponseDynamic.trainingOfferDynamic.coachDynamic.userDynamic.username}+${groupedState.groupedTrainingOfferConversationDynamicList.first.trainingOfferResponseDynamic.trainingOfferDynamic.trainingOfferId}';

  // /// Screen Methods ---------------------------------------------------------------------------------------------------
  // void _closeTheScreen(BuildContext context) => Navigator.of(context).pop();
}
