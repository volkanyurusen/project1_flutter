import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/training_request_response_dynamic_with_distance.dart';
import 'package:my_project/widgets/widget.dart';

import '../../zscreens.dart';
import '../zscreens.dart';

class ChosenTrainingRequestDetailBodyCoachDetailArea extends StatelessWidget {
  final AppFunctions _appFunctions = AppFunctions();
  ChosenTrainingRequestDetailBodyCoachDetailArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc =
        context.read<UserFollowingDynamicByUserBloc>();
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc =
        context.read<UserLikingDynamicByUserBloc>();
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc =
        context.read<ConsistedActivityDynamicWithDistanceByUserBloc>();
    ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
        chosenResponseAmongThoseWhoRespondedTrainingRequestCubit = context
            .read<ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit>();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle? headlineSmall = Theme.of(context).textTheme.headlineSmall!;

    return Column(
      children: [
        _bringCoachsDetail(
            userFollowingDynamicByUserBloc,
            userLikingDynamicByUserBloc,
            consistedActivityDynamicWithDistanceByUserBloc,
            chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
            screenHeight,
            screenWidth,
            headlineSmall),
        const CustomAppSizedBox(),
      ],
    );
  }

  /// LOADING ==========================================================================================================
  CustomColumn _createLoadingArea() => const CustomColumn(
      children: [CustomAppSizedBox(height: 100), StateLoading()]);

  /// BLOC =============================================================================================================
  BlocBuilder<TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc,
          TrainingRequestResponseDynamicWithDistanceByTrainingRequestState>
      _bringCoachsDetail(
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
        chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
    double screenHeight,
    double screenWidth,
    TextStyle headlineSmall,
  ) =>
          BlocBuilder<
              TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc,
              TrainingRequestResponseDynamicWithDistanceByTrainingRequestState>(
            builder: (context, state) {
              switch (state.status) {
                case StatusWithoutLoading.initial:
                  return _createLoadingArea();
                case StatusWithoutLoading.success:
                  if (state
                      .trainingRequestResponseDynamicWithDistanceList.isEmpty) {
                    return const SizedBox();
                  } else {
                    return _createCoachDetailArea(
                      context,
                      state,
                      userFollowingDynamicByUserBloc,
                      userLikingDynamicByUserBloc,
                      consistedActivityDynamicWithDistanceByUserBloc,
                      chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
                      screenHeight,
                      screenWidth,
                      headlineSmall,
                    );
                  }
                case StatusWithoutLoading.failure:
                  return StateError(error: state.error);
              }
            },
          );

  /// CREATE ===========================================================================================================
  AppWrap _createCoachDetailArea(
    BuildContext context,
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
        chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
    double screenHeight,
    double screenWidth,
    TextStyle headlineSmall,
  ) =>
      AppWrap(
        wrapSpacing: 18,
        wrapRunSpacing: 5,
        children: List.generate(
          _getTrainingRequestResponseByApproved(state).length,
          (index) => _createCoachDetailAndDisplayThem(
            state,
            userFollowingDynamicByUserBloc,
            userLikingDynamicByUserBloc,
            consistedActivityDynamicWithDistanceByUserBloc,
            chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
            index,
            screenHeight,
            screenWidth,
          ),
        ),
      );

  BlocBuilder<ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
          ChosenResponseAmongThoseWhoRespondedTrainingRequestState>
      _createCoachDetailAndDisplayThem(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
        chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
    int index,
    double screenHeight,
    double screenWidth,
  ) =>
          BlocBuilder<ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
              ChosenResponseAmongThoseWhoRespondedTrainingRequestState>(
            builder: (context, chosenState) => GestureDetector(
              onTap: () => _goToChosenCoachScreenWithBringingNecessaryBlocs(
                  context,
                  state,
                  userFollowingDynamicByUserBloc,
                  userLikingDynamicByUserBloc,
                  consistedActivityDynamicWithDistanceByUserBloc,
                  chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
                  index),
              child:
                  _generateCoachArea(state, index, screenHeight, screenWidth),
            ),
          );

  /// GENERATE =========================================================================================================
  CoachCard _generateCoachArea(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    int index,
    double screenHeight,
    double screenWidth,
  ) =>
      CoachCard(
        screenHeight: screenHeight,
        screenWidth: screenWidth,
        heroTag: _heroTag(state, index),
        image: _displayCoachPhoto(state, index),
        username: _displayCoachUsername(state, index),
        coachingNameForIcon: _displayCoachingNameIcon(state, index),
        coachingPrice: _displayCoachingPrice(state, index),
        coachingExperience: _displayCoachingExperience(state, index),
        distance: _displayCoachDistance(state, index),
        isResponded: false,
      );

  /// DISPLAY ==========================================================================================================
  NetworkImage _displayCoachPhoto(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    int index,
  ) =>
      NetworkImage(_findCoachPicUrl(state, index));

  String _displayCoachingNameIcon(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    int index,
  ) =>
      _getTrainingRequestResponseByApproved(state)
          .toList()
          .elementAt(index)
          .coachDynamic
          .coachingTypeDynamic
          .coachingTypeName;

  int _displayCoachingPrice(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    int index,
  ) =>
      _getTrainingRequestResponseByApproved(state)
          .toList()
          .elementAt(index)
          .coachDynamic
          .perLessonPrice;

  String _displayCoachingExperience(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    int index,
  ) =>
      _getTrainingRequestResponseByApproved(state)
          .toList()
          .elementAt(index)
          .coachDynamic
          .coachingExperienceDynamic
          .experienceYear;

  String _displayCoachUsername(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    int index,
  ) =>
      _appFunctions.showString(_findCoachUsername(state, index), lenght: 12);

  double _displayCoachDistance(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    int index,
  ) =>
      _getTrainingRequestResponseByApproved(state)
          .toList()
          .elementAt(index)
          .distanceBetween;

  /// METHODS ==========================================================================================================
  void _goToChosenCoachScreenWithBringingNecessaryBlocs(
    BuildContext context,
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
        chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
    int index,
  ) {
    _bringChosenCoachFollowingDetailFromDB(
        state, userFollowingDynamicByUserBloc, index);
    _bringChosenCoachLikeDetailFromDB(
        state, userLikingDynamicByUserBloc, index);
    _bringChosenConsistedActivityFromDB(
        state, consistedActivityDynamicWithDistanceByUserBloc, index);
    _assignTheCoachAsChosenCoach(
        state, chosenResponseAmongThoseWhoRespondedTrainingRequestCubit, index);
    _goToUserCardDetailScreen(context);
  }

  void _bringChosenCoachFollowingDetailFromDB(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    int index,
  ) =>
      userFollowingDynamicByUserBloc.add(LoadUserFollowingDynamicByUserEvent(
          uId: _findCoachUserId(state, index)));

  void _bringChosenCoachLikeDetailFromDB(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    int index,
  ) =>
      userLikingDynamicByUserBloc.add(LoadUserLikingDynamicByUserEvent(
          uId: _findCoachUserId(state, index)));

  void _bringChosenConsistedActivityFromDB(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    int index,
  ) =>
      consistedActivityDynamicWithDistanceByUserBloc.add(
          LoadConsistedActivityDynamicWithDistanceByUserEvent(
              uId: _findCoachUserId(state, index)));

  void _assignTheCoachAsChosenCoach(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
        chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
    int index,
  ) =>
      chosenResponseAmongThoseWhoRespondedTrainingRequestCubit
          .pressChosenRespond(_getTrainingRequestResponseByApproved(state)
              .toList()
              .elementAt(index));

  /// Hero Tag ---------------------------------------------------------------------------------------------------------
  String _heroTag(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    int index,
  ) =>
      _findConsistedActivityId(state, index).toString() +
      _findCoachUsername(state, index);

  /// Check Method -----------------------------------------------------------------------------------------------------
  // bool _isCoachAppUser(
  //   TrainingRequestResponseDynamicWithDistanceByTrainingRequestState
  //       state,
  //   int index,
  // ) =>
  //     _findCoachUserId(state, index) == _appNumberConstants.appUserId;

  /// Get Methods ------------------------------------------------------------------------------------------------------
  Iterable<TrainingRequestResponseDynamicWithDistance>
      _getTrainingRequestResponseByApproved(
              TrainingRequestResponseDynamicWithDistanceByTrainingRequestState
                  state) =>
          state.trainingRequestResponseDynamicWithDistanceList.where(
              (element) =>
                  element.processDetailDynamic.processName == "Approved");

  /// Find Method ------------------------------------------------------------------------------------------------------
  String _findCoachPicUrl(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    int index,
  ) =>
      _getTrainingRequestResponseByApproved(state)
          .toList()
          .elementAt(index)
          .coachDynamic
          .userDynamic
          .picUrl;

  String _findCoachUsername(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    int index,
  ) =>
      _getTrainingRequestResponseByApproved(state)
          .toList()
          .elementAt(index)
          .coachDynamic
          .userDynamic
          .username;

  int _findCoachUserId(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    int index,
  ) =>
      _getTrainingRequestResponseByApproved(state)
          .toList()
          .elementAt(index)
          .coachDynamic
          .userDynamic
          .uId!;

  int? _findConsistedActivityId(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    int index,
  ) =>
      _getTrainingRequestResponseByApproved(state)
          .toList()
          .elementAt(index)
          .trainingRequestResponseId;

  /// Screen Method ----------------------------------------------------------------------------------------------------
  void _goToUserCardDetailScreen(BuildContext context) => Navigator.of(context)
      .pushNamed(ScreenOfChosenResponseWhoRespondedTrainingRequest.routeName);
}
