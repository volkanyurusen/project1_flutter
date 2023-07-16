// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import '../zscreens.dart';

class ResultFindACoachBodyTrainingOfferArea extends StatefulWidget {
  final double screenHeight;
  final double screenWidth;

  const ResultFindACoachBodyTrainingOfferArea({
    required this.screenHeight,
    required this.screenWidth,
    super.key,
  });

  @override
  State<ResultFindACoachBodyTrainingOfferArea> createState() =>
      _ResultFindACoachBodyTrainingOfferAreaState();
}

class _ResultFindACoachBodyTrainingOfferAreaState
    extends State<ResultFindACoachBodyTrainingOfferArea> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    TrainingOfferDynamicWithDistanceByUserState state =
        context.read<TrainingOfferDynamicWithDistanceByUserBloc>().state;
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc =
        context.read<UserFollowingDynamicByUserBloc>();
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc =
        context.read<UserLikingDynamicByUserBloc>();
    ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit
        chosenOfferAmongThoseWhoCreatedTrainingOfferCubit =
        context.read<ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit>();
    TextStyle? headlineSmall = Theme.of(context).textTheme.headlineSmall!;
    TextStyle? bodyMedium = Theme.of(context).textTheme.bodyMedium!;

    return _createTrainingOfferArea(
        context,
        state,
        userFollowingDynamicByUserBloc,
        userLikingDynamicByUserBloc,
        chosenOfferAmongThoseWhoCreatedTrainingOfferCubit,
        headlineSmall,
        bodyMedium);
  }

  /// TRAINING OFFER AREA ==============================================================================================
  /// CREATE ===========================================================================================================
  Expanded _createTrainingOfferArea(
    BuildContext context,
    TrainingOfferDynamicWithDistanceByUserState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit
        chosenOfferAmongThoseWhoCreatedTrainingOfferCubit,
    TextStyle headlineSmall,
    TextStyle bodyMedium,
  ) =>
      Expanded(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: CustomColumn(children: [
            //
            // _bringAllTrainingOfferListFromDatabaseAndDisplayThem(
            //   userFollowingDynamicByUserBloc,
            //   userLikingDynamicByUserBloc,
            //   chosenOfferAmongThoseWhoCreatedTrainingOfferCubit,
            //   widget.screenHeight,
            //   widget.screenWidth,
            //   headlineSmall,
            //   bodyMedium,
            // ),
            _createTrainingOfferResponseAreaBasedOnProcessDetail(
                context,
                state,
                userFollowingDynamicByUserBloc,
                userLikingDynamicByUserBloc,
                chosenOfferAmongThoseWhoCreatedTrainingOfferCubit,
                widget.screenHeight,
                widget.screenWidth,
                headlineSmall,
                bodyMedium)
          ]),
        ),
      );

  // /// BLOC =============================================================================================================
  // BlocBuilder<TrainingOfferDynamicWithDistanceByUserBloc,
  //         TrainingOfferDynamicWithDistanceByUserState>
  //     _bringAllTrainingOfferListFromDatabaseAndDisplayThem(
  //   UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
  //   UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
  //   ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit
  //       chosenOfferAmongThoseWhoCreatedTrainingOfferCubit,
  //   double screenHeight,
  //   double screenWidth,
  //   TextStyle headlineSmall,
  //   TextStyle bodyMedium,
  // ) =>
  //         BlocBuilder<TrainingOfferDynamicWithDistanceByUserBloc,
  //                 TrainingOfferDynamicWithDistanceByUserState>(
  //             builder: (context, state) {
  //           switch (state.status) {
  //             case StatusWithoutLoading.initial:
  //               return const StateLoading();
  //             case StatusWithoutLoading.success:
  //               if (state.trainingOfferDynamicWithDistanceList.isEmpty) {
  //                 return const InformationAboutExisting(
  //                     detailLabel: 'trainee Offer');
  //               } else {
  //                 return _createTrainingOfferResponseAreaBasedOnProcessDetail(
  //                     context,
  //                     state,
  //                     userFollowingDynamicByUserBloc,
  //                     userLikingDynamicByUserBloc,
  //                     chosenOfferAmongThoseWhoCreatedTrainingOfferCubit,
  //                     screenHeight,
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
  AppWrap _createTrainingOfferResponseAreaBasedOnProcessDetail(
    BuildContext context,
    TrainingOfferDynamicWithDistanceByUserState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit
        chosenOfferAmongThoseWhoCreatedTrainingOfferCubit,
    double screenHeight,
    double screenWidth,
    TextStyle headlineSmall,
    TextStyle bodyMedium,
  ) =>
      AppWrap(
          wrapSpacing: 18,
          wrapRunSpacing: 0,
          children: List.generate(
              state.hasReachedMax == true
                  ? state.trainingOfferDynamicWithDistanceList.length
                  : state.trainingOfferDynamicWithDistanceList.length + 1,
              (index) =>
                  index >= state.trainingOfferDynamicWithDistanceList.length
                      ? const BottomLoader()
                      : _generateTrainingOfferArea(
                          context,
                          state,
                          userFollowingDynamicByUserBloc,
                          userLikingDynamicByUserBloc,
                          chosenOfferAmongThoseWhoCreatedTrainingOfferCubit,
                          index,
                          screenHeight,
                          screenWidth,
                          bodyMedium)));

  /// GENERATE =========================================================================================================
  GestureDetector _generateTrainingOfferArea(
    BuildContext context,
    TrainingOfferDynamicWithDistanceByUserState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit
        chosenOfferAmongThoseWhoCreatedTrainingOfferCubit,
    int index,
    double screenHeight,
    double screenWidth,
    TextStyle bodyMedium,
  ) =>
      GestureDetector(
        child: _buildCardContainer(
            state, screenHeight, screenWidth, index, bodyMedium),
        onTap: () => _pressCardContainer(
            context,
            state,
            userFollowingDynamicByUserBloc,
            userLikingDynamicByUserBloc,
            chosenOfferAmongThoseWhoCreatedTrainingOfferCubit,
            index),
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TrainingOfferResponseDynamicWithDistanceByChosenAttributesBloc,
          TrainingOfferResponseDynamicWithDistanceByChosenAttributesState>
      _buildCardContainer(
    TrainingOfferDynamicWithDistanceByUserState state,
    double screenHeight,
    double screenWidth,
    int index,
    TextStyle bodyMedium,
  ) =>
          BlocBuilder<
              TrainingOfferResponseDynamicWithDistanceByChosenAttributesBloc,
              TrainingOfferResponseDynamicWithDistanceByChosenAttributesState>(
            builder: (context, respopnseState) {
              switch (respopnseState.status) {
                case Status.initial:
                  return const StateLoading();
                case Status.loading:
                  return const StateLoading();
                case Status.success:
                  return _displayTrainingOfferArea(
                      context,
                      state,
                      respopnseState,
                      screenHeight,
                      screenWidth,
                      index,
                      bodyMedium);
                case Status.failure:
                  return StateError(error: state.error);
              }
            },
          );

  /// DISPLAY ==========================================================================================================
  CoachCard _displayTrainingOfferArea(
    BuildContext context,
    TrainingOfferDynamicWithDistanceByUserState state,
    TrainingOfferResponseDynamicWithDistanceByChosenAttributesState
        responseState,
    double screenHeight,
    double screenWidth,
    int index,
    TextStyle bodyMedium,
  ) =>
      CoachCard(
        screenHeight: screenHeight,
        screenWidth: screenWidth,
        heroTag: _offerHeroTag(state, index),
        image: _displayCoachPhoto(state, index),
        username: _displayCoachUsername(state, index),
        coachingNameForIcon: _displayCoachingNameIcon(state, index),
        coachingPrice: _displayCoachingPrice(state, index),
        coachingExperience: _displayCoachingExperience(state, index),
        distance: _displayDistance(state, index),
        isResponded: _checkWhetherTheOfferHasBeenRespondedBefore(state, index)
            ? false
            : true,
      );

  NetworkImage _displayCoachPhoto(
    TrainingOfferDynamicWithDistanceByUserState state,
    int index,
  ) =>
      NetworkImage(_findCoachPhoto(state, index));

  String _displayCoachUsername(
    TrainingOfferDynamicWithDistanceByUserState state,
    int index,
  ) =>
      _findResponseUsername(state, index).length > 10
          ? '${_findResponseUsername(state, index).substring(0, 10)}...'
          : _findResponseUsername(state, index);

  String _displayCoachingNameIcon(
    TrainingOfferDynamicWithDistanceByUserState state,
    int index,
  ) =>
      state.trainingOfferDynamicWithDistanceList
          .elementAt(index)
          .coachDynamic
          .coachingTypeDynamic
          .coachingTypeName;

  int _displayCoachingPrice(
    TrainingOfferDynamicWithDistanceByUserState state,
    int index,
  ) =>
      state.trainingOfferDynamicWithDistanceList
          .elementAt(index)
          .coachDynamic
          .perLessonPrice;

  String _displayCoachingExperience(
    TrainingOfferDynamicWithDistanceByUserState state,
    int index,
  ) =>
      state.trainingOfferDynamicWithDistanceList
          .elementAt(index)
          .coachDynamic
          .coachingExperienceDynamic
          .experienceYear;

  double _displayDistance(
    TrainingOfferDynamicWithDistanceByUserState state,
    int index,
  ) =>
      state.trainingOfferDynamicWithDistanceList
          .elementAt(index)
          .distanceBetween;

  /// METHODS ==========================================================================================================
  /// Hero Tag ---------------------------------------------------------------------------------------------------------
  String _offerHeroTag(
    TrainingOfferDynamicWithDistanceByUserState state,
    int index,
  ) =>
      state.trainingOfferDynamicWithDistanceList
          .elementAt(index)
          .trainingOfferId
          .toString() +
      state.trainingOfferDynamicWithDistanceList
          .elementAt(index)
          .coachDynamic
          .userDynamic
          .username;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherTheOfferHasBeenRespondedBefore(
          TrainingOfferDynamicWithDistanceByUserState state, int index) =>
      context
          .read<
              TrainingOfferResponseDynamicWithDistanceByChosenAttributesBloc>()
          .state
          .trainingOfferResponseDynamicWithDistanceList
          .where((element) =>
              element.trainingOfferDynamic.trainingOfferId ==
              _findTrainingOfferId(state, index))
          .toList()
          .isEmpty;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findCoachPhoto(
    TrainingOfferDynamicWithDistanceByUserState state,
    int index,
  ) =>
      state.trainingOfferDynamicWithDistanceList
          .elementAt(index)
          .coachDynamic
          .userDynamic
          .picUrl;

  String _findResponseUsername(
    TrainingOfferDynamicWithDistanceByUserState state,
    int index,
  ) =>
      state.trainingOfferDynamicWithDistanceList
          .elementAt(index)
          .coachDynamic
          .userDynamic
          .username;

  int? _findTrainingOfferId(
    TrainingOfferDynamicWithDistanceByUserState state,
    int index,
  ) =>
      state.trainingOfferDynamicWithDistanceList
          .elementAt(index)
          .trainingOfferId;

  /// PRESS CARD CONTAINER =============================================================================================
  /// METHODS ==========================================================================================================
  void _pressCardContainer(
    BuildContext context,
    TrainingOfferDynamicWithDistanceByUserState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit
        chosenOfferAmongThoseWhoCreatedTrainingOfferCubit,
    int index,
  ) {
    _bringCoachFollowingDetailFromDatabase(
        state, userFollowingDynamicByUserBloc, index);
    _bringTraineeLikeDetailFromDatabase(
        state, userLikingDynamicByUserBloc, index);
    _assignTheCoachAsChosenCoach(
        state, chosenOfferAmongThoseWhoCreatedTrainingOfferCubit, index);
    _goToChosenCoachWhoCreatedOfferScreen(context);
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  int _findCoachUserId(
    TrainingOfferDynamicWithDistanceByUserState state,
    int index,
  ) =>
      state.trainingOfferDynamicWithDistanceList
          .elementAt(index)
          .coachDynamic
          .userDynamic
          .uId!;

  /// Database Methods -------------------------------------------------------------------------------------------------
  void _bringCoachFollowingDetailFromDatabase(
    TrainingOfferDynamicWithDistanceByUserState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    int index,
  ) =>
      userFollowingDynamicByUserBloc.add(LoadUserFollowingDynamicByUserEvent(
          uId: _findCoachUserId(state, index)));

  void _bringTraineeLikeDetailFromDatabase(
    TrainingOfferDynamicWithDistanceByUserState state,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    int index,
  ) =>
      userLikingDynamicByUserBloc.add(LoadUserLikingDynamicByUserEvent(
          uId: _findCoachUserId(state, index)));

  void _assignTheCoachAsChosenCoach(
    TrainingOfferDynamicWithDistanceByUserState state,
    ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit
        chosenOfferAmongThoseWhoCreatedTrainingOfferCubit,
    int index,
  ) =>
      chosenOfferAmongThoseWhoCreatedTrainingOfferCubit.pressChosenOffer(
          state.trainingOfferDynamicWithDistanceList.elementAt(index));

  /// Screen Method ----------------------------------------------------------------------------------------------------
  void _goToChosenCoachWhoCreatedOfferScreen(
    BuildContext context,
  ) =>
      Navigator.of(context)
          .pushNamed(ScreenOfChosenCoachWhoCreatedOffer.routeName);

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
        context.read<TrainingOfferDynamicWithDistanceByUserBloc>().add(
            LoadTrainingOfferDynamicWithDistanceByUserEvent(
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
      .read<TrainingOfferDynamicWithDistanceByUserBloc>()
      .state
      .trainingOfferDynamicWithDistanceList
      .length;
}
