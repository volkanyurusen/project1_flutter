import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import '../zscreens.dart';

class TrainingRequestResponseBodyTrainingRequestResponseDetailArea
    extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final double screenHeight;
  final double screenWidth;
  final int onWhichNumber = 0;

  TrainingRequestResponseBodyTrainingRequestResponseDetailArea({
    required this.screenHeight,
    required this.screenWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc =
        context.read<UserFollowingDynamicByUserBloc>();
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc =
        context.read<UserLikingDynamicByUserBloc>();
    // 
    // TrainingRequestResponseDynamicWithDistanceByIndividualCoachBloc
    //     trainingRequestResponseDynamicWithDistanceByIndividualCoachBloc =
    //     context.read<
    //         TrainingRequestResponseDynamicWithDistanceByIndividualCoachBloc>();
    ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
        chosenResponseAmongThoseWhoRespondedTrainingRequestCubit = context
            .read<ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit>();
    TextStyle? headlineSmall = Theme.of(context).textTheme.headlineSmall!;
    TextStyle? bodyMedium = Theme.of(context).textTheme.bodyMedium!;

    return CustomColumn(
      children: [
        _bringTrainingRequestResponseDetailListFromDatabaseAndDisplayThem(
          userFollowingDynamicByUserBloc,
          userLikingDynamicByUserBloc,
          chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
          screenHeight,
          screenWidth,
          headlineSmall,
          bodyMedium,
        ),
      ],
    );
  }

  /// LOADING ==========================================================================================================
  CustomColumn _createTrainingRequestResponseLoadingArea() =>
      const CustomColumn(
          children: [CustomAppSizedBox(height: 100), StateLoading()]);

  /// BLOC =============================================================================================================
  BlocBuilder<TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc,
          TrainingRequestResponseDynamicWithDistanceByTrainingRequestState>
      _bringTrainingRequestResponseDetailListFromDatabaseAndDisplayThem(
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
        chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
    double screenHeight,
    double screenWidth,
    TextStyle headlineSmall,
    TextStyle bodyMedium,
  ) =>
          BlocBuilder<
              TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc,
              TrainingRequestResponseDynamicWithDistanceByTrainingRequestState>(
            builder: (context, state) {
              // int onWhichNumber = 0;
              List<String> processWhereResponsesStayOn = [];
              List<String> uniqueProcessDetailNamesOfCreatedActivity =
                  <String>[];
              _createListBasedOnProcessNameWhereResponsesStayOn(
                  state, processWhereResponsesStayOn);
              _createListBasedOnUniqueProcessNameWhereResponsesStayOn(
                  state, uniqueProcessDetailNamesOfCreatedActivity);
              switch (state.status) {
                case StatusWithoutLoading.initial:
                  return _createTrainingRequestResponseLoadingArea();
                case StatusWithoutLoading.success:
                  if (state
                      .trainingRequestResponseDynamicWithDistanceList.isEmpty) {
                    return const InformationAboutExisting(
                        detailLabel: 'respond of this request');
                  } else {
                    return _createTrainingRequestResponseAreaBasedOnProcessDetail(
                        context,
                        state,
                        userFollowingDynamicByUserBloc,
                        userLikingDynamicByUserBloc,
                        chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
                        screenHeight,
                        screenWidth,
                        uniqueProcessDetailNamesOfCreatedActivity,
                        processWhereResponsesStayOn,
                        onWhichNumber,
                        headlineSmall,
                        bodyMedium);
                  }
                case StatusWithoutLoading.failure:
                  return StateError(error: state.error);
              }
            },
          );

  /// CREATE ===========================================================================================================
  CustomColumn _createTrainingRequestResponseAreaBasedOnProcessDetail(
    BuildContext context,
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
        chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
    double screenHeight,
    double screenWidth,
    List<String> uniqueProcessDetailNamesOfCreatedActivity,
    List<String> processWhereResponsesStayOn,
    int onWhichNumber,
    TextStyle headlineSmall,
    TextStyle bodyMedium,
  ) =>
      CustomColumn(
          children: _createTrainingRequestResponseBasedOnProcessDetail(
        context,
        state,
        userFollowingDynamicByUserBloc,
        userLikingDynamicByUserBloc,
        chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
        screenHeight,
        screenWidth,
        uniqueProcessDetailNamesOfCreatedActivity,
        processWhereResponsesStayOn,
        onWhichNumber,
        headlineSmall,
        bodyMedium,
      ));

  List<Widget> _createTrainingRequestResponseBasedOnProcessDetail(
    BuildContext context,
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
        chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
    double screenHeight,
    double screenWidth,
    List<String> uniqueProcessDetailNamesOfCreatedActivity,
    List<String> processWhereResponsesStayOn,
    int onWhichNumber,
    TextStyle headlineSmall,
    TextStyle bodyMedium,
  ) =>
      List.generate(
        state.hasReachedMax == true
            ? uniqueProcessDetailNamesOfCreatedActivity.length
            : uniqueProcessDetailNamesOfCreatedActivity.length + 1,
        (index) => index >= uniqueProcessDetailNamesOfCreatedActivity.length
            ? const BottomLoader()
            : CustomColumn(children: [
                const CustomAppSizedBox(height: 18),
                _displayUniqueProcess(uniqueProcessDetailNamesOfCreatedActivity,
                    index, headlineSmall),
                AppWrap(
                  wrapSpacing: 18,
                  wrapRunSpacing: 5,
                  children: List.generate(
                      processWhereResponsesStayOn
                          .where((element) =>
                              element ==
                              uniqueProcessDetailNamesOfCreatedActivity
                                  .elementAt(index))
                          .length, (secondIndex) {
                    int chosenIndex = onWhichNumber;
                    onWhichNumber++;
                    return GestureDetector(
                      onLongPress: () {},
                      onTap: () => _goToChosenCoachScreenWithBringingNecessaryBlocs(
                          context,
                          state,
                          userFollowingDynamicByUserBloc,
                          userLikingDynamicByUserBloc,
                          chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
                          chosenIndex),
                      child: _generateTrainingRequestResponseArea(state,
                          screenHeight, screenWidth, chosenIndex, bodyMedium),
                    );
                  }),
                ),
              ]),
      );

  /// DISPLAY ==========================================================================================================
  CoachCard _generateTrainingRequestResponseArea(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    double screenHeight,
    double screenWidth,
    int chosenIndex,
    TextStyle bodyMedium,
  ) =>
      CoachCard(
        screenHeight: screenHeight,
        screenWidth: screenWidth,
        heroTag: _responseHeroTag(state, chosenIndex),
        image: _displayCoachPhoto(state, chosenIndex),
        username: _displayCoachUsername(state, chosenIndex),
        coachingNameForIcon: _displayCoachingNameIcon(state, chosenIndex),
        coachingPrice: _displayCoachingPrice(state, chosenIndex),
        coachingExperience: _displayCoachingExperience(state, chosenIndex),
        distance: _displayDistance(state, chosenIndex),
        isResponded: false,
      );

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayUniqueProcess(
    List<String> uniqueProcessDetailNamesOfCreatedActivity,
    int index,
    TextStyle headlineSmall,
  ) =>
      AppHeaderText(
          textLabel: uniqueProcessDetailNamesOfCreatedActivity.elementAt(index),
          textStyle: headlineSmall.copyWith(color: _appColors.onSecondary));

  NetworkImage _displayCoachPhoto(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    int chosenIndex,
  ) =>
      NetworkImage(_findCoachPhoto(state, chosenIndex));

  String _displayCoachUsername(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    int chosenIndex,
  ) =>
      _responseUsername(state, chosenIndex).length > 10
          ? '${_responseUsername(state, chosenIndex).substring(0, 10)}...'
          : _responseUsername(state, chosenIndex);

  String _displayCoachingNameIcon(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    int chosenIndex,
  ) =>
      state.trainingRequestResponseDynamicWithDistanceList[chosenIndex]
          .coachDynamic.coachingTypeDynamic.coachingTypeName;

  int _displayCoachingPrice(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    int chosenIndex,
  ) =>
      state.trainingRequestResponseDynamicWithDistanceList[chosenIndex]
          .coachDynamic.perLessonPrice;

  String _displayCoachingExperience(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    int chosenIndex,
  ) =>
      state.trainingRequestResponseDynamicWithDistanceList[chosenIndex]
          .coachDynamic.coachingExperienceDynamic.experienceYear;

  double _displayDistance(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    int chosenIndex,
  ) =>
      state.trainingRequestResponseDynamicWithDistanceList[chosenIndex]
          .distanceBetween;

  /// METHODS ==========================================================================================================
  void _goToChosenCoachScreenWithBringingNecessaryBlocs(
    BuildContext context,
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
        chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
    int chosenIndex,
  ) {
    _bringCoachFollowingDetailFromDatabase(
        state, userFollowingDynamicByUserBloc, chosenIndex);
    _bringCoachLikeDetailFromDatabase(
        state, userLikingDynamicByUserBloc, chosenIndex);
    // _bringTrainingRequestResponseDetailFromDatabaseBasedOnCoach(
    //     state,
    //     chosenIndex);
    _assignTheCoachAsChosenCoach(state,
        chosenResponseAmongThoseWhoRespondedTrainingRequestCubit, chosenIndex);
    _goToChosenCoachScreen(context);
  }

  void _createListBasedOnProcessNameWhereResponsesStayOn(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    List<String> processWhereResponsesStayOn,
  ) {
    for (var element in state.trainingRequestResponseDynamicWithDistanceList) {
      processWhereResponsesStayOn.add(element.processDetailDynamic.processName);
    }
  }

  void _createListBasedOnUniqueProcessNameWhereResponsesStayOn(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    List<String> uniqueProcessDetailNamesOfCreatedActivity,
  ) {
    for (var element in state.trainingRequestResponseDynamicWithDistanceList) {
      if (uniqueProcessDetailNamesOfCreatedActivity
          .contains(element.processDetailDynamic.processName)) {
      } else {
        uniqueProcessDetailNamesOfCreatedActivity
            .add(element.processDetailDynamic.processName);
      }
    }
  }

  /// Hero Tag ---------------------------------------------------------------------------------------------------------
  String _responseHeroTag(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    int chosenIndex,
  ) =>
      state.trainingRequestResponseDynamicWithDistanceList[chosenIndex]
          .trainingRequestResponseId
          .toString() +
      state.trainingRequestResponseDynamicWithDistanceList[chosenIndex]
          .coachDynamic.userDynamic.uId!
          .toString();

  String _responseUsername(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    int chosenIndex,
  ) =>
      state.trainingRequestResponseDynamicWithDistanceList[chosenIndex]
          .coachDynamic.userDynamic.username;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findCoachPhoto(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    int chosenIndex,
  ) =>
      state.trainingRequestResponseDynamicWithDistanceList[chosenIndex]
          .coachDynamic.userDynamic.picUrl;

  /// Request From DB Method -------------------------------------------------------------------------------------------
  void _bringCoachFollowingDetailFromDatabase(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    int chosenIndex,
  ) =>
      userFollowingDynamicByUserBloc.add(LoadUserFollowingDynamicByUserEvent(
          uId: state.trainingRequestResponseDynamicWithDistanceList[chosenIndex]
              .coachDynamic.userDynamic.uId!));

  void _bringCoachLikeDetailFromDatabase(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    int chosenIndex,
  ) =>
      userLikingDynamicByUserBloc.add(LoadUserLikingDynamicByUserEvent(
          uId: state.trainingRequestResponseDynamicWithDistanceList[chosenIndex]
              .coachDynamic.userDynamic.uId!));

  // void _bringTrainingRequestResponseDetailFromDatabaseBasedOnCoach(
  //   TrainingRequestResponseDynamicWithDistanceByTrainingRequestState
  //       state,
  //   TrainingRequestResponseDynamicWithDistanceByIndividualCoachBloc
  //       trainingRequestResponseDynamicWithDistanceByIndividualCoachBloc,
  //   int chosenIndex,
  // ) =>
  //     trainingRequestResponseDynamicWithDistanceByIndividualCoachBloc.add(
  //         LoadTrainingRequestResponseDynamicWithDistanceByIndividualCoachEvent(
  //             uId: state
  //                 .trainingRequestResponseDynamicWithDistanceList[
  //                     chosenIndex]
  //                 .coachDynamic
  //                 .userDynamic
  //                 .uId!));

  void _assignTheCoachAsChosenCoach(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
        chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
    int chosenIndex,
  ) =>
      chosenResponseAmongThoseWhoRespondedTrainingRequestCubit
          .pressChosenRespond(state
              .trainingRequestResponseDynamicWithDistanceList[chosenIndex]);

  /// Screen Method ----------------------------------------------------------------------------------------------------
  void _goToChosenCoachScreen(
    BuildContext context,
  ) =>
      Navigator.of(context).pushNamed(ScreenOfChosenCoach.routeName);
}


//
// CustomColumn(
//       children: [
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
//                           .trainingRequestResponseDynamicWithDistanceList[
//                               chosenIndex]
//                           .coachDynamic
//                           .userDynamic
//                           .picUrl),
//                       fit: BoxFit.fill),
//                   borderRadius: _appVisualConstants.borderRadiusCircularTop,
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
//                 child: Column(children: [
//                   AppHeader(
//                     firstWidget: Row(
//                       children: [
//                         AppHeaderText(
//                             textLabel: state
//                                         .trainingRequestResponseDynamicWithDistanceList[
//                                             chosenIndex]
//                                         .coachDynamic
//                                         .userDynamic
//                                         .username
//                                         .length >
//                                     10
//                                 ? '${state.trainingRequestResponseDynamicWithDistanceList[chosenIndex].coachDynamic.userDynamic.username.substring(0, 10)}...'
//                                 : state
//                                     .trainingRequestResponseDynamicWithDistanceList[
//                                         chosenIndex]
//                                     .coachDynamic
//                                     .userDynamic
//                                     .username),
//                         AppIconConstants().coachingTypeIcons[AppListConstants()
//                             .coachingType
//                             .indexOf(state
//                                 .trainingRequestResponseDynamicWithDistanceList[
//                                     chosenIndex]
//                                 .coachDynamic
//                                 .coachingTypeDynamic
//                                 .coachingTypeName)],
//                       ],
//                     ),
//                     thirdWidget: AppHeaderText(
//                         textLabel:
//                             ' \$ ${state.trainingRequestResponseDynamicWithDistanceList[chosenIndex].coachDynamic.perLessonPrice.toString()}'),
//                   ),
//                   const CustomAppSizedBox(height: 5.0),
//                   AppHeader(
//                     firstWidget: AppHeaderText(
//                       textLabel: state
//                           .trainingRequestResponseDynamicWithDistanceList[
//                               chosenIndex]
//                           .coachDynamic
//                           .coachingExperienceDynamic
//                           .experienceYear,
//                       textStyle: bodyMedium .copyWith(color: _appColors.primary),
//                     ),
//                   )
//                 ]),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
