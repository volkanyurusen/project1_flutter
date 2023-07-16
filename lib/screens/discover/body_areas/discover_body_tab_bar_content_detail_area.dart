import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/discover/local_widgets/zlocal_widget.dart';
import 'package:my_project/screens/discover/zscreens.dart';
import 'package:my_project/screens/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class DiscoverBodyTabBarContentDetailArea extends StatefulWidget {
  final TabController tabController;
  final ResultOfPreferredActivityDynamicState resultState;
  final double screenWidth;

  const DiscoverBodyTabBarContentDetailArea({
    super.key,
    required this.resultState,
    required this.screenWidth,
    required this.tabController,
  });

  @override
  State<DiscoverBodyTabBarContentDetailArea> createState() =>
      _DiscoverBodyTabBarContentDetailAreaState();
}

class _DiscoverBodyTabBarContentDetailAreaState
    extends State<DiscoverBodyTabBarContentDetailArea> {
  final AppVisualConstants _appVisualConstants = AppVisualConstants();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    ChosenResultOfPreferredActivityDynamicCubit
        chosenResultOfPreferredActivityDynamicCubit =
        context.read<ChosenResultOfPreferredActivityDynamicCubit>();
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc =
        context.read<UserFollowingDynamicByUserBloc>();
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc =
        context.read<UserLikingDynamicByUserBloc>();
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc =
        context.read<ConsistedActivityDynamicWithDistanceByUserBloc>();

    return ListView.separated(
      padding: _appVisualConstants.userCardLisTopPadding,
      shrinkWrap: true,
      itemCount: widget.resultState.hasReachedMax == true
          ? widget.resultState.resultOfPreferredActivityDynamicList.length
          : widget.resultState.resultOfPreferredActivityDynamicList.length + 1,
      separatorBuilder: (BuildContext context, int index) => index >=
              widget.resultState.resultOfPreferredActivityDynamicList.length
          ? const CustomAppSizedBox()
          : const CustomAppSizedBox(),
      controller: _scrollController,
      itemBuilder: (BuildContext context, int index) => index >=
              widget.resultState.resultOfPreferredActivityDynamicList.length
          ? const BottomLoader()
          : _createInkWell(
              context,
              widget.resultState,
              chosenResultOfPreferredActivityDynamicCubit,
              userFollowingDynamicByUserBloc,
              userLikingDynamicByUserBloc,
              consistedActivityDynamicWithDistanceByUserBloc,
              index),
    );
  }

  /// CREATE ===========================================================================================================
  /// This widget returns [_displayCardContainer] method which demonstrates [CardContainer] and its clicking function
  /// call the below blocs:
  ///
  /// - [chosenActivityDynamicsForAttendanceCubit]; the chosen activity dynamics is added to a list after clicking the
  /// relevant activity in order to demonstrate it on the next page. And the next screen is built with this bloc.
  ///
  /// - [userFollowingDynamicByUserBloc]; it keeps the relevant user's following details (following and
  /// followers) whose card is clicked.
  ///
  /// - [userLikingDynamicByUserBloc]; it keeps the relevant user's like details (how many likes the relevant
  /// user received) whose card is clicked.
  ///
  /// - [BringConsistedActivityDynamicWithDistanceByIndividualUserBloc]; it keeps the relevant user's activity details
  /// (whose card is clicked), to demonstrate the user's recent activity/activities.
  InkWell _createInkWell(
    BuildContext context,
    ResultOfPreferredActivityDynamicState resultState,
    ChosenResultOfPreferredActivityDynamicCubit
        chosenResultOfPreferredActivityDynamicCubit,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    int index,
  ) =>
      InkWell(
        child: _buildCardContainer(resultState, index),
        onTap: () => _pressUserCard(
            context,
            resultState,
            chosenResultOfPreferredActivityDynamicCubit,
            userFollowingDynamicByUserBloc,
            userLikingDynamicByUserBloc,
            consistedActivityDynamicWithDistanceByUserBloc,
            index),
      );

  /// BUILD ============================================================================================================
  BlocBuilder<AttendedActivityByAttendeeBloc, AttendedActivityByAttendeeState>
      _buildCardContainer(
              ResultOfPreferredActivityDynamicState resultState, int index) =>
          BlocBuilder<AttendedActivityByAttendeeBloc,
              AttendedActivityByAttendeeState>(
            builder: (context, attendedState) {
              switch (attendedState.status) {
                case Status.initial:
                  return const StateLoading();
                case Status.loading:
                  return const StateLoading();
                case Status.success:
                  // print(attendedState.attendedActivityByAttendeeList.length);
                  // print(attendedState.attendedActivityByAttendeeList);
                  return _displayCardContainer(
                    context,
                    resultState,
                    attendedState,
                    index,
                  );
                case Status.failure:
                  return StateError(error: attendedState.error);
              }
            },
          );

  /// DISPLAY ==========================================================================================================
  /// All the details of users displayed on the screen are created by this widget.
  /// - [imageAddress] is the address that keeps the relevant user photo's URL.
  /// - [username] keeps the relevant user's username.
  /// - [activityLevelDetail] keeps the created activity level by the relevant users.
  /// - [activityTitle] keeps the created activity name by the relevant users.
  /// - [distance] keeps the distance information to display it on the screen between the user who creates the activity
  /// and the user who search for the activity to attending.
  /// - [activityDate] keeps the activity date that the user prefers to do on.
  CardContainer _displayCardContainer(
    BuildContext context,
    ResultOfPreferredActivityDynamicState resultState,
    AttendedActivityByAttendeeState attendedState,
    int index,
  ) =>
      CardContainer(
        imageAddress: _displayCardImage(resultState, index),
        username: _displayUsername(resultState, index),
        heroTag: _displayHeroTag(resultState, index),
        // activityLevelDetail: _displayActivityLevelDetail(resultState, index),
        // activityTitle: _displayActivityTitle(resultState, index),
        distance: _displayDistanceWithCorrectFormat(resultState, index),
        // activityDate:
        //     _displayActivityDateWithCorrectFormat(resultState, index),
        widget: _displayCardIcon(),
        isAttended: attendedState.attendedActivityByAttendeeList.isEmpty
            ? false
            : _checkWhetherTheActivityHasBeenAttendedBefore(
                    resultState, attendedState, index)
                ? false
                : true,
      );

  _displayCardImage(
    ResultOfPreferredActivityDynamicState resultState,
    int index,
  ) =>
      resultState.resultOfPreferredActivityDynamicList.elementAt(index).picUrl;

  _displayUsername(
    ResultOfPreferredActivityDynamicState resultState,
    int index,
  ) =>
      resultState.resultOfPreferredActivityDynamicList
          .elementAt(index)
          .username;

  String _displayHeroTag(
    ResultOfPreferredActivityDynamicState resultState,
    int index,
  ) =>
      '${resultState.resultOfPreferredActivityDynamicList.elementAt(index).createdActivityId} ${resultState.resultOfPreferredActivityDynamicList.elementAt(index)}';

  String _displayDistanceWithCorrectFormat(
    ResultOfPreferredActivityDynamicState resultState,
    int index,
  ) =>
      resultState.resultOfPreferredActivityDynamicList
          .elementAt(index)
          .distanceBetween
          .round()
          .toString();

  Icon _displayCardIcon() => const Icon(Icons.double_arrow, size: 16);

  /// METHODS ==========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherTheActivityHasBeenAttendedBefore(
    ResultOfPreferredActivityDynamicState resultState,
    AttendedActivityByAttendeeState attendedState,
    int index,
  ) =>
      attendedState.attendedActivityByAttendeeList
          .where((element) =>
              element?.idNo == _findCreatedActivityId(resultState, index))
          .toList()
          .isEmpty;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  int? _findCreatedActivityId(
          ResultOfPreferredActivityDynamicState resultState, int index) =>
      resultState.resultOfPreferredActivityDynamicList
          .elementAt(index)
          .createdActivityId;

  /// PRESS USER CARD ==================================================================================================
  /// METHODS ==========================================================================================================
  void _pressUserCard(
    BuildContext context,
    ResultOfPreferredActivityDynamicState resultState,
    ChosenResultOfPreferredActivityDynamicCubit
        chosenResultOfPreferredActivityDynamicCubit,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    int index,
  ) {
    _assignUserAsChosen(
        resultState, chosenResultOfPreferredActivityDynamicCubit, index);
    _bringChosenUserFollowingDetailFromDB(
        resultState, userFollowingDynamicByUserBloc, index);
    _bringChosenUserLikeDetailFromDB(
        resultState, userLikingDynamicByUserBloc, index);
    _bringChosenConsistedActivityFromDB(
        resultState, consistedActivityDynamicWithDistanceByUserBloc, index);
    _goToUserCardDetailScreen(context);
  }

  void _assignUserAsChosen(
    ResultOfPreferredActivityDynamicState resultState,
    ChosenResultOfPreferredActivityDynamicCubit
        chosenResultOfPreferredActivityDynamicCubit,
    int index,
  ) =>
      chosenResultOfPreferredActivityDynamicCubit.pressUserCard(
          resultState.resultOfPreferredActivityDynamicList.elementAt(index));

  void _bringChosenUserFollowingDetailFromDB(
    ResultOfPreferredActivityDynamicState resultState,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    int index,
  ) =>
      userFollowingDynamicByUserBloc.add(LoadUserFollowingDynamicByUserEvent(
          uId: resultState.resultOfPreferredActivityDynamicList
              .elementAt(index)
              .hostId));

  void _bringChosenUserLikeDetailFromDB(
    ResultOfPreferredActivityDynamicState resultState,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    int index,
  ) =>
      userLikingDynamicByUserBloc.add(LoadUserLikingDynamicByUserEvent(
          uId: resultState.resultOfPreferredActivityDynamicList
              .elementAt(index)
              .hostId));

  void _bringChosenConsistedActivityFromDB(
    ResultOfPreferredActivityDynamicState resultState,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    int index,
  ) =>
      consistedActivityDynamicWithDistanceByUserBloc.add(
          LoadConsistedActivityDynamicWithDistanceByUserEvent(
              uId: resultState.resultOfPreferredActivityDynamicList
                  .elementAt(index)
                  .hostId));

  /// Screen Method ----------------------------------------------------------------------------------------------------
  void _goToUserCardDetailScreen(
    BuildContext context,
  ) =>
      Navigator.of(context).pushNamed(ScreenOfUserCardDetail.routeName);

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
        _bringResultOfPrefferedActivityDetailByChosenActivity();
        _bringAttendedActivityByAttendee(context);
      }
    }
  }

  // METHODS ===========================================================================================================
  // Find Methods ------------------------------------------------------------------------------------------------------
  int _findAppUserId() => AppNumberConstants().appUserId;

  double _findMembershipLocationCircularDiameter() => context
      .read<UserDynamicBloc>()
      .state
      .userDynamicList
      .last
      .membershipTypeDynamic
      .locationCircularDiameter;

  double _findChosenLocationLat() => context
      .read<ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit>()
      .state
      .chosenLocationDetailDynamicList
      .last
      .lat;

  double _findChosenLocationLon() => context
      .read<ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit>()
      .state
      .chosenLocationDetailDynamicList
      .last
      .lon;

  int _findLengthOfList() => context
      .read<ResultOfPreferredActivityDynamicBloc>()
      .state
      .resultOfPreferredActivityDynamicList
      .map((e) => e.activityTitle)
      .toList()
      .where((element) =>
          element ==
          context
              .read<CreatedActivityDynamicByHostBloc>()
              .state
              .createdActivityDynamicList[widget.tabController.index]
              .activityNameDynamic
              .activityTitle)
      .toList()
      .length;

  // Database Methods --------------------------------------------------------------------------------------------------
  void _bringResultOfPrefferedActivityDetailByChosenActivity() {
    context.read<ResultOfPreferredActivityDynamicBloc>().add(
        LoadResultOfPreferredActivityDynamic(
            uId: _findAppUserId(),
            activityTitle: context
                .read<CreatedActivityDynamicByHostBloc>()
                .state
                .createdActivityDynamicList[widget.tabController.index]
                .activityNameDynamic
                .activityTitle,
            locationCircularDiamter: _findMembershipLocationCircularDiameter(),
            lat: _findChosenLocationLat(),
            lon: _findChosenLocationLon(),
            offset: _findLengthOfList()));
  }

  void _bringAttendedActivityByAttendee(BuildContext context) {
    context
        .read<AttendedActivityByAttendeeBloc>()
        .add(LoadAttendedActivityByAttendeeEvent(attendeeId: _findAppUserId()));
  }
}
