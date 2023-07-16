import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/message/bodies/zbodies.dart';

import 'local_widgets/zlocal_widget.dart';
import 'zscreens.dart';

class ScreenOfChosenActivityMessage extends StatelessWidget {
  static const String routeName = 'screen_of_chosen_conversation_of_activity';
  final AppFunctions _appFunctions = AppFunctions();
  final AppDateFormat _appDateFormat = AppDateFormat();

  ScreenOfChosenActivityMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ConsistedActivityDynamicWithDistanceByCreatedActivityBloc
        consistedActivityDynamicWithDistanceByCreatedActivityBloc = context
            .read<ConsistedActivityDynamicWithDistanceByCreatedActivityBloc>();
    final ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit =
        context.read<ChosenActivityConversationDynamicByUserCubit>();
    //
    // final ChosenActivityMessageDynamicByIndividualUserCubit
    //     chosenActivityMessageDynamicByIndividualUserCubit =
    //     context.read<ChosenActivityMessageDynamicByIndividualUserCubit>();

    return WillPopScope(
      onWillPop: () {
        context
            .read<MessageDynamicByActivityConversationBloc>()
            .add(CleanMessageDynamicByActivityConversation());
        //
        // _unchooseChosenActivityConversation(
        //     chosenActivityConversationDynamicByUserCubit);
        // _unchooseMessagesOfChosenActivityConversationIfExist(
        //     chosenActivityMessageDynamicByIndividualUserCubit);
        // _closeTheScreen(context);
        return Future(() => true);
      },
      child: Scaffold(
        appBar: _displayConversationAppBar(
            context,
            consistedActivityDynamicWithDistanceByCreatedActivityBloc,
            chosenActivityConversationDynamicByUserCubit),
        body: const ChosenConversationOfActivityBody(),
      ),
    );
  }

  /// DISPLAY ==========================================================================================================
  ConversationAppBar _displayConversationAppBar(
    BuildContext context,
    ConsistedActivityDynamicWithDistanceByCreatedActivityBloc
        consistedActivityDynamicWithDistanceByCreatedActivityBloc,
    ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit,
  ) =>
      ConversationAppBar(
          onTap: () =>
              _goToChosenActivityDetailScreenWhileBringingNecessaryBloc(
                  context,
                  consistedActivityDynamicWithDistanceByCreatedActivityBloc,
                  chosenActivityConversationDynamicByUserCubit),
          imageWidget: _displayActivityImage(
              chosenActivityConversationDynamicByUserCubit),
          infoTitle: _displayActivityTitle(
              chosenActivityConversationDynamicByUserCubit),
          date: _displayActivityDate(
              chosenActivityConversationDynamicByUserCubit));

  AssetImage _displayActivityImage(
    ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit,
  ) =>
      _findImageUrl(chosenActivityConversationDynamicByUserCubit);

  String _displayActivityTitle(
    ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit,
  ) =>
      _appFunctions.setWithoutUnderscore(_lengthOfActivityTitle(
                  chosenActivityConversationDynamicByUserCubit) >
              20
          ? '${_findActivityTitle(chosenActivityConversationDynamicByUserCubit).substring(0, 20)}...'
          : _findActivityTitle(chosenActivityConversationDynamicByUserCubit));

  String _displayActivityDate(
    ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit,
  ) =>
      _appDateFormat.monthAndDayWithDayName.format(
          _findActivityDate(chosenActivityConversationDynamicByUserCubit));

  /// METHODS ==========================================================================================================
  void _goToChosenActivityDetailScreenWhileBringingNecessaryBloc(
    BuildContext context,
    ConsistedActivityDynamicWithDistanceByCreatedActivityBloc
        consistedActivityDynamicWithDistanceByCreatedActivityBloc,
    ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit,
  ) {
    _bringConsistedActivityDynamicsWithDistance(
        consistedActivityDynamicWithDistanceByCreatedActivityBloc,
        chosenActivityConversationDynamicByUserCubit);
    _goToChosenActivityDetailScreen(context);
  }

  int _lengthOfActivityTitle(
          ChosenActivityConversationDynamicByUserCubit
              chosenActivityConversationDynamicByUserCubit) =>
      chosenActivityConversationDynamicByUserCubit
          .state
          .chosenActivityConversationDynamicList
          .first
          .consistedActivityDynamic
          .createdActivityDynamic
          .activityNameDynamic
          .activityTitle
          .length;

  /// Database Methods -------------------------------------------------------------------------------------------------
  void _bringConsistedActivityDynamicsWithDistance(
    ConsistedActivityDynamicWithDistanceByCreatedActivityBloc
        consistedActivityDynamicWithDistanceByCreatedActivityBloc,
    ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit,
  ) =>
      consistedActivityDynamicWithDistanceByCreatedActivityBloc.add(
          LoadConsistedActivityDynamicWithDistanceByCreatedActivityEvent(
              createdActivityId: _findCreatedActivityId(
                  chosenActivityConversationDynamicByUserCubit)));

  /// Find Methods -----------------------------------------------------------------------------------------------------
  AssetImage _findImageUrl(
    ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit,
  ) =>
      AssetImage(
          'assets/images/activities/${chosenActivityConversationDynamicByUserCubit.state.chosenActivityConversationDynamicList.first.consistedActivityDynamic.createdActivityDynamic.activityNameDynamic.activityTitle.toLowerCase()}.jpg');

  int _findCreatedActivityId(
          ChosenActivityConversationDynamicByUserCubit
              chosenActivityConversationDynamicByUserCubit) =>
      chosenActivityConversationDynamicByUserCubit
          .state
          .chosenActivityConversationDynamicList
          .first
          .consistedActivityDynamic
          .createdActivityDynamic
          .createdActivityId!;

  String _findActivityTitle(
    ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit,
  ) =>
      chosenActivityConversationDynamicByUserCubit
          .state
          .chosenActivityConversationDynamicList
          .first
          .consistedActivityDynamic
          .createdActivityDynamic
          .activityNameDynamic
          .activityTitle;

  DateTime _findActivityDate(
    ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit,
  ) =>
      chosenActivityConversationDynamicByUserCubit
          .state
          .chosenActivityConversationDynamicList
          .first
          .consistedActivityDynamic
          .createdActivityDynamic
          .createdAt;

  /// Screen Method ----------------------------------------------------------------------------------------------------
  void _goToChosenActivityDetailScreen(
    BuildContext context,
  ) =>
      Navigator.of(context).pushNamed(ScreenOfChosenActivityDetail.routeName);
}
