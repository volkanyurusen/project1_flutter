import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import '../zscreens.dart';

class ChosenConsistedActivityBodyAttendeeDetailArea extends StatelessWidget {
  final double screenWidth;

  const ChosenConsistedActivityBodyAttendeeDetailArea({
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  // @override
  @override
  Widget build(BuildContext context) {
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc =
        context.read<UserFollowingDynamicByUserBloc>();
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc =
        context.read<UserLikingDynamicByUserBloc>();
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc =
        context.read<ConsistedActivityDynamicWithDistanceByUserBloc>();
    ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
        chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit =
        context.read<ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit>();
    TextStyle? headlineSmall = Theme.of(context).textTheme.headlineSmall!;

    return Column(
      children: [
        _bringAttendeesDetail(
            userFollowingDynamicByUserBloc,
            userLikingDynamicByUserBloc,
            consistedActivityDynamicWithDistanceByUserBloc,
            chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
            headlineSmall),
        const CustomAppSizedBox(),
      ],
    );
  }

  /// LOADING ==========================================================================================================
  CustomColumn _createLoadingArea() => const CustomColumn(
      children: [CustomAppSizedBox(height: 100), StateLoading()]);

  /// BLOC ===========================================================================================================
  BlocBuilder<
          ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetBloc,
          ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState>
      _bringAttendeesDetail(
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
        chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
    TextStyle headlineSmall,
  ) =>
          BlocBuilder<
              ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetBloc,
              ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState>(
            builder: (context, state) {
              switch (state.status) {
                case StatusWithoutLoading.initial:
                  return _createLoadingArea();
                case StatusWithoutLoading.success:
                  if (state.consistedActivityDynamicWithDistanceList.isEmpty) {
                    return const SizedBox();
                  } else {
                    return _createAttendeeDetailArea(
                      context,
                      state,
                      userFollowingDynamicByUserBloc,
                      userLikingDynamicByUserBloc,
                      consistedActivityDynamicWithDistanceByUserBloc,
                      chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
                      headlineSmall,
                    );
                  }
                case StatusWithoutLoading.failure:
                  return StateError(error: state.error);
              }
            },
          );

  /// CREATE ===========================================================================================================
  AppWrap _createAttendeeDetailArea(
    BuildContext context,
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
        chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
    TextStyle headlineSmall,
  ) =>
      AppWrap(
        wrapSpacing: 18,
        wrapRunSpacing: 5,
        children: List.generate(
          state.hasReachedMax == true
              ? state.consistedActivityDynamicWithDistanceList.length
              : state.consistedActivityDynamicWithDistanceList.length + 1,
          (index) =>
              index >= state.consistedActivityDynamicWithDistanceList.length
                  ? const BottomLoader()
                  : _createAttendeeDetailAndDisplayThem(
                      state,
                      userFollowingDynamicByUserBloc,
                      userLikingDynamicByUserBloc,
                      consistedActivityDynamicWithDistanceByUserBloc,
                      chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
                      index),
        ),
      );

  BlocBuilder<ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
          ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestState>
      _createAttendeeDetailAndDisplayThem(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
        chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
    int index,
  ) =>
          BlocBuilder<ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
              ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestState>(
            builder: (context, chosenState) => GestureDetector(
              onTap: () => _goToChosenAttendeeScreenWIthBringingNecessaryBlocs(
                  context,
                  state,
                  userFollowingDynamicByUserBloc,
                  userLikingDynamicByUserBloc,
                  consistedActivityDynamicWithDistanceByUserBloc,
                  chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
                  index),
              child: _generateAttendeeArea(state, index),
            ),
          );

  /// GENERATE =========================================================================================================
  ImageChoiceColumn _generateAttendeeArea(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState state,
    int index,
  ) =>
      ImageChoiceColumn(
        imageWidget: Hero(
            tag: _heroTag(state, index),
            child: _displayAttendeesPhoto(state, index)),
        username: _displayAttendeeUsername(state, index),
        distance: _displayAttendeeDistance(state, index),
      );

  /// DISPLAY ==========================================================================================================
  UserImageContainer _displayAttendeesPhoto(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState state,
    int chosenIndex,
  ) =>
      UserImageContainer(
          height: 75, width: 75, url: findAttendeePicUrl(state, chosenIndex));

  String _displayAttendeeUsername(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState state,
    int chosenIndex,
  ) =>
      _findAttendeeUsername(state, chosenIndex);

  String _displayAttendeeDistance(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState state,
    int chosenIndex,
  ) =>
      '${state.consistedActivityDynamicWithDistanceList[chosenIndex].distanceBetween.round().toString()} km';

  /// METHODS ==========================================================================================================
  void _goToChosenAttendeeScreenWIthBringingNecessaryBlocs(
    BuildContext context,
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
        chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
    int chosenIndex,
  ) {
    _bringChosenAttendeeFollowingDetailFromDB(
        state, userFollowingDynamicByUserBloc, chosenIndex);
    _bringChosenAttendeeLikeDetailFromDB(
        state, userLikingDynamicByUserBloc, chosenIndex);
    _bringChosenConsistedActivityFromDB(
        state, consistedActivityDynamicWithDistanceByUserBloc, chosenIndex);
    _assignTheAttendeeAsChosenAttendee(state,
        chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit, chosenIndex);
    _goToUserCardDetailScreen(context);
  }

  void _bringChosenAttendeeFollowingDetailFromDB(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    int chosenIndex,
  ) =>
      userFollowingDynamicByUserBloc.add(LoadUserFollowingDynamicByUserEvent(
          uId: _findAttendeeUserId(state, chosenIndex)));

  void _bringChosenAttendeeLikeDetailFromDB(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState state,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    int chosenIndex,
  ) =>
      userLikingDynamicByUserBloc.add(LoadUserLikingDynamicByUserEvent(
          uId: _findAttendeeUserId(state, chosenIndex)));

  void _bringChosenConsistedActivityFromDB(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState state,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    int chosenIndex,
  ) =>
      consistedActivityDynamicWithDistanceByUserBloc.add(
          LoadConsistedActivityDynamicWithDistanceByUserEvent(
              uId: _findAttendeeUserId(state, chosenIndex)));

  void _assignTheAttendeeAsChosenAttendee(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState state,
    ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
        chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
    int chosenIndex,
  ) =>
      chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
          .pressChosenAttendeeOnAttendance(
              state.consistedActivityDynamicWithDistanceList[chosenIndex]);

  /// Check Method ---------------------------------------------------------------------------------------------------

  /// Hero Tag -------------------------------------------------------------------------------------------------------
  String _heroTag(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState state,
    int chosenIndex,
  ) =>
      state.consistedActivityDynamicWithDistanceList[chosenIndex]
          .consistedActivityId
          .toString() +
      state.consistedActivityDynamicWithDistanceList[chosenIndex].attendee
          .username;

  /// Find Method ------------------------------------------------------------------------------------------------------
  String findAttendeePicUrl(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState state,
    int chosenIndex,
  ) =>
      state.consistedActivityDynamicWithDistanceList[chosenIndex].attendee
          .picUrl;

  String _findAttendeeUsername(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState state,
    int chosenIndex,
  ) =>
      state.consistedActivityDynamicWithDistanceList[chosenIndex].attendee
          .username;

  int _findAttendeeUserId(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState state,
    int chosenIndex,
  ) =>
      state.consistedActivityDynamicWithDistanceList[chosenIndex].attendee.uId!;

  /// Screen Method ----------------------------------------------------------------------------------------------------
  void _goToUserCardDetailScreen(BuildContext context) => Navigator.of(context)
      .pushNamed(ScreenOfChosenAttendeeOnAttendance.routeName);
}
