import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class UserCardDetailBodyFollowsAndLikesArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppFunctions _appFunctions = AppFunctions();
  final ChosenResultOfPreferredActivityDynamicCubit
      chosenResultOfPreferredActivityDynamicCubit;
  final double screenWidth;

  UserCardDetailBodyFollowsAndLikesArea({
    required this.chosenResultOfPreferredActivityDynamicCubit,
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChosenResultOfPreferredActivityDynamicState
        chosenResultOfPreferredActivityDynamicState =
        chosenResultOfPreferredActivityDynamicCubit.state;
    TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall!;
    Color textColorWithOpacity = _appColors.textColor.withOpacity(0.7);

    return Column(
      children: [
        _createFollowingFollowersAndLikesArea(
            chosenResultOfPreferredActivityDynamicState,
            screenWidth,
            displaySmall,
            textColorWithOpacity),
        const CustomAppSizedBox(),
      ],
    );
  }

  /// SKELTON ==========================================================================================================
  SkeltonContainer _dipslayFolloingAndFollowerSkelton(double screenWidth) =>
      SkeltonContainer(
          height: _appNumberConstants.skeltonHeight3, width: screenWidth * 0.2);

  SkeltonContainer _displayLikeSkelton(double screenWidth) => SkeltonContainer(
      height: _appNumberConstants.skeltonHeight3, width: screenWidth * 0.1);

  /// CREATE ===========================================================================================================
  /// FOLLOWING & FOLLOWERS & LIKES AREA -------------------------------------------------------------------------------
  AppHeader _createFollowingFollowersAndLikesArea(
    ChosenResultOfPreferredActivityDynamicState
        chosenResultOfPreferredActivityDynamicState,
    double screenWidth,
    TextStyle displaySmall,
    Color textColorWithOpacity,
  ) =>
      AppHeader(
          firstWidget: _createFollowingsAndFollowersArea(
              chosenResultOfPreferredActivityDynamicState,
              screenWidth,
              displaySmall,
              textColorWithOpacity),
          thirdWidget: _bringUserLikesDetailsFromDatabaseAndDisplayLikes(
              screenWidth,
              chosenResultOfPreferredActivityDynamicState,
              displaySmall));

  /// FOLLOWING & FOLLOWERS AREA ---------------------------------------------------------------------------------------
  AppHeader _createFollowingsAndFollowersArea(
    ChosenResultOfPreferredActivityDynamicState
        chosenResultOfPreferredActivityDynamicState,
    double screenWidth,
    TextStyle displaySmall,
    Color textColorWithOpacity,
  ) =>
      AppHeader(
        firstWidget:
            _bringUserFollowingsDetailsFromDatabaseAndDisplayFollowings(
                chosenResultOfPreferredActivityDynamicState,
                screenWidth,
                displaySmall,
                textColorWithOpacity),
        secondWidget: const CustomAppSizedBox(height: 0, width: 10),
        thirdWidget: _bringUserFollowingsDetailsFromDatabaseAndDisplayFollowers(
            chosenResultOfPreferredActivityDynamicState,
            screenWidth,
            displaySmall,
            textColorWithOpacity),
      );

  /// LIKES AREA -------------------------------------------------------------------------------------------------------
  AppHeader _createLikeArea(
    BuildContext context,
    ChosenResultOfPreferredActivityDynamicState
        chosenResultOfPreferredActivityDynamicState,
    UserLikingDynamicByUserState likingState,
    TextStyle displaySmall,
  ) =>
      AppHeader(
        firstWidget: _displayIcon(),
        thirdWidget: AppHeaderText(
            textLabel: _hasNoLike(likingState)
                ? '0'
                : _displayLikeNumbers(
                    likingState, chosenResultOfPreferredActivityDynamicState),
            textStyle: displaySmall.copyWith(color: _appColors.onSecondary)),
      );

  /// BLOCS ============================================================================================================
  /// Following Bloc ---------------------------------------------------------------------------------------------------
  BlocBuilder<UserFollowingDynamicByUserBloc, UserFollowingDynamicByUserState>
      _bringUserFollowingsDetailsFromDatabaseAndDisplayFollowings(
    ChosenResultOfPreferredActivityDynamicState
        chosenResultOfPreferredActivityDynamicState,
    double screenWidth,
    TextStyle displaySmall,
    Color textColorWithOpacity,
  ) =>
          BlocBuilder<UserFollowingDynamicByUserBloc,
                  UserFollowingDynamicByUserState>(
              builder: (context, followingState) {
            switch (followingState.status) {
              case Status.initial:
                return _dipslayFolloingAndFollowerSkelton(screenWidth);
              case Status.loading:
                return _dipslayFolloingAndFollowerSkelton(screenWidth);
              case Status.success:
                return _displayFollowings(
                    context,
                    chosenResultOfPreferredActivityDynamicState,
                    followingState,
                    displaySmall,
                    textColorWithOpacity);
              case Status.failure:
                return NothingReturned();
            }
          });

  /// Follower Bloc ----------------------------------------------------------------------------------------------------
  BlocBuilder<UserFollowingDynamicByUserBloc, UserFollowingDynamicByUserState>
      _bringUserFollowingsDetailsFromDatabaseAndDisplayFollowers(
    ChosenResultOfPreferredActivityDynamicState
        chosenResultOfPreferredActivityDynamicState,
    double screenWidth,
    TextStyle displaySmall,
    Color textColorWithOpacity,
  ) =>
          BlocBuilder<UserFollowingDynamicByUserBloc,
                  UserFollowingDynamicByUserState>(
              builder: (context, followingState) {
            switch (followingState.status) {
              case Status.initial:
                return _dipslayFolloingAndFollowerSkelton(screenWidth);
              case Status.loading:
                return _dipslayFolloingAndFollowerSkelton(screenWidth);
              case Status.success:
                return _displayFollowers(
                    context,
                    chosenResultOfPreferredActivityDynamicState,
                    followingState,
                    displaySmall,
                    textColorWithOpacity);
              case Status.failure:
                return StateError(error: followingState.error);
            }
          });

  /// Like Bloc --------------------------------------------------------------------------------------------------------
  BlocBuilder<UserLikingDynamicByUserBloc, UserLikingDynamicByUserState>
      _bringUserLikesDetailsFromDatabaseAndDisplayLikes(
    double screenWidth,
    ChosenResultOfPreferredActivityDynamicState
        chosenResultOfPreferredActivityDynamicState,
    TextStyle displaySmall,
  ) =>
          BlocBuilder<UserLikingDynamicByUserBloc,
              UserLikingDynamicByUserState>(builder: (context, likingState) {
            switch (likingState.status) {
              case Status.initial:
                return _displayLikeSkelton(screenWidth);
              case Status.loading:
                return _displayLikeSkelton(screenWidth);
              case Status.success:
                return _createLikeArea(
                    context,
                    chosenResultOfPreferredActivityDynamicState,
                    likingState,
                    displaySmall);
              case Status.failure:
                return StateError(error: likingState.error);
            }
          });

  /// DISPLAY ==========================================================================================================
  RichTextWithMultipleRows _displayFollowings(
    BuildContext context,
    ChosenResultOfPreferredActivityDynamicState
        chosenResultOfPreferredActivityDynamicState,
    UserFollowingDynamicByUserState followingState,
    TextStyle displaySmall,
    Color textColorWithOpacity,
  ) =>
      RichTextWithMultipleRows(
        firstText: _hasNoFollowing(followingState)
            ? '0'
            : _displayFollowingNumber(
                followingState, chosenResultOfPreferredActivityDynamicState),
        textStyle: displaySmall,
        secondText:
            _hasNoFollowing(followingState) ? ' following' : ' followings',
        secondTextFontWeight: FontWeight.normal,
        colorOfSecondText: textColorWithOpacity,
      );

  String _displayFollowingNumber(
    UserFollowingDynamicByUserState followingState,
    ChosenResultOfPreferredActivityDynamicState
        chosenResultOfPreferredActivityDynamicState,
  ) =>
      _appFunctions.calculateFollowingNumberOfSpecificUser(
          followingState.userFollowingDynamicList,
          chosenResultOfPreferredActivityDynamicState
              .chosenCreatedActivityDynamicWithDistanceList.last.hostId);

  RichTextWithMultipleRows _displayFollowers(
    BuildContext context,
    ChosenResultOfPreferredActivityDynamicState
        chosenResultOfPreferredActivityDynamicState,
    UserFollowingDynamicByUserState followingState,
    TextStyle displaySmall,
    Color textColorWithOpacity,
  ) =>
      RichTextWithMultipleRows(
        firstText: _hasNoFollower(followingState)
            ? '0'
            : _displayFollowerNumber(
                followingState, chosenResultOfPreferredActivityDynamicState),
        textStyle: displaySmall,
        secondText: _hasNoFollower(followingState) ? ' follower' : ' followers',
        secondTextFontWeight: FontWeight.normal,
        colorOfSecondText: textColorWithOpacity,
      );

  String _displayFollowerNumber(
          UserFollowingDynamicByUserState followingState,
          ChosenResultOfPreferredActivityDynamicState
              chosenResultOfPreferredActivityDynamicState) =>
      _appFunctions.calculateFollowerNumberOfSpecificUser(
          followingState.userFollowingDynamicList,
          chosenResultOfPreferredActivityDynamicState
              .chosenCreatedActivityDynamicWithDistanceList.last.hostId
              .toInt());

  GestureDetector _displayIcon() => GestureDetector(
      child: Icon(Icons.favorite_border, color: _appColors.onSecondary),
      onTap: () {
        if (kDebugMode) {
          print('Like has been clicked!!!');
        }
      });

  String _displayLikeNumbers(
    UserLikingDynamicByUserState likingState,
    ChosenResultOfPreferredActivityDynamicState
        chosenResultOfPreferredActivityDynamicState,
  ) =>
      _appFunctions.calculateLikeNumberOfSpecificUser(
          likingState.userLikingDynamicList,
          chosenResultOfPreferredActivityDynamicState
              .chosenCreatedActivityDynamicWithDistanceList.last.hostId
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

  bool _hasNoLike(
    UserLikingDynamicByUserState likingState,
  ) =>
      likingState.userLikingDynamicList
          .map((e) => e.likingUser)
          .toList()
          .isEmpty;
}
