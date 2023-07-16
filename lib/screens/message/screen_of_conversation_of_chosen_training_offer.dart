import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/message/bodies/zbodies.dart';
import 'package:my_project/screens/message/local_widgets/zlocal_widget.dart';

import 'zscreens.dart';

class ScreenOfConversationOfTrainingOffer extends StatelessWidget {
  static const String routeName = 'screen_of_conversation_of_training_offer';

  final AppFunctions _appFunctions = AppFunctions();
  final AppDateFormat _appDateFormat = AppDateFormat();

  ScreenOfConversationOfTrainingOffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TrainingOfferResponseDynamicWithDistanceByTrainingOfferBloc
        trainingOfferResponseDynamicWithDistanceByTrainingOfferBloc =
        context.read<
            TrainingOfferResponseDynamicWithDistanceByTrainingOfferBloc>();
    final GroupedTrainingOfferConversationDynamicByUserCubit
        groupedTrainingOfferConversationDynamicByUserCubit =
        context.read<GroupedTrainingOfferConversationDynamicByUserCubit>();

    final double screenWidth = context.width;

    return
        //
        // WillPopScope(
        //   onWillPop: () async {
        //     _unchooseGroupedTrainingOfferConversation(
        //         groupedTrainingOfferConversationDynamicByUserCubit);
        //     _closeTheScreen(context);
        //     return Future(() => true);
        //   },
        //   child:
        Scaffold(
            appBar: _displayConversationAppBar(
                context,
                trainingOfferResponseDynamicWithDistanceByTrainingOfferBloc,
                groupedTrainingOfferConversationDynamicByUserCubit),
            body: ConversationOfTrainingOfferBody(screenWidth: screenWidth));
    // );
  }

  /// DISPLAY ==========================================================================================================
  ConversationAppBar _displayConversationAppBar(
    BuildContext context,
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferBloc
        trainingOfferResponseDynamicWithDistanceByTrainingOfferBloc,
    GroupedTrainingOfferConversationDynamicByUserCubit
        groupedTrainingOfferConversationDynamicByUserCubit,
  ) =>
      ConversationAppBar(
        onTap: () =>
            _goToChosenTrainingOfferDetailScreenWhileBringingNecessaryBloc(
                context,
                trainingOfferResponseDynamicWithDistanceByTrainingOfferBloc,
                groupedTrainingOfferConversationDynamicByUserCubit),
        imageWidget: _displayActivityImage(
            groupedTrainingOfferConversationDynamicByUserCubit),
        infoTitle: _displayActivityTitle(
            groupedTrainingOfferConversationDynamicByUserCubit),
        infoDetail: _checkWheterThereIsAnyConversation(
                groupedTrainingOfferConversationDynamicByUserCubit)
            ? ''
            : _displayResponsePrices(
                groupedTrainingOfferConversationDynamicByUserCubit),
        date: _displayActivityDate(
            groupedTrainingOfferConversationDynamicByUserCubit),
        dateDetail: _appFunctions.showDayDifference(_findActivityDate(
            groupedTrainingOfferConversationDynamicByUserCubit)),
      );

  AssetImage _displayActivityImage(
    GroupedTrainingOfferConversationDynamicByUserCubit
        groupedTrainingOfferConversationDynamicByUserCubit,
  ) =>
      _findImageUrl(groupedTrainingOfferConversationDynamicByUserCubit);

  String _displayActivityTitle(
    GroupedTrainingOfferConversationDynamicByUserCubit
        groupedTrainingOfferConversationDynamicByUserCubit,
  ) =>
      _appFunctions.setWithoutUnderscore(_findActivityTitle(
          groupedTrainingOfferConversationDynamicByUserCubit));

  String _displayResponsePrices(
          GroupedTrainingOfferConversationDynamicByUserCubit
              groupedTrainingOfferConversationDynamicByUserCubit) =>
      '${_findTheCoachPerLessonPrice(groupedTrainingOfferConversationDynamicByUserCubit)}';

  String _displayActivityDate(
    GroupedTrainingOfferConversationDynamicByUserCubit
        groupedTrainingOfferConversationDynamicByUserCubit,
  ) =>
      _appDateFormat.monthAndDayWithDayName.format(_findActivityDate(
          groupedTrainingOfferConversationDynamicByUserCubit));

  /// METHODS ==========================================================================================================
  void _goToChosenTrainingOfferDetailScreenWhileBringingNecessaryBloc(
    BuildContext context,
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferBloc
        trainingOfferResponseDynamicWithDistanceByTrainingOfferBloc,
    GroupedTrainingOfferConversationDynamicByUserCubit
        groupedTrainingOfferConversationDynamicByUserCubit,
  ) {
    _bringConsistedActivityDynamicsWithDistance(
        trainingOfferResponseDynamicWithDistanceByTrainingOfferBloc,
        groupedTrainingOfferConversationDynamicByUserCubit);
    _goToChosenTrainingOfferDetailScreen(context);
  }

  void _bringConsistedActivityDynamicsWithDistance(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferBloc
        trainingOfferResponseDynamicWithDistanceByTrainingOfferBloc,
    GroupedTrainingOfferConversationDynamicByUserCubit
        groupedTrainingOfferConversationDynamicByUserCubit,
  ) =>
      trainingOfferResponseDynamicWithDistanceByTrainingOfferBloc.add(
          LoadTrainingOfferResponseDynamicWithDistanceByTrainingOfferEvent(
              trainingOfferId: _findTrainingOfferId(
                  groupedTrainingOfferConversationDynamicByUserCubit)));

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWheterThereIsAnyConversation(
    GroupedTrainingOfferConversationDynamicByUserCubit
        groupedTrainingOfferConversationDynamicByUserCubit,
  ) =>
      groupedTrainingOfferConversationDynamicByUserCubit
          .state.groupedTrainingOfferConversationDynamicList.isEmpty;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  AssetImage _findImageUrl(
    GroupedTrainingOfferConversationDynamicByUserCubit
        groupedTrainingOfferConversationDynamicByUserCubit,
  ) =>
      AssetImage(
          'assets/images/activities/${groupedTrainingOfferConversationDynamicByUserCubit.state.groupedTrainingOfferConversationDynamicList.first.trainingOfferResponseDynamic.trainingOfferDynamic.trainingDetailDynamic.activityNameDynamic.activityTitle.toLowerCase()}.jpg');

  String _findActivityTitle(
    GroupedTrainingOfferConversationDynamicByUserCubit
        groupedTrainingOfferConversationDynamicByUserCubit,
  ) =>
      groupedTrainingOfferConversationDynamicByUserCubit
          .state
          .groupedTrainingOfferConversationDynamicList
          .first
          .trainingOfferResponseDynamic
          .trainingOfferDynamic
          .trainingDetailDynamic
          .activityNameDynamic
          .activityTitle;

  int _findTheCoachPerLessonPrice(
    GroupedTrainingOfferConversationDynamicByUserCubit
        groupedTrainingOfferConversationDynamicByUserCubit,
  ) =>
      groupedTrainingOfferConversationDynamicByUserCubit
          .state
          .groupedTrainingOfferConversationDynamicList
          .last
          .trainingOfferResponseDynamic
          .trainingOfferDynamic
          .coachDynamic
          .perLessonPrice;

  DateTime _findActivityDate(
    GroupedTrainingOfferConversationDynamicByUserCubit
        groupedTrainingOfferConversationDynamicByUserCubit,
  ) =>
      groupedTrainingOfferConversationDynamicByUserCubit
          .state
          .groupedTrainingOfferConversationDynamicList
          .first
          .trainingOfferResponseDynamic
          .trainingOfferDynamic
          .createdAt;

  int _findTrainingOfferId(
    GroupedTrainingOfferConversationDynamicByUserCubit
        groupedTrainingOfferConversationDynamicByUserCubit,
  ) =>
      groupedTrainingOfferConversationDynamicByUserCubit
          .state
          .groupedTrainingOfferConversationDynamicList
          .first
          .trainingOfferResponseDynamic
          .trainingOfferDynamic
          .trainingOfferId!;

  // /// Unchoose Methods -------------------------------------------------------------------------------------------------
  //
  // void _unchooseGroupedTrainingOfferConversation(
  //   GroupedTrainingOfferConversationDynamicByUserCubit
  //       groupedTrainingOfferConversationDynamicByUserCubit,
  // ) {
  //   groupedTrainingOfferConversationDynamicByUserCubit.pressCancelButton();
  // }
  //
  // void _unchooseChosenActivityConversation(
  //   GroupedTrainingOfferConversationDynamicByUserCubit
  //       groupedTrainingOfferConversationDynamicByUserCubit,
  // ) {
  //   if (groupedTrainingOfferConversationDynamicByUserCubit.state
  //       .groupedTrainingOfferConversationDynamicByUser.isNotEmpty) {
  //     groupedTrainingOfferConversationDynamicByUserCubit
  //         .pressCancelButton(
  //             groupedTrainingOfferConversationDynamicByUserCubit.state
  //                 .groupedTrainingOfferConversationDynamicByUser);
  //   }
  // }
  //
  // void _unchooseMessagesOfChosenActivityConversationIfExist(
  //     ChosenActivityMessageDynamicByIndividualUserCubit
  //         chosenActivityMessageDynamicByIndividualUserCubit) {
  //   if (chosenActivityMessageDynamicByIndividualUserCubit
  //       .state.chosenActivityMessageDynamicByIndividualUser.isNotEmpty) {
  //     chosenActivityMessageDynamicByIndividualUserCubit.pressCancelButton(
  //         chosenActivityMessageDynamicByIndividualUserCubit
  //             .state.chosenActivityMessageDynamicByIndividualUser);
  //   }
  // }

  /// Screen Method ----------------------------------------------------------------------------------------------------
  void _goToChosenTrainingOfferDetailScreen(
    BuildContext context,
  ) =>
      Navigator.of(context)
          .pushNamed(ScreenOfChosenTrainingOfferDetail.routeName);

  // void _closeTheScreen(BuildContext context) => Navigator.of(context).pop();
}
