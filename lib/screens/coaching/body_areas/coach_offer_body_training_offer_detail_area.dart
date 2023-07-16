import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import '../zscreens.dart';

class CoachOfferBodyTrainingOfferDetailArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final double screenHeight;
  final double screenWidth;
  final int onWhichNumber = 0;

  CoachOfferBodyTrainingOfferDetailArea({
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
    // TrainingOfferResponseDynamicWithDistanceByIndividualCoachBloc
    //     trainingOfferResponseDynamicWithDistanceByIndividualCoachBloc =
    //     context.read<
    //         TrainingOfferResponseDynamicWithDistanceByIndividualCoachBloc>();
    ChosenCoachAmongThoseWhoFoundCubit chosenCoachAmongThoseWhoFoundCubit =
        context.read<ChosenCoachAmongThoseWhoFoundCubit>();
    TextStyle? headlineSmall = Theme.of(context).textTheme.headlineSmall!;
    TextStyle? bodyMedium = Theme.of(context).textTheme.bodyMedium!;

    return CustomColumn(
      children: [
        _bringTrainingOfferResponseDetailListFromDatabaseAndDisplayThem(
          userFollowingDynamicByUserBloc,
          userLikingDynamicByUserBloc,
          chosenCoachAmongThoseWhoFoundCubit,
          screenHeight,
          screenWidth,
          headlineSmall,
          bodyMedium,
        ),
      ],
    );
  }

  /// LOADING ==========================================================================================================
  CustomColumn _createTrainingOfferResponseLoadingArea() => const CustomColumn(
      children: [CustomAppSizedBox(height: 100), StateLoading()]);

  /// BLOC =============================================================================================================
  BlocBuilder<
          TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
          TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState>
      _bringTrainingOfferResponseDetailListFromDatabaseAndDisplayThem(
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ChosenCoachAmongThoseWhoFoundCubit chosenCoachAmongThoseWhoFoundCubit,
    double screenHeight,
    double screenWidth,
    TextStyle headlineSmall,
    TextStyle bodyMedium,
  ) =>
          BlocBuilder<
              TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
              TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState>(
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
                  return _createTrainingOfferResponseLoadingArea();
                case StatusWithoutLoading.success:
                  if (state
                      .trainingOfferResponseDynamicWithDistanceList.isEmpty) {
                    return const InformationAboutExisting(
                        detailLabel: 'coach for this training');
                  } else {
                    return _createTrainingOfferResponseAreaBasedOnProcessDetail(
                        context,
                        state,
                        userFollowingDynamicByUserBloc,
                        userLikingDynamicByUserBloc,
                        chosenCoachAmongThoseWhoFoundCubit,
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
  CustomColumn _createTrainingOfferResponseAreaBasedOnProcessDetail(
    BuildContext context,
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ChosenCoachAmongThoseWhoFoundCubit chosenCoachAmongThoseWhoFoundCubit,
    double screenHeight,
    double screenWidth,
    List<String> uniqueProcessDetailNamesOfCreatedActivity,
    List<String> processWhereResponsesStayOn,
    int onWhichNumber,
    TextStyle headlineSmall,
    TextStyle bodyMedium,
  ) =>
      CustomColumn(
          children: _createTrainingOfferResponseBasedOnProcessDetail(
        context,
        state,
        userFollowingDynamicByUserBloc,
        userLikingDynamicByUserBloc,
        chosenCoachAmongThoseWhoFoundCubit,
        screenHeight,
        screenWidth,
        uniqueProcessDetailNamesOfCreatedActivity,
        processWhereResponsesStayOn,
        onWhichNumber,
        headlineSmall,
        bodyMedium,
      ));

  List<Widget> _createTrainingOfferResponseBasedOnProcessDetail(
    BuildContext context,
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ChosenCoachAmongThoseWhoFoundCubit chosenCoachAmongThoseWhoFoundCubit,
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
                      onTap: () =>
                          _goToChosenCoachScreenWithBringingNecessaryBlocs(
                              context,
                              state,
                              userFollowingDynamicByUserBloc,
                              userLikingDynamicByUserBloc,
                              chosenCoachAmongThoseWhoFoundCubit,
                              chosenIndex),
                      child: _generateTrainingOfferResponseArea(state,
                          screenHeight, screenWidth, chosenIndex, bodyMedium),
                    );
                  }),
                ),
              ]),
      );

  /// DISPLAY ==========================================================================================================
  CoachCard _generateTrainingOfferResponseArea(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
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
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    int chosenIndex,
  ) =>
      NetworkImage(_findCoachPhoto(state, chosenIndex));

  String _displayCoachUsername(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    int chosenIndex,
  ) =>
      _responseUsername(state, chosenIndex).length > 10
          ? '${_responseUsername(state, chosenIndex).substring(0, 10)}...'
          : _responseUsername(state, chosenIndex);

  String _displayCoachingNameIcon(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    int chosenIndex,
  ) =>
      state
          .trainingOfferResponseDynamicWithDistanceList[chosenIndex]
          .trainingOfferDynamic
          .coachDynamic
          .coachingTypeDynamic
          .coachingTypeName;

  int _displayCoachingPrice(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    int chosenIndex,
  ) =>
      state.trainingOfferResponseDynamicWithDistanceList[chosenIndex]
          .trainingOfferDynamic.coachDynamic.perLessonPrice;

  String _displayCoachingExperience(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    int chosenIndex,
  ) =>
      state
          .trainingOfferResponseDynamicWithDistanceList[chosenIndex]
          .trainingOfferDynamic
          .coachDynamic
          .coachingExperienceDynamic
          .experienceYear;

  double _displayDistance(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    int chosenIndex,
  ) =>
      state.trainingOfferResponseDynamicWithDistanceList[chosenIndex]
          .distanceBetween;

  /// METHODS ==========================================================================================================
  void _goToChosenCoachScreenWithBringingNecessaryBlocs(
    BuildContext context,
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ChosenCoachAmongThoseWhoFoundCubit chosenCoachAmongThoseWhoFoundCubit,
    int chosenIndex,
  ) {
    _bringCoachFollowingDetailFromDatabase(
        state, userFollowingDynamicByUserBloc, chosenIndex);
    _bringCoachLikeDetailFromDatabase(
        state, userLikingDynamicByUserBloc, chosenIndex);
    // _bringTrainingOfferResponseDetailFromDatabaseBasedOnCoach(
    //     state,
    //     chosenIndex);
    _assignTheCoachAsChosenCoach(
        state, chosenCoachAmongThoseWhoFoundCubit, chosenIndex);
    _goToChosenCoachScreen(context);
  }

  void _createListBasedOnProcessNameWhereResponsesStayOn(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    List<String> processWhereResponsesStayOn,
  ) {
    for (var element in state.trainingOfferResponseDynamicWithDistanceList) {
      processWhereResponsesStayOn.add(element.processDetailDynamic.processName);
    }
  }

  void _createListBasedOnUniqueProcessNameWhereResponsesStayOn(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    List<String> uniqueProcessDetailNamesOfCreatedActivity,
  ) {
    for (var element in state.trainingOfferResponseDynamicWithDistanceList) {
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
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    int chosenIndex,
  ) =>
      state.trainingOfferResponseDynamicWithDistanceList[chosenIndex]
          .trainingOfferResponseId
          .toString() +
      state.trainingOfferResponseDynamicWithDistanceList[chosenIndex]
          .trainingOfferDynamic.coachDynamic.userDynamic.uId!
          .toString();

  String _responseUsername(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    int chosenIndex,
  ) =>
      state.trainingOfferResponseDynamicWithDistanceList[chosenIndex]
          .trainingOfferDynamic.coachDynamic.userDynamic.username;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findCoachPhoto(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    int chosenIndex,
  ) =>
      state.trainingOfferResponseDynamicWithDistanceList[chosenIndex]
          .trainingOfferDynamic.coachDynamic.userDynamic.picUrl;

  /// Offer From DB Method -------------------------------------------------------------------------------------------
  void _bringCoachFollowingDetailFromDatabase(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    int chosenIndex,
  ) =>
      userFollowingDynamicByUserBloc.add(LoadUserFollowingDynamicByUserEvent(
          uId: state.trainingOfferResponseDynamicWithDistanceList[chosenIndex]
              .trainingOfferDynamic.coachDynamic.userDynamic.uId!));

  void _bringCoachLikeDetailFromDatabase(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    int chosenIndex,
  ) =>
      userLikingDynamicByUserBloc.add(LoadUserLikingDynamicByUserEvent(
          uId: state.trainingOfferResponseDynamicWithDistanceList[chosenIndex]
              .trainingOfferDynamic.coachDynamic.userDynamic.uId!));

  // void _bringTrainingOfferResponseDetailFromDatabaseBasedOnCoach(
  //   TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
  //       state,
  //   TrainingOfferResponseDynamicWithDistanceByIndividualCoachBloc
  //       trainingOfferResponseDynamicWithDistanceByIndividualCoachBloc,
  //   int chosenIndex,
  // ) =>
  //     trainingOfferResponseDynamicWithDistanceByIndividualCoachBloc.add(
  //         LoadTrainingOfferResponseDynamicWithDistanceByIndividualCoachEvent(
  //             uId: state
  //                 .trainingOfferResponseDynamicWithDistanceList[
  //                     chosenIndex]
  //                 .coachDynamic
  //                 .userDynamic
  //                 .uId!));

  void _assignTheCoachAsChosenCoach(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    ChosenCoachAmongThoseWhoFoundCubit chosenCoachAmongThoseWhoFoundCubit,
    int chosenIndex,
  ) =>
      chosenCoachAmongThoseWhoFoundCubit.pressChosenRespond(
          state.trainingOfferResponseDynamicWithDistanceList[chosenIndex]);

  /// Screen Method ----------------------------------------------------------------------------------------------------
  void _goToChosenCoachScreen(
    BuildContext context,
  ) =>
      Navigator.of(context).pushNamed(ScreenOfChosenCoachWhoFound.routeName);
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
//                           .trainingOfferResponseDynamicWithDistanceList[
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
//                                         .trainingOfferResponseDynamicWithDistanceList[
//                                             chosenIndex]
//                                         .coachDynamic
//                                         .userDynamic
//                                         .username
//                                         .length >
//                                     10
//                                 ? '${state.trainingOfferResponseDynamicWithDistanceList[chosenIndex].coachDynamic.userDynamic.username.substring(0, 10)}...'
//                                 : state
//                                     .trainingOfferResponseDynamicWithDistanceList[
//                                         chosenIndex]
//                                     .coachDynamic
//                                     .userDynamic
//                                     .username),
//                         AppIconConstants().coachingTypeIcons[AppListConstants()
//                             .coachingType
//                             .indexOf(state
//                                 .trainingOfferResponseDynamicWithDistanceList[
//                                     chosenIndex]
//                                 .coachDynamic
//                                 .coachingTypeDynamic
//                                 .coachingTypeName)],
//                       ],
//                     ),
//                     thirdWidget: AppHeaderText(
//                         textLabel:
//                             ' \$ ${state.trainingOfferResponseDynamicWithDistanceList[chosenIndex].coachDynamic.perLessonPrice.toString()}'),
//                   ),
//                   const CustomAppSizedBox(height: 5.0),
//                   AppHeader(
//                     firstWidget: AppHeaderText(
//                       textLabel: state
//                           .trainingOfferResponseDynamicWithDistanceList[
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
