// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/coaching/bodies/zbodies.dart';
import 'package:my_project/screens/coaching/pop_ups/zpop_ups.dart';
import 'package:my_project/widgets/widget.dart';

class ScreenOfTrainingOfferResponse extends StatelessWidget {
  static const String routeName = 'screen_of_training_offer_response';

  const ScreenOfTrainingOfferResponse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return _unchooseChosenTrainingOfferResponse(context);
        },
        child: Scaffold(
          appBar: _createTrainingPictureOnTop(context),
          bottomNavigationBar: const CustomBottomNavigationBar(),
          body: const TrainingOfferResponseBody(),
        ));
  }

  // CREATE ============================================================================================================
  _createTrainingPictureOnTop(BuildContext context) => PreferredSizeForPicture(
      context: context,
      child: AppBar(
        flexibleSpace: _buildChosenTrainingImage(),
        actions: [_buildCancelIcon()],
      ));

  // TRAINING IMAGE ====================================================================================================
  // BUILD =============================================================================================================
  BlocBuilder<ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit,
          ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState>
      _buildChosenTrainingImage() => BlocBuilder<
              ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit,
              ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState>(
          builder: (context, chosenState) => AppBarHero(
              tag: _choiceTrainingHeroTag(chosenState),
              image: _displayChoiceTrainingImage(chosenState)));

  // DISPLAY ===========================================================================================================
  AssetImage _displayChoiceTrainingImage(
    ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState chosenState,
  ) =>
      AssetImage(
          'assets/images/activities/${chosenState.chosenTrainingOfferDynamicList.last.trainingDetailDynamic.activityNameDynamic.activityTitle.toLowerCase()}.jpg');

  // METHODS ===========================================================================================================
  // Hero Methods ------------------------------------------------------------------------------------------------------
  String _choiceTrainingHeroTag(
    ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState chosenState,
  ) =>
      chosenState.chosenTrainingOfferDynamicList.last.trainingOfferId
          .toString();

  // CANCEL ICON =======================================================================================================
  // BUILD =============================================================================================================
  BlocBuilder<ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit,
          ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState>
      _buildCancelIcon() => BlocBuilder<
              ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit,
              ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState>(
          builder: (context, state) => IconButton(
              splashRadius: 18,
              icon: _displayIcon(),
              onPressed: () {
                _openCancelTheActivityPopUp(context, state);
              }));

  // DISPLAY ===========================================================================================================
  Icon _displayIcon() => const Icon(Icons.clear_outlined);

  // METHODS ===========================================================================================================
  void _openCancelTheActivityPopUp(
    BuildContext context,
    ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState chosenState,
  ) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return TrainingOfferDeletingPopUp();
          });

  // Unchoose Methods --------------------------------------------------------------------------------------------------
  Future<bool> _unchooseChosenTrainingOfferResponse(BuildContext context) {
    context
        .read<
            TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc>()
        .add(
            CleanTrainingOfferResponseDynamicWithDistanceOfChosenActivityByTrainee());
    return Future(() => true);
  }

  // Unchoose Methods -------------------------------------------------------------------------------------------------
  // void _unChooseChosenTrainingOffer(BuildContext context) => context
  //     .read<
  //         ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit>()
  //     .pressCancelButton(context
  //         .read<
  //             ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit>()
  //         .state
  //         .chosenTrainingOfferDynamicList
  //         .last);

  // // ACTIVITY TITLE AND DATE AREA =====================================================================================
  // AppHeader _createTrainingTitleAndDateArea(
  //   ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState
  //       chosenState,
  //   TextStyle? headline3,
  // ) =>
  //     AppHeader(
  //       firstWidget: _displayActivityTitle(chosenState, headline3),
  //       thirdWidget: _displayActivityDate(chosenState, headline3),
  //     );

  // // Activity Title
  // AppHeaderText _displayActivityTitle(
  //   ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState
  //       chosenState,
  //   TextStyle? headline3,
  // ) =>
  //     AppHeaderText(
  //       textLabel: _appFunctions.setWithoutUnderscore(chosenState
  //           .chosenTrainingOfferAmongTrainingOfferDynamicOfCoach
  //           .last
  //           .trainingDetailDynamic
  //           .activityNameDynamic
  //           .activityTitle),
  //       textStyle: headline3,
  //     );

  // // Activity Date
  // AppHeaderText _displayActivityDate(
  //   ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState
  //       chosenState,
  //   TextStyle? headline3,
  // ) =>
  //     AppHeaderText(
  //       textLabel: AppDateFormat().monthAndDayWithDayName.format(chosenState
  //           .chosenTrainingOfferAmongTrainingOfferDynamicOfCoach
  //           .last
  //           .createdAt),
  //       textStyle: headline3,
  //     );

  // // ACTIVITY LEVEL AREA ==============================================================================================
  // AppHeader _createActivityLevelArea(
  //   // BuildContext context,
  //   ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState
  //       chosenState,
  //   TextStyle? headline6,
  // ) =>
  //     AppHeader(
  //         firstWidget: _displayActivityLevelTitle(headline6),
  //         thirdWidget: _displayActivityLevelDetail(chosenState, headline6));

  // // Activity Level Title
  // AppHeaderText _displayActivityLevelTitle(
  //   TextStyle? headline6,
  // ) =>
  //     AppHeaderText(
  //       textLabel: 'Activity Level',
  //       textStyle: headline6,
  //     );

  // // Activity Level Detail
  // AppHeaderText _displayActivityLevelDetail(
  //   ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState
  //       chosenState,
  //   TextStyle? headline6,
  // ) =>
  //     AppHeaderText(
  //       textLabel: chosenState
  //           .chosenTrainingOfferAmongTrainingOfferDynamicOfCoach
  //           .last
  //           .trainingDetailDynamic
  //           .prefferedTrainingLevel
  //           .activityLevelName
  //           .toCapitalized(),
  //       textStyle: headline6,
  //     );

  // // BUILD RESPONSE AREA BRING RESPONSE NUMBERS =======================================================================
  // BlocBuilder<
  //         BringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferBloc,
  //         BringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferState>
  //     _buildResponseAreaAfterBringingResponseNumber(
  //   ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState
  //       chosenState,
  //   double screenWidth,
  //   TextStyle? headline3,
  // ) =>
  //         BlocBuilder<
  //                 BringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferBloc,
  //                 BringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferState>(
  //             builder: (context, state) {
  //           if (state.status == Status.loading) {
  //             return _createSkeltonArea(screenWidth);
  //           } else if (state.status == Status.success) {
  //             if (state
  //                 .bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferList
  //                 .isEmpty) {
  //               _createEmptyStateArea(headline3);
  //             } else {
  //               return _createResponseArea(state, chosenState, headline3);
  //             }
  //           } else if (state.status == Status.failure) {
  //             return StateError(error: state.error);
  //           }
  //           return NothingReturned();
  //         });

  // // EMPTY STATE AREA =================================================================================================
  // AppHeader _createEmptyStateArea(TextStyle? headline3) =>
  //     AppHeader(firstWidget: _displayEmtyState(headline3));

  // AppHeaderText _displayEmtyState(TextStyle? headline3) => AppHeaderText(
  //       textLabel: 'Response (0)',
  //       textStyle: headline3,
  //     );

  // // RESPONSE AREA ====================================================================================================
  // AppHeader _createResponseArea(
  //   BringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferState
  //       state,
  //   ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState
  //       chosenState,
  //   TextStyle? headline3,
  // ) =>
  //     AppHeader(
  //       firstWidget: _displayResponseTitleAndNumber(state, headline3),
  //       thirdWidget: _displayActivityDate(chosenState, headline3),
  //     );

  // // Response Title & Numbers
  // AppHeaderText _displayResponseTitleAndNumber(
  //   BringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferState
  //       state,
  //   TextStyle? headline3,
  // ) =>
  //     AppHeaderText(
  //       textLabel:
  //           'Responses (${state.bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferList.length})',
  //       textStyle: headline3,
  //     );

  // // Responses Process Name List
  // void _createListBasedOnProcessNameWhereResponsesStayOn(
  //     BringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferState
  //         state,
  //     List<dynamic> processWhereResponsesStayOn) {
  //   for (var element in state
  //       .bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferList) {
  //     processWhereResponsesStayOn.add(element.processDetailDynamic.processName);
  //   }
  // }

  // // Unique Responses Process Name List
  // void _createListBasedOnUniqueProcessNameWhereResponsesStayOn(
  //     BringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferState
  //         state,
  //     Set<dynamic> uniqueProcessDetailNamesOfCreatedActivity) {
  //   for (var element in state
  //       .bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferList) {
  //     uniqueProcessDetailNamesOfCreatedActivity
  //         .add(element.processDetailDynamic.processName);
  //   }
  // }

  // // RESPONSE'S DETAIL ================================================================================================
  // BlocBuilder<
  //         BringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferBloc,
  //         BringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferState>
  //     _bringResponsesDetail(
  //       CoachFollowingDynamicByIndividualCoachBloc CoachFollowingDynamicByIndividualCoachBloc,
  //   double screenHeight,
  //   double screenWidth,
  //   TextStyle headline5,
  //   TextStyle bodyText2,
  // ) {
  //   return BlocBuilder<
  //       BringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferBloc,
  //       BringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferState>(
  //     builder: (context, state) {
  //       int _onWhichNumber = 0;
  //       List _processWhereResponsesStayOn = [];
  //       Set _uniqueProcessDetailNamesOfCreatedActivity = <String>{};
  //       _createListBasedOnProcessNameWhereResponsesStayOn(
  //           state, _processWhereResponsesStayOn);
  //       _createListBasedOnUniqueProcessNameWhereResponsesStayOn(
  //           state, _uniqueProcessDetailNamesOfCreatedActivity);
  //       if (state.status == Status.loading) {
  //         return const CustomColumn(children: [
  //           CustomAppSizedBox(height: 100),
  //           StateLoading(),
  //         ]);
  //       } else if (state.status == Status.success) {
  //         if (state
  //             .bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferList
  //             .isEmpty) {
  //           return const SizedBox();
  //         } else {
  //           return CustomColumn(
  //               children: _createCustomColumnBasedOnClassifiedProcessName(
  //             context,
  //             state,
  //             CoachFollowingDynamicByIndividualCoachBloc,
  //             screenHeight,
  //             screenWidth,
  //             _uniqueProcessDetailNamesOfCreatedActivity,
  //             _processWhereResponsesStayOn,
  //             _onWhichNumber,
  //             headline5,
  //             bodyText2,
  //           ));
  //         }
  //       } else if (state.status == Status.failure) {
  //         return StateError(error: state.error);
  //       }
  //       return const SizedBox();
  //     },
  //   );
  // }

  // // RESPONSES DETAIL AREA BASED ON PROCESS NAME ======================================================================
  // List<Widget> _createCustomColumnBasedOnClassifiedProcessName(
  //   BuildContext context,
  //   BringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferState
  //       state,
  //       CoachFollowingDynamicByIndividualCoachBloc CoachFollowingDynamicByIndividualCoachBloc,
  //   double screenHeight,
  //   double screenWidth,
  //   Set<dynamic> uniqueProcessDetailNamesOfCreatedActivity,
  //   List<dynamic> processWhereResponsesStayOn,
  //   int onWhichNumber,
  //   TextStyle headline5,
  //   TextStyle bodyText2,
  // ) {
  //   return List.generate(
  //     uniqueProcessDetailNamesOfCreatedActivity.length,
  //     (index) => CustomColumn(children: [
  //       const CustomAppSizedBox(height: 18),
  //       _displayUniqueProcess(
  //           uniqueProcessDetailNamesOfCreatedActivity, index, headline5),
  //       AppWrap(
  //         wrapSpacing: 18,
  //         wrapRunSpacing: 5,
  //         children: List.generate(
  //             processWhereResponsesStayOn
  //                 .where((element) =>
  //                     element ==
  //                     uniqueProcessDetailNamesOfCreatedActivity
  //                         .elementAt(index))
  //                 .length,
  //             (index) => BlocBuilder<ChosenResponseAmongThoseWhoRespondCubit,
  //                     ChosenResponseAmongThoseWhoRespondState>(
  //                   builder: (context, chosenState) {
  //                     int _chosenIndex = onWhichNumber;
  //                     onWhichNumber++;
  //                     return GestureDetector(
  //                       onLongPress: () {},
  //                       onTap: () {
  //                         _showDetailOfChosenResponse(
  //                             context, state, CoachFollowingDynamicByIndividualCoachBloc, _chosenIndex);
  //                       },
  //                       child: _createResponsesChoiceColumn(state, screenHeight,
  //                           screenWidth, _chosenIndex, bodyText2),
  //                     );
  //                   },
  //                 )),
  //       ),
  //     ]),
  //   );
  // }

  // // Display Unique Process
  // AppHeaderText _displayUniqueProcess(
  //   Set<dynamic> uniqueProcessDetailNamesOfCreatedActivity,
  //   int index,
  //   TextStyle headline5,
  // ) =>
  //     AppHeaderText(
  //         textLabel: uniqueProcessDetailNamesOfCreatedActivity.elementAt(index),
  //         textStyle: headline5.copyWith(color: _appColors.onSecondary));

  // // RESPONSE CHOICE COLUMN ===========================================================================================
  // _createResponsesChoiceColumn(
  //   BringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferState
  //       state,
  //   double screenHeight,
  //   double screenWidth,
  //   int chosenIndex,
  //   TextStyle bodyText2,
  // ) =>
  //     Column(
  //       children: [
  //         const CustomAppSizedBox(),
  //         Container(
  //           height: screenHeight * 0.30,
  //           width: screenWidth * 0.43,
  //           decoration: BoxDecoration(
  //             color: Colors.transparent,
  //             border: Border.all(color: _appColors.unselectedContainerColor),
  //             borderRadius: _appVisualConstants.borderRadiusSmallCircular,
  //           ),
  //           child: Column(
  //             children: [
  //               Container(
  //                 height: screenHeight * 0.22,
  //                 decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                       image: NetworkImage(state
  //                           .bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferList[
  //                               chosenIndex]
  //                           .coachDynamic
  //                           .CoachDynamic
  //                           .picUrl),
  //                       fit: BoxFit.fill),
  //                   borderRadius: _appVisualConstants.borderRadiusCircularTop,
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(
  //                     horizontal: 5.0, vertical: 8.0),
  //                 child: Column(children: [
  //                   AppHeader(
  //                     firstWidget: Row(
  //                       children: [
  //                         AppHeaderText(
  //                             textLabel: state
  //                                         .bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferList[
  //                                             chosenIndex]
  //                                         .coachDynamic
  //                                         .CoachDynamic
  //                                         .Coachname
  //                                         .length >
  //                                     10
  //                                 ? '${state.bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferList[chosenIndex].coachDynamic.CoachDynamic.Coachname.substring(0, 10)}...'
  //                                 : state
  //                                     .bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferList[
  //                                         chosenIndex]
  //                                     .coachDynamic
  //                                     .CoachDynamic
  //                                     .Coachname),
  //                         AppIconConstants().coachingTypeIcons[
  //                             AppListConstants().coachingType.indexOf(state
  //                                 .bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferList[
  //                                     chosenIndex]
  //                                 .coachDynamic
  //                                 .coachingTypeDynamic
  //                                 .coachingTypeName)],
  //                       ],
  //                     ),
  //                     thirdWidget: AppHeaderText(
  //                         textLabel:
  //                             ' \$ ${state.bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferList[chosenIndex].coachDynamic.perLessonPrice.toString()}'),
  //                   ),
  //                   const CustomAppSizedBox(height: 5.0),
  //                   AppHeader(
  //                     firstWidget: AppHeaderText(
  //                       textLabel: state
  //                           .bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferList[
  //                               chosenIndex]
  //                           .coachDynamic
  //                           .coachingExperienceDynamic
  //                           .experienceYear,
  //                       textStyle:
  //                           bodyText2.copyWith(color: _appColors.primary),
  //                     ),
  //                   )
  //                 ]),
  //               ),
  //             ],
  //           ),
  //         ),
  //         const CustomAppSizedBox(),
  //       ],
  //     );

  // // Hero Tag
  // String _responseHeroTag(
  //   BringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferState
  //       state,
  //   int chosenIndex,
  // ) =>
  //     state
  //         .bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferList[
  //             chosenIndex]
  //         .trainingOfferResponseId
  //         .toString() +
  //     state
  //         .bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferList[
  //             chosenIndex]
  //         .coachDynamic
  //         .CoachDynamic
  //         .Coachname;

  // // Response's Coachname
  // String _responseCoachname(
  //   BringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferState
  //       state,
  //   int chosenIndex,
  // ) =>
  //     state
  //         .bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferList[
  //             chosenIndex]
  //         .coachDynamic
  //         .CoachDynamic
  //         .Coachname;

  // // Response's distance
  // String _responseDistance(
  //   BringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferState
  //       state,
  //   int chosenIndex,
  // ) =>
  //     '${state.bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferList[chosenIndex].distanceBetween.round().toString()} km';

  // void _showDetailOfChosenResponse(
  //   BuildContext context,
  //   BringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferState
  //       state,
  //       CoachFollowingDynamicByIndividualCoachBloc CoachFollowingDynamicByIndividualCoachBloc,
  //   int chosenIndex,
  // ) {
  //   CoachFollowingDynamicByIndividualCoachBloc.add(
  //       LoadCoachFollowingDynamicByIndividualCoachEvent(
  //           uId: state
  //               .bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferList[
  //                   chosenIndex]
  //               .coachDynamic
  //               .CoachDynamic
  //               .uId!));
  //   _CoachLikingDynamicByIndividualCoachBloc.add(
  //       LoadCoachLikingDynamicByIndividualCoachEvent(
  //           uId: state
  //               .bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferList[
  //                   chosenIndex]
  //               .coachDynamic
  //               .CoachDynamic
  //               .uId!));
  //   _trainingOfferResponseDynamicWithDistanceByIndividualCoachBloc.add(
  //       LoadTrainingOfferResponseDynamicWithDistanceByIndividualCoachEvent(
  //           uId: state
  //               .bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferList[
  //                   chosenIndex]
  //               .coachDynamic
  //               .CoachDynamic
  //               .uId!));
  //   _chosenResponseAmongThoseWhoRespondCubit.pressChosenAttendee(state
  //           .bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferList[
  //       chosenIndex]);
  //   Navigator.of(context).push(MaterialPageRoute(
  //       builder: (_) => MultiBlocProvider(providers: [
  //             BlocProvider.value(
  //                 value: _CoachFollowingDynamicByIndividualCoachBloc),
  //             BlocProvider.value(value: _CoachLikingDynamicByIndividualCoachBloc),
  //             BlocProvider.value(
  //                 value:
  //                     _trainingOfferResponseDynamicWithDistanceByIndividualCoachBloc),
  //             BlocProvider.value(
  //                 value: _chosenResponseAmongThoseWhoRespondCubit),
  //           ], child: ChosenCoachScreen())));
  // }
}
