// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import '../zscreens.dart';

class ChosenConsistedActivityBodyHostArea extends StatelessWidget {
  final ChosenActivityAmongConsistedActivityDynamicAttendedByUserState
      chosenState;

  const ChosenConsistedActivityBodyHostArea({
    required this.chosenState,
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
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit =
        context.read<ChosenHostWhoCreatedActivityCubit>();
    TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall!;

    return CustomColumn(
      children: [
        _createHostArea(displaySmall),
        const CustomAppSizedBox(height: 9),
        CustomAppDivider(),
        _createHostDetail(
            context,
            chosenState,
            userFollowingDynamicByUserBloc,
            userLikingDynamicByUserBloc,
            consistedActivityDynamicWithDistanceByUserBloc,
            chosenHostWhoCreatedActivityCubit),
        const CustomAppSizedBox(height: 32),
      ],
    );
  }

  /// CREATE ===========================================================================================================
  AppHeader _createHostArea(
    TextStyle? displaySmall,
  ) =>
      AppHeader(
          firstWidget:
              AppHeaderText(textLabel: 'Host', textStyle: displaySmall));

  CustomColumn _createHostDetail(
    BuildContext context,
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserState chosenState,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit,
  ) =>
      CustomColumn(
        children: [
          GestureDetector(
            onTap: () => _showDetailOfHost(
                context,
                chosenState,
                userFollowingDynamicByUserBloc,
                userLikingDynamicByUserBloc,
                consistedActivityDynamicWithDistanceByUserBloc,
                chosenHostWhoCreatedActivityCubit),
            child: ImageChoiceColumn(
              imageWidget: Hero(
                tag: _hostHeroTag(chosenState),
                child: _displayHostPhoto(chosenState),
              ),
              username: _displayHostUsername(chosenState),
              distance: _displayDistance(chosenState),
            ),
          )
        ],
      );

  /// DISPLAY ==========================================================================================================
  UserImageContainer _displayHostPhoto(
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserState chosenState,
  ) =>
      UserImageContainer(
          height: 75, width: 75, url: findHostPicUrl(chosenState));

  String _displayHostUsername(
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserState chosenState,
  ) =>
      _findHostUsername(chosenState);

  String _displayDistance(
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserState chosenState,
  ) =>
      '${chosenState.chosenConsistedActivityDynamicWithDistanceList.last.distanceBetween.round().toString()} km';

  /// METHODS ==========================================================================================================
  void _showDetailOfHost(
    BuildContext context,
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserState chosenState,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit,
  ) {
    //
    // if (kDebugMode) {
    //   print(
    //     _chosenActivityAmongConsistedActivityDynamicAttendedByUserCubit
    //         .state
    //         .chosenActivityAmongConsistedActivityDynamicAttendedByUser
    //         .length);
    // }
    _bringChosenHostFollowingDetailFromDB(
        chosenState, userFollowingDynamicByUserBloc);
    _bringChosenHostLikeDetailFromDB(chosenState, userLikingDynamicByUserBloc);
    _bringChosenConsistedActivityFromDB(
        chosenState, consistedActivityDynamicWithDistanceByUserBloc);
    _assignTheHostAsChosenHost(chosenState, chosenHostWhoCreatedActivityCubit);
    _goToUserCardDetailScreen(context);
  }

  void _bringChosenHostFollowingDetailFromDB(
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserState chosenState,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
  ) =>
      userFollowingDynamicByUserBloc.add(LoadUserFollowingDynamicByUserEvent(
          uId: _findHostUserId(chosenState)));

  void _bringChosenHostLikeDetailFromDB(
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserState chosenState,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
  ) =>
      userLikingDynamicByUserBloc.add(
          LoadUserLikingDynamicByUserEvent(uId: _findHostUserId(chosenState)));

  void _bringChosenConsistedActivityFromDB(
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserState chosenState,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
  ) =>
      consistedActivityDynamicWithDistanceByUserBloc.add(
          LoadConsistedActivityDynamicWithDistanceByUserEvent(
              uId: _findHostUserId(chosenState)));

  void _assignTheHostAsChosenHost(
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserState chosenState,
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit,
  ) =>
      chosenHostWhoCreatedActivityCubit.pressChosenHost(
          chosenState.chosenConsistedActivityDynamicWithDistanceList.first);

  /// Hero Tags --------------------------------------------------------------------------------------------------------
  String _hostHeroTag(
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserState chosenState,
  ) =>
      chosenState.chosenConsistedActivityDynamicWithDistanceList.first
          .createdActivityDynamic.createdActivityId
          .toString() +
      _findHostUsername(chosenState);

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String findHostPicUrl(
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserState chosenState,
  ) =>
      chosenState.chosenConsistedActivityDynamicWithDistanceList.last
          .createdActivityDynamic.host.picUrl;

  String _findHostUsername(
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserState chosenState,
  ) =>
      chosenState.chosenConsistedActivityDynamicWithDistanceList.last
          .createdActivityDynamic.host.username;

  int _findHostUserId(
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserState chosenState,
  ) =>
      chosenState.chosenConsistedActivityDynamicWithDistanceList.first
          .createdActivityDynamic.host.uId!;

  /// Screen Method ----------------------------------------------------------------------------------------------------
  void _goToUserCardDetailScreen(BuildContext context) =>
      Navigator.of(context).pushNamed(ScreenOfHost.routeName);
}
