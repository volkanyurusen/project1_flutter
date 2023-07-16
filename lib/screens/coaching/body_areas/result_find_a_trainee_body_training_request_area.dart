// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class ResultFindATraineeBodyTrainingRequestArea extends StatefulWidget {
  final double screenWidth;

  const ResultFindATraineeBodyTrainingRequestArea({
    required this.screenWidth,
    super.key,
  });

  @override
  State<ResultFindATraineeBodyTrainingRequestArea> createState() =>
      _ResultFindATraineeBodyTrainingRequestAreaState();
}

class _ResultFindATraineeBodyTrainingRequestAreaState
    extends State<ResultFindATraineeBodyTrainingRequestArea> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    TrainingRequestDynamicWithDistanceByUserState state =
        context.read<TrainingRequestDynamicWithDistanceByUserBloc>().state;
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc =
        context.read<UserFollowingDynamicByUserBloc>();
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc =
        context.read<UserLikingDynamicByUserBloc>();
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc =
        context.read<ConsistedActivityDynamicWithDistanceByUserBloc>();
    ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit
        chosenRequestAmongThoseWhoCreatedTrainingRequestCubit =
        context.read<ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit>();
    TextStyle? headlineSmall = Theme.of(context).textTheme.headlineSmall!;
    TextStyle? bodyMedium = Theme.of(context).textTheme.bodyMedium!;

    return _createTrainingRequestArea(
        context,
        state,
        userFollowingDynamicByUserBloc,
        userLikingDynamicByUserBloc,
        consistedActivityDynamicWithDistanceByUserBloc,
        chosenRequestAmongThoseWhoCreatedTrainingRequestCubit,
        headlineSmall,
        bodyMedium);
  }

  /// TRAINING REQUEST AREA ============================================================================================
  /// CREATE ===========================================================================================================
  Expanded _createTrainingRequestArea(
    BuildContext context,
    TrainingRequestDynamicWithDistanceByUserState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit
        chosenRequestAmongThoseWhoCreatedTrainingRequestCubit,
    TextStyle headlineSmall,
    TextStyle bodyMedium,
  ) =>
      Expanded(
        child: SingleChildScrollView(
            controller: _scrollController,
            child: CustomColumn(
              children: [
                //
                // _bringAllTrainingRequestListFromDatabaseAndDisplayThem(
                //     userFollowingDynamicByUserBloc,
                //     userLikingDynamicByUserBloc,
                //     consistedActivityDynamicWithDistanceByUserBloc,
                //     chosenRequestAmongThoseWhoCreatedTrainingRequestCubit,
                //     widget.screenWidth,
                //     headlineSmall,
                //     bodyMedium),
                _createTrainingRequestResponseAreaBasedOnProcessDetail(
                    context,
                    state,
                    userFollowingDynamicByUserBloc,
                    userLikingDynamicByUserBloc,
                    consistedActivityDynamicWithDistanceByUserBloc,
                    chosenRequestAmongThoseWhoCreatedTrainingRequestCubit,
                    widget.screenWidth,
                    headlineSmall,
                    bodyMedium)
              ],
            )),
      );

  // /// BLOC =============================================================================================================
  // BlocBuilder<TrainingRequestDynamicWithDistanceByUserBloc,
  //         TrainingRequestDynamicWithDistanceByUserState>
  //     _bringAllTrainingRequestListFromDatabaseAndDisplayThem(
  //   UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
  //   UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
  //   ConsistedActivityDynamicWithDistanceByUserBloc
  //       consistedActivityDynamicWithDistanceByUserBloc,
  //   ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit
  //       chosenRequestAmongThoseWhoCreatedTrainingRequestCubit,
  //   double screenWidth,
  //   TextStyle headlineSmall,
  //   TextStyle bodyMedium,
  // ) =>
  //         BlocBuilder<TrainingRequestDynamicWithDistanceByUserBloc,
  //                 TrainingRequestDynamicWithDistanceByUserState>(
  //             builder: (context, state) {
  //           switch (state.status) {
  //             case StatusWithoutLoading.initial:
  //               return const StateLoading();
  //             case StatusWithoutLoading.success:
  //               if (state.trainingRequestDynamicWithDistanceList.isEmpty) {
  //                 return const InformationAboutExisting(
  //                     detailLabel: 'trainee request');
  //               } else {
  //                 return _createTrainingRequestResponseAreaBasedOnProcessDetail(
  //                     context,
  //                     state,
  //                     userFollowingDynamicByUserBloc,
  //                     userLikingDynamicByUserBloc,
  //                     consistedActivityDynamicWithDistanceByUserBloc,
  //                     chosenRequestAmongThoseWhoCreatedTrainingRequestCubit,
  //                     screenWidth,
  //                     headlineSmall,
  //                     bodyMedium);
  //               }
  //             case StatusWithoutLoading.failure:
  //               return StateError(error: state.error);
  //           }
  //         });

  /// RESPONSE AREA (BASED ON PROCESS) =================================================================================
  /// CREATE ===========================================================================================================
  AppWrap _createTrainingRequestResponseAreaBasedOnProcessDetail(
    BuildContext context,
    TrainingRequestDynamicWithDistanceByUserState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit
        chosenRequestAmongThoseWhoCreatedTrainingRequestCubit,
    double screenWidth,
    TextStyle headlineSmall,
    TextStyle bodyMedium,
  ) =>
      AppWrap(
          wrapSpacing: 18,
          wrapRunSpacing: 0,
          children: List.generate(
              state.hasReachedMax == true
                  ? state.trainingRequestDynamicWithDistanceList.length
                  : state.trainingRequestDynamicWithDistanceList.length + 1,
              (index) =>
                  index >= state.trainingRequestDynamicWithDistanceList.length
                      ? const BottomLoader()
                      : _generateTrainingRequestArea(
                          context,
                          state,
                          userFollowingDynamicByUserBloc,
                          userLikingDynamicByUserBloc,
                          consistedActivityDynamicWithDistanceByUserBloc,
                          chosenRequestAmongThoseWhoCreatedTrainingRequestCubit,
                          index,
                          screenWidth,
                          bodyMedium)));

  /// GENERATE =========================================================================================================
  GestureDetector _generateTrainingRequestArea(
    BuildContext context,
    TrainingRequestDynamicWithDistanceByUserState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        bringConsistedActivityDynamicWithDistanceByIndividualUserBloc,
    ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit
        chosenRequestAmongThoseWhoCreatedTrainingRequestCubit,
    int index,
    double screenWidth,
    TextStyle bodyMedium,
  ) =>
      GestureDetector(
        child: _buildCircleImageChoiceColumn(
            state, screenWidth, index, bodyMedium),
        onTap: () => pressCircleImage(
            context,
            state,
            userFollowingDynamicByUserBloc,
            userLikingDynamicByUserBloc,
            bringConsistedActivityDynamicWithDistanceByIndividualUserBloc,
            chosenRequestAmongThoseWhoCreatedTrainingRequestCubit,
            index),
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TrainingRequestResponseDynamicWithDistanceByChosenAttributesBloc,
          TrainingRequestResponseDynamicWithDistanceByChosenAttributesState>
      _buildCircleImageChoiceColumn(
    TrainingRequestDynamicWithDistanceByUserState state,
    double screenWidth,
    int index,
    TextStyle bodyMedium,
  ) =>
          BlocBuilder<
              TrainingRequestResponseDynamicWithDistanceByChosenAttributesBloc,
              TrainingRequestResponseDynamicWithDistanceByChosenAttributesState>(
            builder: (context, respopnseState) {
              switch (respopnseState.status) {
                case Status.initial:
                  return const StateLoading();
                case Status.loading:
                  return const StateLoading();
                case Status.success:
                  return _displayTrainingRequestArea(
                      context, state, screenWidth, index, bodyMedium);
                case Status.failure:
                  return StateError(error: state.error);
              }
            },
          );

  /// DISPLAY ==========================================================================================================
  CircleImageChoiceColumn _displayTrainingRequestArea(
    BuildContext context,
    TrainingRequestDynamicWithDistanceByUserState state,
    double screenWidth,
    int index,
    TextStyle bodyMedium,
  ) =>
      CircleImageChoiceColumn(
          heroTag: _requestHeroTag(state, index),
          imageWidget: _displayTraineePhoto(state, index),
          firstLabel: _displayTraineeUsername(state, index),
          secondLabel: _displayDistance(state, index),
          isResponded: _findTheRequestPreviousStatus(state, index));

  UserImageContainer _displayTraineePhoto(
    TrainingRequestDynamicWithDistanceByUserState state,
    int index,
  ) =>
      UserImageContainer(
          url: _findTraineePhoto(state, index),
          isResponded: _findTheRequestPreviousStatus(state, index));

  String _displayTraineeUsername(
    TrainingRequestDynamicWithDistanceByUserState state,
    int index,
  ) =>
      _responseUsername(state, index).length > 10
          ? '${_responseUsername(state, index).substring(0, 10)}...'
          : _responseUsername(state, index);

  String _displayDistance(
    TrainingRequestDynamicWithDistanceByUserState state,
    int index,
  ) =>
      '${_findDistance(state, index).round().toString()} km';

  /// METHOD ===========================================================================================================
  /// Hero Tag ---------------------------------------------------------------------------------------------------------
  String _requestHeroTag(
    TrainingRequestDynamicWithDistanceByUserState state,
    int index,
  ) =>
      state.trainingRequestDynamicWithDistanceList
          .elementAt(index)
          .trainingRequestId
          .toString() +
      state.trainingRequestDynamicWithDistanceList
          .elementAt(index)
          .trainingRequester
          .username;

  String _responseUsername(
    TrainingRequestDynamicWithDistanceByUserState state,
    int index,
  ) =>
      state.trainingRequestDynamicWithDistanceList
          .elementAt(index)
          .trainingRequester
          .username;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherTheRequestHasBeenRespondedBefore(
          TrainingRequestDynamicWithDistanceByUserState state, int index) =>
      context
          .read<
              TrainingRequestResponseDynamicWithDistanceByChosenAttributesBloc>()
          .state
          .trainingRequestResponseDynamicWithDistanceList
          .where((element) =>
              element.trainingRequestDynamic.trainingRequestId ==
              _findTrainingRequestId(state, index))
          .toList()
          .isEmpty;

  bool _findTheRequestPreviousStatus(
          TrainingRequestDynamicWithDistanceByUserState state, int index) =>
      _checkWhetherTheRequestHasBeenRespondedBefore(state, index)
          ? false
          : true;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findTraineePhoto(
    TrainingRequestDynamicWithDistanceByUserState state,
    int index,
  ) =>
      state.trainingRequestDynamicWithDistanceList
          .elementAt(index)
          .trainingRequester
          .picUrl;

  double _findDistance(
          TrainingRequestDynamicWithDistanceByUserState state, int index) =>
      state.trainingRequestDynamicWithDistanceList
          .elementAt(index)
          .distanceBetween;

  int? _findTrainingRequestId(
    TrainingRequestDynamicWithDistanceByUserState state,
    int index,
  ) =>
      state.trainingRequestDynamicWithDistanceList
          .elementAt(index)
          .trainingRequestId;

  /// PRESS CIRCLE IMAGE ===============================================================================================
  /// METHODS ==========================================================================================================
  pressCircleImage(
    BuildContext context,
    TrainingRequestDynamicWithDistanceByUserState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit
        chosenRequestAmongThoseWhoCreatedTrainingRequestCubit,
    int index,
  ) {
    _bringTraineeFollowingDetailFromDatabase(
        state, userFollowingDynamicByUserBloc, index);
    _bringTraineeLikeDetailFromDatabase(
        state, userLikingDynamicByUserBloc, index);
    _bringActivityDetailOfChosenTraineeFromDatabase(
        state, consistedActivityDynamicWithDistanceByUserBloc, index);
    _assignTheTraineeAsChosenTrainee(
        state, chosenRequestAmongThoseWhoCreatedTrainingRequestCubit, index);
    _goToChosenTraineeWhoCreatedRequestScreen(context);
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  int _findTraineeUserId(
    TrainingRequestDynamicWithDistanceByUserState state,
    int index,
  ) =>
      state.trainingRequestDynamicWithDistanceList
          .elementAt(index)
          .trainingRequester
          .uId!;

  /// Database Methods -------------------------------------------------------------------------------------------------
  void _bringTraineeFollowingDetailFromDatabase(
    TrainingRequestDynamicWithDistanceByUserState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    int index,
  ) =>
      userFollowingDynamicByUserBloc.add(LoadUserFollowingDynamicByUserEvent(
          uId: _findTraineeUserId(state, index)));

  void _bringTraineeLikeDetailFromDatabase(
    TrainingRequestDynamicWithDistanceByUserState state,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    int index,
  ) =>
      userLikingDynamicByUserBloc.add(LoadUserLikingDynamicByUserEvent(
          uId: _findTraineeUserId(state, index)));

  void _bringActivityDetailOfChosenTraineeFromDatabase(
    TrainingRequestDynamicWithDistanceByUserState state,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    int index,
  ) =>
      consistedActivityDynamicWithDistanceByUserBloc.add(
          LoadConsistedActivityDynamicWithDistanceByUserEvent(
              uId: _findTraineeUserId(state, index)));

  void _assignTheTraineeAsChosenTrainee(
    TrainingRequestDynamicWithDistanceByUserState state,
    ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit
        chosenRequestAmongThoseWhoCreatedTrainingRequestCubit,
    int index,
  ) =>
      chosenRequestAmongThoseWhoCreatedTrainingRequestCubit.pressChosenRequest(
          state.trainingRequestDynamicWithDistanceList.elementAt(index));

  /// Screen Method ----------------------------------------------------------------------------------------------------
  void _goToChosenTraineeWhoCreatedRequestScreen(
    BuildContext context,
  ) =>
      Navigator.of(context)
          .pushNamed(ScreenOfChosenTraineeWhoCreatedRequest.routeName);

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0) {
        context.read<TrainingRequestDynamicWithDistanceByUserBloc>().add(
            LoadTrainingRequestDynamicWithDistanceByUserEvent(
                userId: AppNumberConstants().appUserId,
                activityTitle: _findChosenActivityName(),
                offset: _findOffset()));
      }
    }
  }

  /// METHODS ==========================================================================================================
  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findChosenActivityName() => context
      .read<
          ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit>()
      .state
      .chosenActivityTitleList
      .last;

  int _findOffset() => context
      .read<TrainingRequestDynamicWithDistanceByUserBloc>()
      .state
      .trainingRequestDynamicWithDistanceList
      .length;
}
