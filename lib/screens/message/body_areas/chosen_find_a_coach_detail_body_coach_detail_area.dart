import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/widgets/widget.dart';

import '../../zscreens.dart';
import '../zscreens.dart';

class ChosenFindACoachDetailBodyCoachDetailArea extends StatelessWidget {
  final AppFunctions _appFunctions = AppFunctions();
  ChosenFindACoachDetailBodyCoachDetailArea({
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
    ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit =
        context.read<ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit>();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle? headlineSmall = Theme.of(context).textTheme.headlineSmall!;

    return Column(
      children: [
        _bringCoachsDetail(
            userFollowingDynamicByUserBloc,
            userLikingDynamicByUserBloc,
            consistedActivityDynamicWithDistanceByUserBloc,
            chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
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
  BlocBuilder<
          TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
          TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState>
      _bringCoachsDetail(
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
    double screenHeight,
    double screenWidth,
    TextStyle headlineSmall,
  ) =>
          BlocBuilder<
              TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
              TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState>(
            builder: (context, state) {
              switch (state.status) {
                case StatusWithoutLoading.initial:
                  return _createLoadingArea();
                case StatusWithoutLoading.success:
                  if (state
                      .trainingOfferResponseDynamicWithDistanceList.isEmpty) {
                    return const SizedBox();
                  } else {
                    return _createCoachDetailArea(
                      context,
                      state,
                      userFollowingDynamicByUserBloc,
                      userLikingDynamicByUserBloc,
                      consistedActivityDynamicWithDistanceByUserBloc,
                      chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
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
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
    double screenHeight,
    double screenWidth,
    TextStyle headlineSmall,
  ) =>
      AppWrap(
        wrapSpacing: 18,
        wrapRunSpacing: 5,
        children: List.generate(
          _getTrainingOfferResponseByApproved(state).length,
          (index) => _createCoachDetailAndDisplayThem(
            state,
            userFollowingDynamicByUserBloc,
            userLikingDynamicByUserBloc,
            consistedActivityDynamicWithDistanceByUserBloc,
            chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
            index,
            screenHeight,
            screenWidth,
          ),
        ),
      );

  BlocBuilder<ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
          ChosenResponseAmongThoseWhoRespondedTrainingOfferState>
      _createCoachDetailAndDisplayThem(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
    int index,
    double screenHeight,
    double screenWidth,
  ) =>
          BlocBuilder<ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
              ChosenResponseAmongThoseWhoRespondedTrainingOfferState>(
            builder: (context, chosenState) => GestureDetector(
              onTap: () => _goToChosenCoachScreenWithBringingNecessaryBlocs(
                  context,
                  state,
                  userFollowingDynamicByUserBloc,
                  userLikingDynamicByUserBloc,
                  consistedActivityDynamicWithDistanceByUserBloc,
                  chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
                  index),
              child:
                  _generateCoachArea(state, index, screenHeight, screenWidth),
            ),
          );

  /// GENERATE =========================================================================================================
  CoachCard _generateCoachArea(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
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
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    int index,
  ) =>
      NetworkImage(_findCoachPicUrl(state, index));

  String _displayCoachingNameIcon(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    int index,
  ) =>
      _getTrainingOfferResponseByApproved(state)
          .toList()
          .elementAt(index)
          .trainingOfferDynamic
          .coachDynamic
          .coachingTypeDynamic
          .coachingTypeName;

  int _displayCoachingPrice(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    int index,
  ) =>
      _getTrainingOfferResponseByApproved(state)
          .toList()
          .elementAt(index)
          .trainingOfferDynamic
          .coachDynamic
          .perLessonPrice;

  String _displayCoachingExperience(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    int index,
  ) =>
      _getTrainingOfferResponseByApproved(state)
          .toList()
          .elementAt(index)
          .trainingOfferDynamic
          .coachDynamic
          .coachingExperienceDynamic
          .experienceYear;

  String _displayCoachUsername(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    int index,
  ) =>
      _appFunctions.showString(_findCoachUsername(state, index), lenght: 12);

  double _displayCoachDistance(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    int index,
  ) =>
      _getTrainingOfferResponseByApproved(state)
          .toList()
          .elementAt(index)
          .distanceBetween;

  /// METHODS ==========================================================================================================
  void _goToChosenCoachScreenWithBringingNecessaryBlocs(
    BuildContext context,
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
    int index,
  ) {
    _bringChosenCoachFollowingDetailFromDB(
        state, userFollowingDynamicByUserBloc, index);
    _bringChosenCoachLikeDetailFromDB(
        state, userLikingDynamicByUserBloc, index);
    _bringChosenConsistedActivityFromDB(
        state, consistedActivityDynamicWithDistanceByUserBloc, index);
    _assignTheCoachAsChosenCoach(
        state, chosenResponseAmongThoseWhoRespondedTrainingOfferCubit, index);
    _goToUserCardDetailScreen(context);
  }

  void _bringChosenCoachFollowingDetailFromDB(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    int index,
  ) =>
      userFollowingDynamicByUserBloc.add(LoadUserFollowingDynamicByUserEvent(
          uId: _findCoachUserId(state, index)));

  void _bringChosenCoachLikeDetailFromDB(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    int index,
  ) =>
      userLikingDynamicByUserBloc.add(LoadUserLikingDynamicByUserEvent(
          uId: _findCoachUserId(state, index)));

  void _bringChosenConsistedActivityFromDB(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    int index,
  ) =>
      consistedActivityDynamicWithDistanceByUserBloc.add(
          LoadConsistedActivityDynamicWithDistanceByUserEvent(
              uId: _findCoachUserId(state, index)));

  void _assignTheCoachAsChosenCoach(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
    int index,
  ) =>
      chosenResponseAmongThoseWhoRespondedTrainingOfferCubit.pressChosenRespond(
          _getTrainingOfferResponseByApproved(state)
              .toList()
              .elementAt(index));

  /// Hero Tag ---------------------------------------------------------------------------------------------------------
  String _heroTag(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    int index,
  ) =>
      _findConsistedActivityId(state, index).toString() +
      _findCoachUsername(state, index);

  /// Check Method -----------------------------------------------------------------------------------------------------
  // bool _isCoachAppUser(
  //   TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
  //       state,
  //   int index,
  // ) =>
  //     _findCoachUserId(state, index) == _appNumberConstants.appUserId;

  /// Get Methods ------------------------------------------------------------------------------------------------------
  Iterable<TrainingOfferResponseDynamicWithDistance>
      _getTrainingOfferResponseByApproved(
              TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
                  state) =>
          state.trainingOfferResponseDynamicWithDistanceList.where((element) =>
              element.processDetailDynamic.processName == "Approved");

  /// Find Method ------------------------------------------------------------------------------------------------------
  String _findCoachPicUrl(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    int index,
  ) =>
      _getTrainingOfferResponseByApproved(state)
          .toList()
          .elementAt(index)
          .trainingOfferDynamic
          .coachDynamic
          .userDynamic
          .picUrl;

  String _findCoachUsername(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    int index,
  ) =>
      _getTrainingOfferResponseByApproved(state)
          .toList()
          .elementAt(index)
          .trainingOfferDynamic
          .coachDynamic
          .userDynamic
          .username;

  int _findCoachUserId(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    int index,
  ) =>
      _getTrainingOfferResponseByApproved(state)
          .toList()
          .elementAt(index)
          .trainingOfferDynamic
          .coachDynamic
          .userDynamic
          .uId!;

  int? _findConsistedActivityId(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    int index,
  ) =>
      _getTrainingOfferResponseByApproved(state)
          .toList()
          .elementAt(index)
          .trainingOfferResponseId;

  /// Screen Method ----------------------------------------------------------------------------------------------------
  void _goToUserCardDetailScreen(BuildContext context) => Navigator.of(context)
      .pushNamed(ScreenOfChosenOfferWhoCreatedTrainingOffer.routeName);
}
