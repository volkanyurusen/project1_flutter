import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class HostBodyFollowsAndLikeArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppFunctions _appFunctions = AppFunctions();
  final ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit;
  final double screenWidth;

  HostBodyFollowsAndLikeArea({
    required this.chosenHostWhoCreatedActivityCubit,
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChosenHostWhoCreatedActivityState chosenHostWhoCreatedActivityState =
        chosenHostWhoCreatedActivityCubit.state;
    TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall!;
    Color textColorWithOpacity = _appColors.textColor.withOpacity(0.7);

    return Column(
      children: [
        _createFollowingFollowersAndLikesArea(chosenHostWhoCreatedActivityState,
            screenWidth, displaySmall, textColorWithOpacity),
        const CustomAppSizedBox(),
      ],
    );
  }

  /// SKELTON ==========================================================================================================
  SkeltonContainer _skeltonForFollowingsAndFollowers(double screenWidth) =>
      SkeltonContainer(
          height: _appNumberConstants.skeltonHeight3, width: screenWidth * 0.2);

  SkeltonContainer _skeltonForLikes(double screenWidth) => SkeltonContainer(
      height: _appNumberConstants.skeltonHeight3, width: screenWidth * 0.1);

  /// CREATE ===========================================================================================================
  /// FOLLOWINGS & FOLLOWERS & LIKES AREA ==============================================================================
  AppHeader _createFollowingFollowersAndLikesArea(
    ChosenHostWhoCreatedActivityState chosenHostWhoCreatedActivityState,
    double screenWidth,
    TextStyle displaySmall,
    Color textColorWithOpacity,
  ) =>
      AppHeader(
          firstWidget: _createFollowingAndFollowersArea(
              chosenHostWhoCreatedActivityState,
              screenWidth,
              displaySmall,
              textColorWithOpacity),
          thirdWidget: _bringUserLikesDetailsFromDatabaseAndDisplayLikes(
              chosenHostWhoCreatedActivityState, screenWidth, displaySmall));

  /// FOLLOWINGS & FOLLOWERS AREA ======================================================================================
  AppHeader _createFollowingAndFollowersArea(
    ChosenHostWhoCreatedActivityState chosenHostWhoCreatedActivityState,
    double screenWidth,
    TextStyle displaySmall,
    Color textColorWithOpacity,
  ) =>
      AppHeader(
        firstWidget:
            _bringUserFollowingsDetailsFromDatabaseAndDisplayFollowings(
                chosenHostWhoCreatedActivityState,
                screenWidth,
                displaySmall,
                textColorWithOpacity),
        secondWidget: const CustomAppSizedBox(height: 0, width: 10),
        thirdWidget: _bringUserFollowingsDetailsFromDatabaseAndDisplayFollowers(
            chosenHostWhoCreatedActivityState,
            screenWidth,
            displaySmall,
            textColorWithOpacity),
      );

  /// LIKES AREA -------------------------------------------------------------------------------------------------------
  AppHeader _createLikeArea(
    BuildContext context,
    ChosenHostWhoCreatedActivityState chosenHostWhoCreatedActivityState,
    UserLikingDynamicByUserState likingState,
    TextStyle displaySmall,
  ) =>
      AppHeader(
        firstWidget: _displayLikeIcon(chosenHostWhoCreatedActivityState),
        thirdWidget: AppHeaderText(
            textLabel: _hasNoLike(likingState)
                ? '0'
                : _displayLikeNumbers(
                    likingState, chosenHostWhoCreatedActivityState),
            textStyle: displaySmall.copyWith(color: _appColors.onSecondary)),
      );

  /// BLOCS ============================================================================================================
  /// Following Bloc ---------------------------------------------------------------------------------------------------
  BlocBuilder<UserFollowingDynamicByUserBloc,
          UserFollowingDynamicByUserState>
      _bringUserFollowingsDetailsFromDatabaseAndDisplayFollowings(
    ChosenHostWhoCreatedActivityState chosenHostWhoCreatedActivityState,
    double screenWidth,
    TextStyle displaySmall,
    Color textColorWithOpacity,
  ) =>
          BlocBuilder<UserFollowingDynamicByUserBloc,
                  UserFollowingDynamicByUserState>(
              builder: (context, followingState) {
            switch (followingState.status) {
              case Status.initial:
                return _skeltonForFollowingsAndFollowers(screenWidth);
              case Status.loading:
                return _skeltonForFollowingsAndFollowers(screenWidth);
              case Status.success:
                return _displayFollowings(
                    context,
                    chosenHostWhoCreatedActivityState,
                    followingState,
                    displaySmall,
                    textColorWithOpacity);
              case Status.failure:
                return StateError(error: followingState.error);
            }
          });

  /// Follower Bloc ---------------------------------------------------------------------------------------------------
  BlocBuilder<UserFollowingDynamicByUserBloc,
          UserFollowingDynamicByUserState>
      _bringUserFollowingsDetailsFromDatabaseAndDisplayFollowers(
    ChosenHostWhoCreatedActivityState chosenHostWhoCreatedActivityState,
    double screenWidth,
    TextStyle displaySmall,
    Color textColorWithOpacity,
  ) =>
          BlocBuilder<UserFollowingDynamicByUserBloc,
                  UserFollowingDynamicByUserState>(
              builder: (context, followingState) {
            switch (followingState.status) {
              case Status.initial:
                return _skeltonForFollowingsAndFollowers(screenWidth);
              case Status.loading:
                return _skeltonForFollowingsAndFollowers(screenWidth);
              case Status.success:
                return _displayFollowers(
                    context,
                    chosenHostWhoCreatedActivityState,
                    followingState,
                    displaySmall,
                    textColorWithOpacity);
              case Status.failure:
                return StateError(error: followingState.error);
            }
          });

  /// Likes Bloc -------------------------------------------------------------------------------------------------------
  BlocBuilder<UserLikingDynamicByUserBloc,
          UserLikingDynamicByUserState>
      _bringUserLikesDetailsFromDatabaseAndDisplayLikes(
    ChosenHostWhoCreatedActivityState chosenHostWhoCreatedActivityState,
    double screenWidth,
    TextStyle displaySmall,
  ) =>
          BlocBuilder<UserLikingDynamicByUserBloc,
                  UserLikingDynamicByUserState>(
              builder: (context, likingState) {
            switch (likingState.status) {
              case Status.initial:
                return _skeltonForLikes(screenWidth);
              case Status.loading:
                return _skeltonForLikes(screenWidth);
              case Status.success:
                return _createLikeArea(
                    context,
                    chosenHostWhoCreatedActivityState,
                    likingState,
                    displaySmall);
              case Status.failure:
                return StateError(error: likingState.error);
            }
          });

  /// DISPLAY ==========================================================================================================
  RichTextWithMultipleRows _displayFollowings(
    BuildContext context,
    ChosenHostWhoCreatedActivityState chosenHostWhoCreatedActivityState,
    UserFollowingDynamicByUserState followingState,
    TextStyle displaySmall,
    Color textColorWithOpacity,
  ) =>
      RichTextWithMultipleRows(
        firstText: _hasNoFollowing(followingState)
            ? '0'
            : _displayFollowingNumber(
                followingState, chosenHostWhoCreatedActivityState),
        textStyle: displaySmall,
        // follower
        secondText:
            _hasNoFollowing(followingState) ? ' following' : ' followings',
        secondTextFontWeight: FontWeight.normal,
        colorOfSecondText: textColorWithOpacity,
      );

  String _displayFollowingNumber(
    UserFollowingDynamicByUserState followingState,
    ChosenHostWhoCreatedActivityState chosenHostWhoCreatedActivityState,
  ) =>
      _appFunctions.calculateFollowingNumberOfSpecificUser(
          followingState.userFollowingDynamicList,
          chosenHostWhoCreatedActivityState.chosenConsistedActivityDynamicWithDistance.last
              .createdActivityDynamic.host.uId!
              .toInt());

  RichTextWithMultipleRows _displayFollowers(
    BuildContext context,
    ChosenHostWhoCreatedActivityState chosenHostWhoCreatedActivityState,
    UserFollowingDynamicByUserState followingState,
    TextStyle displaySmall,
    Color textColorWithOpacity,
  ) =>
      RichTextWithMultipleRows(
        firstText: _hasNoFollower(followingState)
            ? '0'
            : _displayFollowerNumber(
                followingState, chosenHostWhoCreatedActivityState),
        textStyle: displaySmall,
        secondText: _hasNoFollower(followingState) ? ' follower' : ' followers',
        secondTextFontWeight: FontWeight.normal,
        colorOfSecondText: textColorWithOpacity,
      );

  String _displayFollowerNumber(
    UserFollowingDynamicByUserState followingState,
    ChosenHostWhoCreatedActivityState chosenHostWhoCreatedActivityState,
  ) =>
      _appFunctions.calculateFollowerNumberOfSpecificUser(
          followingState.userFollowingDynamicList,
          chosenHostWhoCreatedActivityState.chosenConsistedActivityDynamicWithDistance.last
              .createdActivityDynamic.host.uId!
              .toInt());

  GestureDetector _displayLikeIcon(
    ChosenHostWhoCreatedActivityState chosenHostWhoCreatedActivityState,
  ) =>
      GestureDetector(
        child: Icon(Icons.favorite_border, color: _appColors.onSecondary),
        onTap: () => chosenHostWhoCreatedActivityState
                    .chosenConsistedActivityDynamicWithDistance
                    .last
                    .createdActivityDynamic
                    .host
                    .uId ==
                _appNumberConstants.appUserId
            ? null
            : print('Like has been clicked!!!'),
      );

  String _displayLikeNumbers(
    UserLikingDynamicByUserState likingState,
    ChosenHostWhoCreatedActivityState chosenHostWhoCreatedActivityState,
  ) =>
      _appFunctions.calculateLikeNumberOfSpecificUser(
          likingState.userLikingDynamicList,
          chosenHostWhoCreatedActivityState.chosenConsistedActivityDynamicWithDistance.last
              .createdActivityDynamic.host.uId!
              .toInt());

  /// METHODS ==========================================================================================================
  /// Check Method -----------------------------------------------------------------------------------------------------
  bool _hasNoFollowing(
    UserFollowingDynamicByUserState followingState,
  ) =>
      followingState.userFollowingDynamicList
          .map((e) => e.requestedUser)
          .toList()
          .isEmpty;

  bool _hasNoFollower(
    UserFollowingDynamicByUserState followingState,
  ) =>
      followingState.userFollowingDynamicList
          .map((e) => e.requester)
          .toList()
          .isEmpty;

  bool _hasNoLike(UserLikingDynamicByUserState likingState) =>
      likingState.userLikingDynamicList
          .map((e) => e.likingUser)
          .toList()
          .isEmpty;
}
