import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import '../zscreens.dart';

class TrainingOfferResponseBodyTrainingOfferResponseDetailArea
    extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final double screenHeight;
  final double screenWidth;

  TrainingOfferResponseBodyTrainingOfferResponseDetailArea({
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
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc =
        context.read<ConsistedActivityDynamicWithDistanceByUserBloc>();
    ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit =
        context.read<ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit>();

    TextStyle? headlineSmall = Theme.of(context).textTheme.headlineSmall!;
    TextStyle? bodyMedium = Theme.of(context).textTheme.bodyMedium!;

    return CustomColumn(
      children: [
        _bringTrainingOfferResponseDetailListFromDatabaseAndDisplayThem(
          userFollowingDynamicByUserBloc,
          userLikingDynamicByUserBloc,
          consistedActivityDynamicWithDistanceByUserBloc,
          chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
          screenHeight,
          screenWidth,
          headlineSmall,
          bodyMedium,
        ),
      ],
    );
  }

  /// BLOC =============================================================================================================
  BlocBuilder<TrainingOfferResponseDynamicWithDistanceByTrainingOfferBloc,
          TrainingOfferResponseDynamicWithDistanceByTrainingOfferState>
      _bringTrainingOfferResponseDetailListFromDatabaseAndDisplayThem(
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
    double screenHeight,
    double screenWidth,
    TextStyle headlineSmall,
    TextStyle bodyMedium,
  ) =>
          BlocBuilder<
              TrainingOfferResponseDynamicWithDistanceByTrainingOfferBloc,
              TrainingOfferResponseDynamicWithDistanceByTrainingOfferState>(
            builder: (context, state) {
              int onWhichNumber = 0;
              List<String> processWhereResponsesStayOn = [];
              List<String> uniqueProcessDetailNamesOfTrainingOfferResponse =
                  <String>[];
              _createListBasedOnProcessNameWhereResponsesStayOn(
                  state, processWhereResponsesStayOn);
              _createListBasedOnUniqueProcessNameWhereResponsesStayOn(
                  state, uniqueProcessDetailNamesOfTrainingOfferResponse);
              switch (state.status) {
                case StatusWithoutLoading.initial:
                  return _createTrainingOfferResponseLoadingArea();
                case StatusWithoutLoading.success:
                  if (state
                      .trainingOfferResponseDynamicWithDistanceList.isEmpty) {
                    return const SizedBox();
                  } else {
                    return _createTrainingOfferResponseAreaBasedOnProcessDetail(
                        context,
                        state,
                        userFollowingDynamicByUserBloc,
                        userLikingDynamicByUserBloc,
                        consistedActivityDynamicWithDistanceByUserBloc,
                        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
                        screenHeight,
                        screenWidth,
                        uniqueProcessDetailNamesOfTrainingOfferResponse,
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

  /// LOADING ==========================================================================================================
  CustomColumn _createTrainingOfferResponseLoadingArea() {
    return const CustomColumn(
      children: [
        CustomAppSizedBox(height: 100),
        StateLoading(),
      ],
    );
  }

  /// CREATE ===========================================================================================================
  CustomColumn _createTrainingOfferResponseAreaBasedOnProcessDetail(
    BuildContext context,
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
    double screenHeight,
    double screenWidth,
    List<String> uniqueProcessDetailNamesOfTrainingOfferResponse,
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
        consistedActivityDynamicWithDistanceByUserBloc,
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
        screenHeight,
        screenWidth,
        uniqueProcessDetailNamesOfTrainingOfferResponse,
        processWhereResponsesStayOn,
        onWhichNumber,
        headlineSmall,
        bodyMedium,
      ));

  List<Widget> _createTrainingOfferResponseBasedOnProcessDetail(
    BuildContext context,
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
    double screenHeight,
    double screenWidth,
    List<String> uniqueProcessDetailNamesOfTrainingOfferResponse,
    List<String> processWhereResponsesStayOn,
    int onWhichNumber,
    TextStyle headlineSmall,
    TextStyle bodyMedium,
  ) =>
      List.generate(
        state.hasReachedMax == true
            ? uniqueProcessDetailNamesOfTrainingOfferResponse.length
            : uniqueProcessDetailNamesOfTrainingOfferResponse.length + 1,
        (index) => index >= uniqueProcessDetailNamesOfTrainingOfferResponse.length
            ? const BottomLoader()
            : CustomColumn(children: [
                const CustomAppSizedBox(height: 18),
                _displayUniqueProcess(uniqueProcessDetailNamesOfTrainingOfferResponse,
                    index, headlineSmall),
                AppWrap(
                  wrapSpacing: 18,
                  wrapRunSpacing: 5,
                  children: List.generate(
                      processWhereResponsesStayOn
                          .where((element) =>
                              element ==
                              uniqueProcessDetailNamesOfTrainingOfferResponse
                                  .elementAt(index))
                          .length, (secondIndex) {
                    int chosenIndex = onWhichNumber;
                    onWhichNumber++;
                    return GestureDetector(
                      onLongPress: () {},
                      onTap: () =>
                          _goToChosenTraineeScreenWithBringingNecessaryBlocs(
                              context,
                              state,
                              userFollowingDynamicByUserBloc,
                              userLikingDynamicByUserBloc,
                              consistedActivityDynamicWithDistanceByUserBloc,
                              chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
                              chosenIndex),
                      child: _generateTrainingOfferResponseArea(state,
                          screenHeight, screenWidth, chosenIndex, bodyMedium),
                    );
                  }),
                ),
              ]),
      );

  /// GENERATE =========================================================================================================
  CircleImageChoiceColumn _generateTrainingOfferResponseArea(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    double screenHeight,
    double screenWidth,
    int chosenIndex,
    TextStyle bodyMedium,
  ) =>
      CircleImageChoiceColumn(
        heroTag: _responseHeroTag(state, chosenIndex),
        imageWidget: _displayTraineePhoto(state, chosenIndex),
        firstLabel: _displayCoachUsername(state, chosenIndex),
        secondLabel: _displayDistance(state, chosenIndex),
      );

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayUniqueProcess(
    List<String> uniqueProcessDetailNamesOfTrainingOfferResponse,
    int index,
    TextStyle headlineSmall,
  ) =>
      AppHeaderText(
          textLabel: uniqueProcessDetailNamesOfTrainingOfferResponse.elementAt(index),
          textStyle: headlineSmall.copyWith(color: _appColors.onSecondary));

  UserImageContainer _displayTraineePhoto(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    int chosenIndex,
  ) =>
      UserImageContainer(url: _findTraineePhoto(state, chosenIndex));

  String _displayCoachUsername(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    int chosenIndex,
  ) =>
      _responseUsername(state, chosenIndex).length > 10
          ? '${_responseUsername(state, chosenIndex).substring(0, 10)}...'
          : _responseUsername(state, chosenIndex);

  String _displayDistance(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    int chosenIndex,
  ) =>
      '${state.trainingOfferResponseDynamicWithDistanceList[chosenIndex].distanceBetween.round().toString()} km';

  /// METHODS ==========================================================================================================
  void _goToChosenTraineeScreenWithBringingNecessaryBlocs(
    BuildContext context,
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
    int chosenIndex,
  ) {
    _bringTraineeFollowingDetailFromDatabase(
        state, userFollowingDynamicByUserBloc, chosenIndex);
    _bringTraineeLikeDetailFromDatabase(
        state, userLikingDynamicByUserBloc, chosenIndex);

    _bringTrainingOfferResponseDetailFromDatabaseBasedOnCoach(
        state, consistedActivityDynamicWithDistanceByUserBloc, chosenIndex);
    _assignTheTraineehAsChosenTrainee(state,
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit, chosenIndex);
    _goToChosenTraineeScreen(context);
  }

  void _createListBasedOnProcessNameWhereResponsesStayOn(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    List<String> processWhereResponsesStayOn,
  ) {
    for (var element in state.trainingOfferResponseDynamicWithDistanceList) {
      processWhereResponsesStayOn.add(element.processDetailDynamic.processName);
    }
  }

  void _createListBasedOnUniqueProcessNameWhereResponsesStayOn(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    List<String> uniqueProcessDetailNamesOfTrainingOfferResponse,
  ) {
    for (var element in state.trainingOfferResponseDynamicWithDistanceList) {
      if (uniqueProcessDetailNamesOfTrainingOfferResponse
          .contains(element.processDetailDynamic.processName)) {
      } else {
        uniqueProcessDetailNamesOfTrainingOfferResponse
            .add(element.processDetailDynamic.processName);
      }
    }
  }

  /// Hero Tag ---------------------------------------------------------------------------------------------------------
  String _responseHeroTag(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    int chosenIndex,
  ) =>
      '${state.trainingOfferResponseDynamicWithDistanceList[chosenIndex].trainingOfferResponseId} ${state.trainingOfferResponseDynamicWithDistanceList[chosenIndex].requestDate}';

  String _responseUsername(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    int chosenIndex,
  ) =>
      state.trainingOfferResponseDynamicWithDistanceList[chosenIndex]
          .traineeDynamic.username;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findTraineePhoto(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    int chosenIndex,
  ) =>
      state.trainingOfferResponseDynamicWithDistanceList[chosenIndex]
          .traineeDynamic.picUrl;

  int _findTraineeUserId(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    int chosenIndex,
  ) =>
      state.trainingOfferResponseDynamicWithDistanceList[chosenIndex]
          .traineeDynamic.uId!;

  /// Database Methods -------------------------------------------------------------------------------------------------
  void _bringTraineeFollowingDetailFromDatabase(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    int chosenIndex,
  ) =>
      userFollowingDynamicByUserBloc.add(LoadUserFollowingDynamicByUserEvent(
          uId: _findTraineeUserId(state, chosenIndex)));

  void _bringTraineeLikeDetailFromDatabase(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    int chosenIndex,
  ) =>
      userLikingDynamicByUserBloc.add(LoadUserLikingDynamicByUserEvent(
          uId: _findTraineeUserId(state, chosenIndex)));

  void _bringTrainingOfferResponseDetailFromDatabaseBasedOnCoach(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    int chosenIndex,
  ) =>
      consistedActivityDynamicWithDistanceByUserBloc.add(
          LoadConsistedActivityDynamicWithDistanceByUserEvent(
              uId: _findTraineeUserId(state, chosenIndex)));

  void _assignTheTraineehAsChosenTrainee(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
    int chosenIndex,
  ) =>
      chosenResponseAmongThoseWhoRespondedTrainingOfferCubit.pressChosenRespond(
          state.trainingOfferResponseDynamicWithDistanceList[chosenIndex]);

  /// Screen Method ----------------------------------------------------------------------------------------------------
  void _goToChosenTraineeScreen(
    BuildContext context,
  ) =>
      Navigator.of(context).pushNamed(ScreenOfChosenTrainee.routeName);
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
