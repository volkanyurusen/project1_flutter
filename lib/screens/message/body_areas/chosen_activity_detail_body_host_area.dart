// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/zscreens.dart';
import 'package:my_project/widgets/widget.dart';



class ChosenActivityDetailBodyHostArea extends StatelessWidget {
  final AppNumberConstants _appNumberConstants = AppNumberConstants();

  ChosenActivityDetailBodyHostArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserFollowingDynamicByUserBloc
        userFollowingDynamicByUserBloc =
        context.read<UserFollowingDynamicByUserBloc>();
    UserLikingDynamicByUserBloc
        userLikingDynamicByUserBloc =
        context.read<UserLikingDynamicByUserBloc>();
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc =
        context.read<ConsistedActivityDynamicWithDistanceByUserBloc>();
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit =
        context.read<ChosenHostWhoCreatedActivityCubit>();
    TextStyle? displaySmall  = Theme.of(context).textTheme.displaySmall !;

    return CustomColumn(
      children: [
        _createHostArea(displaySmall ),
        const CustomAppSizedBox(height: 9),
        CustomAppDivider(),
        _createHostDetail(
            context,
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
    TextStyle? displaySmall ,
  ) =>
      AppHeader(
          firstWidget: AppHeaderText(
        textLabel: 'Host',
        textStyle: displaySmall ,
      ));

  BlocBuilder<ConsistedActivityDynamicWithDistanceByCreatedActivityBloc,
          ConsistedActivityDynamicWithDistanceByCreatedActivityState>
      _createHostDetail(
    BuildContext context,
    UserFollowingDynamicByUserBloc
        userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit,
  ) =>
          BlocBuilder<ConsistedActivityDynamicWithDistanceByCreatedActivityBloc,
              ConsistedActivityDynamicWithDistanceByCreatedActivityState>(
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return const StateLoading();
                case Status.loading:
                  return const StateLoading();
                case Status.success:
                  return CustomColumn(
                    children: [
                      GestureDetector(
                        onTap: () => _showDetailOfHost(
                            context,
                            state,
                            userFollowingDynamicByUserBloc,
                            userLikingDynamicByUserBloc,
                            consistedActivityDynamicWithDistanceByUserBloc,
                            chosenHostWhoCreatedActivityCubit),
                        child: _displayHostChoiceColumn(state),
                      )
                    ],
                  );
                case Status.failure:
                  return StateError(error: state.error);
              }
            },
          );

  ImageChoiceColumn _displayHostChoiceColumn(
      ConsistedActivityDynamicWithDistanceByCreatedActivityState state) {
    return ImageChoiceColumn(
      imageWidget: Hero(
        tag: _hostHeroTag(state),
        child: _displayHostPhoto(state),
      ),
      username: _displayHostUsername(state),
      distance: _displayDistance(state),
    );
  }

  /// DISPLAY ==========================================================================================================
  UserImageContainer _displayHostPhoto(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
  ) =>
      UserImageContainer(height: 75, width: 75, url: findHostPicUrl(state));

  String _displayHostUsername(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
  ) =>
      _findHostUsername(state);

  String _displayDistance(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
  ) =>
      _isHostAppUser(state)
          ? ''
          : '${state.consistedActivityDynamicWithDistanceList.last.distanceBetween.round().toString()} km';

  /// METHODS ==========================================================================================================
  void _showDetailOfHost(
    BuildContext context,
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
    UserFollowingDynamicByUserBloc
        userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit,
  ) {
    _bringChosenHostFollowingDetailFromDB(
        state, userFollowingDynamicByUserBloc);
    _bringChosenHostLikeDetailFromDB(
        state, userLikingDynamicByUserBloc);
    _bringChosenConsistedActivityFromDB(
        state, consistedActivityDynamicWithDistanceByUserBloc);
    _assignTheHostAsChosenHost(state, chosenHostWhoCreatedActivityCubit);
    _goToUserCardDetailScreen(context);
  }

  /// Check Method -----------------------------------------------------------------------------------------------------
  bool _isHostAppUser(
          ConsistedActivityDynamicWithDistanceByCreatedActivityState state) =>
      state.consistedActivityDynamicWithDistanceList.last
          .createdActivityDynamic.host.uId ==
      _appNumberConstants.appUserId;

  /// Hero Tags --------------------------------------------------------------------------------------------------------
  String _hostHeroTag(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
  ) =>
      state.consistedActivityDynamicWithDistanceList.first
          .createdActivityDynamic.createdActivityId
          .toString() +
      _findHostUsername(state);

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String findHostPicUrl(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
  ) =>
      state.consistedActivityDynamicWithDistanceList.last
          .createdActivityDynamic.host.picUrl;

  String _findHostUsername(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
  ) =>
      state.consistedActivityDynamicWithDistanceList.last
          .createdActivityDynamic.host.username;

  int _findHostUserId(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
  ) =>
      state.consistedActivityDynamicWithDistanceList.first
          .createdActivityDynamic.host.uId!;

  /// Database Methods -------------------------------------------------------------------------------------------------
  void _bringChosenHostFollowingDetailFromDB(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
    UserFollowingDynamicByUserBloc
        userFollowingDynamicByUserBloc,
  ) =>
      userFollowingDynamicByUserBloc.add(
          LoadUserFollowingDynamicByUserEvent(
              uId: _findHostUserId(state)));

  void _bringChosenHostLikeDetailFromDB(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
  ) =>
      userLikingDynamicByUserBloc.add(
          LoadUserLikingDynamicByUserEvent(
              uId: _findHostUserId(state)));

  void _bringChosenConsistedActivityFromDB(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
  ) =>
      consistedActivityDynamicWithDistanceByUserBloc.add(
          LoadConsistedActivityDynamicWithDistanceByUserEvent(
              uId: _findHostUserId(state)));

  /// Assign Methods ---------------------------------------------------------------------------------------------------
  void _assignTheHostAsChosenHost(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit,
  ) =>
      chosenHostWhoCreatedActivityCubit.pressChosenHost(state
          .consistedActivityDynamicWithDistanceList.first);

  /// Screen Method ----------------------------------------------------------------------------------------------------
  void _goToUserCardDetailScreen(BuildContext context) =>
      Navigator.of(context).pushNamed(ScreenOfHost.routeName);
}
