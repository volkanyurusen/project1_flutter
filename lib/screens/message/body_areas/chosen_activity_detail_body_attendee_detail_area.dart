import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/consisted_activity_dynamic_with_distance.dart';
import 'package:my_project/widgets/widget.dart';

import '../../zscreens.dart';

class ChosenActivityDetailBodyAttendeeDetailArea extends StatelessWidget {
  final AppNumberConstants _appNumberConstants = AppNumberConstants();

  ChosenActivityDetailBodyAttendeeDetailArea({
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

  /// BLOC =============================================================================================================
  BlocBuilder<ConsistedActivityDynamicWithDistanceByCreatedActivityBloc,
          ConsistedActivityDynamicWithDistanceByCreatedActivityState>
      _bringAttendeesDetail(
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
        chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
    TextStyle headlineSmall,
  ) =>
          BlocBuilder<ConsistedActivityDynamicWithDistanceByCreatedActivityBloc,
              ConsistedActivityDynamicWithDistanceByCreatedActivityState>(
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return _createLoadingArea();
                case Status.loading:
                  return _createLoadingArea();
                case Status.success:
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
                case Status.failure:
                  return StateError(error: state.error);
              }
            },
          );

  /// CREATE ===========================================================================================================
  AppWrap _createAttendeeDetailArea(
    BuildContext context,
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
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
        children: List.generate(_getConsistedActivityByApproved(state).length,
            (index) {
          return _createAttendeeDetailAndDisplayThem(
              state,
              userFollowingDynamicByUserBloc,
              userLikingDynamicByUserBloc,
              consistedActivityDynamicWithDistanceByUserBloc,
              chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
              index);
        }),
      );

  BlocBuilder<ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
          ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestState>
      _createAttendeeDetailAndDisplayThem(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
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
              onTap: () => _goToChosenAttendeeScreenWithBringingNecessaryBlocs(
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
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
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
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
    int chosenIndex,
  ) =>
      UserImageContainer(
          height: 75, width: 75, url: _findAttendeePicUrl(state, chosenIndex));

  String _displayAttendeeUsername(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
    int chosenIndex,
  ) =>
      _findAttendeeUsername(state, chosenIndex);

  String _displayAttendeeDistance(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
    int index,
  ) =>
      _isAttendeeAppUser(state, index)
          ? ''
          : '${_getConsistedActivityByApproved(state).toList().elementAt(index).distanceBetween.round().toString()} km';

  /// METHODS ==========================================================================================================
  void _goToChosenAttendeeScreenWithBringingNecessaryBlocs(
    BuildContext context,
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
        chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
    int index,
  ) {
    _bringChosenAttendeeFollowingDetailFromDB(
        state, userFollowingDynamicByUserBloc, index);
    _bringChosenAttendeeLikeDetailFromDB(
        state, userLikingDynamicByUserBloc, index);
    _bringChosenConsistedActivityFromDB(
        state, consistedActivityDynamicWithDistanceByUserBloc, index);
    _assignTheAttendeeAsChosenAttendee(
        state, chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit, index);
    _goToUserCardDetailScreen(context);
  }

  void _bringChosenAttendeeFollowingDetailFromDB(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    int index,
  ) =>
      userFollowingDynamicByUserBloc.add(LoadUserFollowingDynamicByUserEvent(
          uId: _findAttendeeUserId(state, index)));

  void _bringChosenAttendeeLikeDetailFromDB(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    int index,
  ) =>
      userLikingDynamicByUserBloc.add(LoadUserLikingDynamicByUserEvent(
          uId: _findAttendeeUserId(state, index)));

  void _bringChosenConsistedActivityFromDB(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    int index,
  ) =>
      consistedActivityDynamicWithDistanceByUserBloc.add(
          LoadConsistedActivityDynamicWithDistanceByUserEvent(
              uId: _findAttendeeUserId(state, index)));

  void _assignTheAttendeeAsChosenAttendee(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
    ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
        chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
    int index,
  ) =>
      chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
          .pressChosenAttendeeOnAttendance(
              _getConsistedActivityByApproved(state).toList().elementAt(index));

  /// Hero Tag ---------------------------------------------------------------------------------------------------------
  String _heroTag(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
    int chosenIndex,
  ) =>
      _findConsistedActivityId(state, chosenIndex).toString() +
      _findAttendeeUsername(state, chosenIndex);

  /// Check Method -----------------------------------------------------------------------------------------------------
  bool _isAttendeeAppUser(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
    int index,
  ) =>
      _findAttendeeUserId(state, index) == _appNumberConstants.appUserId;

  /// Get Method -------------------------------------------------------------------------------------------------------
  Iterable<
      ConsistedActivityDynamicWithDistance> _getConsistedActivityByApproved(
          ConsistedActivityDynamicWithDistanceByCreatedActivityState state) =>
      state.consistedActivityDynamicWithDistanceList.where(
          (element) => element.processDetailDynamic.processName == "Approved");

  /// Find Method ------------------------------------------------------------------------------------------------------
  String _findAttendeePicUrl(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
    int index,
  ) =>
      _getConsistedActivityByApproved(state)
          .toList()
          .elementAt(index)
          .attendee
          .picUrl;

  String _findAttendeeUsername(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
    int index,
  ) =>
      _getConsistedActivityByApproved(state)
          .toList()
          .elementAt(index)
          .attendee
          .username;

  int _findAttendeeUserId(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
    int index,
  ) =>
      _getConsistedActivityByApproved(state)
          .toList()
          .elementAt(index)
          .attendee
          .uId!;

  int? _findConsistedActivityId(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
    int index,
  ) =>
      _getConsistedActivityByApproved(state)
          .toList()
          .elementAt(index)
          .consistedActivityId;

  /// Screen Method ----------------------------------------------------------------------------------------------------
  void _goToUserCardDetailScreen(BuildContext context) => Navigator.of(context)
      .pushNamed(ScreenOfChosenAttendeeOnAttendance.routeName);
}
