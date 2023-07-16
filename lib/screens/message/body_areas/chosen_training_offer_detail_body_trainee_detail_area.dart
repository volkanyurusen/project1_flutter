import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/training_offer_response_dynamic_with_distance.dart';
import 'package:my_project/widgets/widget.dart';

import '../../zscreens.dart';
import '../zscreens.dart';

class ChosenTrainingOfferDetailBodyTraineeDetailArea extends StatelessWidget {
  final AppNumberConstants _appNumberConstants = AppNumberConstants();

  ChosenTrainingOfferDetailBodyTraineeDetailArea({
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
    TextStyle? headlineSmall = Theme.of(context).textTheme.headlineSmall!;

    return Column(
      children: [
        _bringTraineesDetail(
            userFollowingDynamicByUserBloc,
            userLikingDynamicByUserBloc,
            consistedActivityDynamicWithDistanceByUserBloc,
            chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
            headlineSmall),
        const CustomAppSizedBox(),
      ],
    );
  }

  /// LOADING ==========================================================================================================
  CustomColumn _createLoadingArea() => const CustomColumn(
      children: [CustomAppSizedBox(height: 100), StateLoading()]);

  /// BLOC =============================================================================================================
  BlocBuilder<TrainingOfferResponseDynamicWithDistanceByTrainingOfferBloc,
          TrainingOfferResponseDynamicWithDistanceByTrainingOfferState>
      _bringTraineesDetail(
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
    TextStyle headlineSmall,
  ) =>
          BlocBuilder<
              TrainingOfferResponseDynamicWithDistanceByTrainingOfferBloc,
              TrainingOfferResponseDynamicWithDistanceByTrainingOfferState>(
            builder: (context, state) {
              switch (state.status) {
                case StatusWithoutLoading.initial:
                  return _createLoadingArea();
                // case Status.loading:
                //   return _createLoadingArea();
                case StatusWithoutLoading.success:
                  if (state
                      .trainingOfferResponseDynamicWithDistanceList.isEmpty) {
                    return const SizedBox();
                  } else {
                    return _createTraineeDetailArea(
                      context,
                      state,
                      userFollowingDynamicByUserBloc,
                      userLikingDynamicByUserBloc,
                      consistedActivityDynamicWithDistanceByUserBloc,
                      chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
                      headlineSmall,
                    );
                  }
                case StatusWithoutLoading.failure:
                  return StateError(error: state.error);
              }
            },
          );

  /// CREATE ===========================================================================================================
  AppWrap _createTraineeDetailArea(
    BuildContext context,
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
    TextStyle headlineSmall,
  ) =>
      AppWrap(
        wrapSpacing: 18,
        wrapRunSpacing: 5,
        children: List.generate(
          _getTrainingOfferResponseByApproved(state).length,
          (index) => _createTraineeDetailAndDisplayThem(
              state,
              userFollowingDynamicByUserBloc,
              userLikingDynamicByUserBloc,
              consistedActivityDynamicWithDistanceByUserBloc,
              chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
              index),
        ),
      );

  BlocBuilder<ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
          ChosenResponseAmongThoseWhoRespondedTrainingOfferState>
      _createTraineeDetailAndDisplayThem(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
    int index,
  ) =>
          BlocBuilder<ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
              ChosenResponseAmongThoseWhoRespondedTrainingOfferState>(
            builder: (context, chosenState) => GestureDetector(
              onTap: () => _goToChosenTraineeScreenWithBringingNecessaryBlocs(
                  context,
                  state,
                  userFollowingDynamicByUserBloc,
                  userLikingDynamicByUserBloc,
                  consistedActivityDynamicWithDistanceByUserBloc,
                  chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
                  index),
              child: _generateTraineeArea(state, index),
            ),
          );

  /// GENERATE =========================================================================================================
  ImageChoiceColumn _generateTraineeArea(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    int index,
  ) =>
      ImageChoiceColumn(
        imageWidget: Hero(
            tag: _heroTag(state, index),
            child: _displayTraineesPhoto(state, index)),
        username: _displayTraineeUsername(state, index),
        distance: _displayTraineeDistance(state, index),
      );

  /// DISPLAY ==========================================================================================================
  UserImageContainer _displayTraineesPhoto(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    int index,
  ) =>
      UserImageContainer(
          height: 75, width: 75, url: _findTraineePicUrl(state, index));

  String _displayTraineeUsername(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    int index,
  ) =>
      _findTraineeUsername(state, index);

  String _displayTraineeDistance(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    int index,
  ) =>
      _isTraineeAppUser(state, index)
          ? ''
          : '${_getTrainingOfferResponseByApproved(state).toList().elementAt(index).distanceBetween.round().toString()} km';

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
    int index,
  ) {
    _bringChosenTraineeFollowingDetailFromDB(
        state, userFollowingDynamicByUserBloc, index);
    _bringChosenTraineeLikeDetailFromDB(
        state, userLikingDynamicByUserBloc, index);
    _bringChosenConsistedActivityFromDB(
        state, consistedActivityDynamicWithDistanceByUserBloc, index);
    _assignTheTraineeAsChosenTrainee(
        state, chosenResponseAmongThoseWhoRespondedTrainingOfferCubit, index);
    _goToUserCardDetailScreen(context);
  }

  void _bringChosenTraineeFollowingDetailFromDB(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    int index,
  ) =>
      userFollowingDynamicByUserBloc.add(LoadUserFollowingDynamicByUserEvent(
          uId: _findTraineeUserId(state, index)));

  void _bringChosenTraineeLikeDetailFromDB(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    int index,
  ) =>
      userLikingDynamicByUserBloc.add(LoadUserLikingDynamicByUserEvent(
          uId: _findTraineeUserId(state, index)));

  void _bringChosenConsistedActivityFromDB(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    int index,
  ) =>
      consistedActivityDynamicWithDistanceByUserBloc.add(
          LoadConsistedActivityDynamicWithDistanceByUserEvent(
              uId: _findTraineeUserId(state, index)));

  void _assignTheTraineeAsChosenTrainee(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
    int index,
  ) =>
      chosenResponseAmongThoseWhoRespondedTrainingOfferCubit.pressChosenRespond(
          _getTrainingOfferResponseByApproved(state).toList().elementAt(index));

  /// Hero Tag ---------------------------------------------------------------------------------------------------------
  String _heroTag(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    int index,
  ) =>
      '${_findTrainingOfferResponseId(state, index)} ${_findTraineeUsername(state, index)}';

  /// Get Method -------------------------------------------------------------------------------------------------------
  Iterable<TrainingOfferResponseDynamicWithDistance>
      _getTrainingOfferResponseByApproved(
              TrainingOfferResponseDynamicWithDistanceByTrainingOfferState
                  state) =>
          state.trainingOfferResponseDynamicWithDistanceList.where((element) =>
              element.processDetailDynamic.processName == "Approved");

  /// Check Method -----------------------------------------------------------------------------------------------------
  bool _isTraineeAppUser(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    int index,
  ) =>
      _findTraineeUserId(state, index) == _appNumberConstants.appUserId;

  /// Find Method ------------------------------------------------------------------------------------------------------
  String _findTraineePicUrl(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    int index,
  ) =>
      _getTrainingOfferResponseByApproved(state)
          .toList()
          .elementAt(index)
          .traineeDynamic
          .picUrl;

  String _findTraineeUsername(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    int index,
  ) =>
      _getTrainingOfferResponseByApproved(state)
          .toList()
          .elementAt(index)
          .traineeDynamic
          .username;

  int _findTraineeUserId(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    int index,
  ) =>
      _getTrainingOfferResponseByApproved(state)
          .toList()
          .elementAt(index)
          .traineeDynamic
          .uId!;

  int? _findTrainingOfferResponseId(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    int index,
  ) =>
      _getTrainingOfferResponseByApproved(state)
          .toList()
          .elementAt(index)
          .trainingOfferResponseId;

  /// Screen Method ----------------------------------------------------------------------------------------------------
  void _goToUserCardDetailScreen(BuildContext context) => Navigator.of(context)
      .pushNamed(ScreenOfChosenResponseWhoRespondedTrainingOffer.routeName);
}
