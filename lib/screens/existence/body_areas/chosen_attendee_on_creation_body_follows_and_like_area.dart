import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenAttendeeOnCreationBodyFollowsAndLikesArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppFunctions _appFunctions = AppFunctions();
  final ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
      chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit;
  final double screenWidth;

  ChosenAttendeeOnCreationBodyFollowsAndLikesArea({
    required this.chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit,
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChosenAttendeeOnCreationAmongThoseWhoSentRequestState
        chosenAttendeeOnCreationAmongThoseWhoSentRequestState =
        chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit.state;
    TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall!;
    Color textColorWithOpacity = _appColors.textColor.withOpacity(0.7);

    return Column(
      children: [
        _createFollowingFollowersAndLikesArea(
            chosenAttendeeOnCreationAmongThoseWhoSentRequestState,
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
    ChosenAttendeeOnCreationAmongThoseWhoSentRequestState
        chosenAttendeeOnCreationAmongThoseWhoSentRequestState,
    double screenWidth,
    TextStyle displaySmall,
    Color textColorWithOpacity,
  ) =>
      AppHeader(
          firstWidget: _createFollowingsAndFollowersArea(
              chosenAttendeeOnCreationAmongThoseWhoSentRequestState,
              screenWidth,
              displaySmall,
              textColorWithOpacity),
          thirdWidget: _bringUserLikesDetailsFromDatabaseAndDisplayLikes(
              screenWidth,
              chosenAttendeeOnCreationAmongThoseWhoSentRequestState,
              displaySmall));

  /// FOLLOWINGS & FOLLOWERS AREA --------------------------------------------------------------------------------------
  AppHeader _createFollowingsAndFollowersArea(
    ChosenAttendeeOnCreationAmongThoseWhoSentRequestState
        chosenAttendeeOnCreationAmongThoseWhoSentRequestState,
    double screenWidth,
    TextStyle displaySmall,
    Color textColorWithOpacity,
  ) =>
      AppHeader(
        firstWidget:
            _bringUserFollowingsDetailsFromDatabaseAndDisplayFollowings(
                chosenAttendeeOnCreationAmongThoseWhoSentRequestState,
                screenWidth,
                displaySmall,
                textColorWithOpacity),
        secondWidget: const CustomAppSizedBox(height: 0, width: 10),
        thirdWidget: _bringUserFollowingsDetailsFromDatabaseAndDisplayFollowers(
            chosenAttendeeOnCreationAmongThoseWhoSentRequestState,
            screenWidth,
            displaySmall,
            textColorWithOpacity),
      );

  /// LIKES AREA -------------------------------------------------------------------------------------------------------
  AppHeader _createLikeArea(
    BuildContext context,
    ChosenAttendeeOnCreationAmongThoseWhoSentRequestState
        chosenAttendeeOnCreationAmongThoseWhoSentRequestState,
    UserLikingDynamicByUserState likingState,
    TextStyle displaySmall,
  ) =>
      AppHeader(
        firstWidget: _displayLikeIcon(),
        thirdWidget: _displayNumberOfLike(
            likingState,
            chosenAttendeeOnCreationAmongThoseWhoSentRequestState,
            displaySmall),
      );

  /// BLOCS ============================================================================================================
  /// Following Bloc ---------------------------------------------------------------------------------------------------
  BlocBuilder<UserFollowingDynamicByUserBloc, UserFollowingDynamicByUserState>
      _bringUserFollowingsDetailsFromDatabaseAndDisplayFollowings(
    ChosenAttendeeOnCreationAmongThoseWhoSentRequestState
        chosenAttendeeOnCreationAmongThoseWhoSentRequestState,
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
                    chosenAttendeeOnCreationAmongThoseWhoSentRequestState,
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
    ChosenAttendeeOnCreationAmongThoseWhoSentRequestState
        chosenAttendeeOnCreationAmongThoseWhoSentRequestState,
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
                    chosenAttendeeOnCreationAmongThoseWhoSentRequestState,
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
    ChosenAttendeeOnCreationAmongThoseWhoSentRequestState
        chosenAttendeeOnCreationAmongThoseWhoSentRequestState,
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
                    chosenAttendeeOnCreationAmongThoseWhoSentRequestState,
                    likingState,
                    displaySmall);
              case Status.failure:
                return StateError(error: likingState.error);
            }
          });

  /// DISPLAY ==========================================================================================================
  RichTextWithMultipleRows _displayFollowings(
    BuildContext context,
    ChosenAttendeeOnCreationAmongThoseWhoSentRequestState
        chosenAttendeeOnCreationAmongThoseWhoSentRequestState,
    UserFollowingDynamicByUserState followingState,
    TextStyle displaySmall,
    Color textColorWithOpacity,
  ) =>
      RichTextWithMultipleRows(
        firstText: _displayFollowingNumber(followingState,
            chosenAttendeeOnCreationAmongThoseWhoSentRequestState),
        textStyle: displaySmall,
        secondText: _displayFolowingText(followingState),
        secondTextFontWeight: FontWeight.normal,
        colorOfSecondText: textColorWithOpacity,
      );

  RichTextWithMultipleRows _displayFollowers(
    BuildContext context,
    ChosenAttendeeOnCreationAmongThoseWhoSentRequestState
        chosenAttendeeOnCreationAmongThoseWhoSentRequestState,
    UserFollowingDynamicByUserState followingState,
    TextStyle displaySmall,
    Color textColorWithOpacity,
  ) =>
      RichTextWithMultipleRows(
        firstText: _displayFollowerNumber(followingState,
            chosenAttendeeOnCreationAmongThoseWhoSentRequestState),
        textStyle: displaySmall,
        secondText: _displayFolowerText(followingState),
        secondTextFontWeight: FontWeight.normal,
        colorOfSecondText: textColorWithOpacity,
      );

  AppHeaderText _displayNumberOfLike(
          UserLikingDynamicByUserState likingState,
          ChosenAttendeeOnCreationAmongThoseWhoSentRequestState
              chosenAttendeeOnCreationAmongThoseWhoSentRequestState,
          TextStyle displaySmall) =>
      AppHeaderText(
          textLabel: _displayLikeNumber(likingState,
              chosenAttendeeOnCreationAmongThoseWhoSentRequestState),
          textStyle: displaySmall.copyWith(color: _appColors.onSecondary));

  String _displayFollowingNumber(
    UserFollowingDynamicByUserState followingState,
    ChosenAttendeeOnCreationAmongThoseWhoSentRequestState
        chosenAttendeeOnCreationAmongThoseWhoSentRequestState,
  ) =>
      _hasNoFollowing(followingState)
          ? '0'
          : _findFollowingNumber(followingState,
              chosenAttendeeOnCreationAmongThoseWhoSentRequestState);

  String _displayFolowingText(
    UserFollowingDynamicByUserState followingState,
  ) =>
      _checkWhetherFollowingNumberMaxOne(followingState)
          ? ' following'
          : ' followings';

  String _displayFollowerNumber(
    UserFollowingDynamicByUserState followingState,
    ChosenAttendeeOnCreationAmongThoseWhoSentRequestState
        chosenAttendeeOnCreationAmongThoseWhoSentRequestState,
  ) =>
      _hasNoFollower(followingState)
          ? '0'
          : _findFollowerNumber(followingState,
              chosenAttendeeOnCreationAmongThoseWhoSentRequestState);

  String _displayFolowerText(
    UserFollowingDynamicByUserState followingState,
  ) =>
      _checkWhetherFollowerNumberMaxOne(followingState)
          ? ' follower'
          : ' followers';

  String _displayLikeNumber(
    UserLikingDynamicByUserState likingState,
    ChosenAttendeeOnCreationAmongThoseWhoSentRequestState
        chosenAttendeeOnCreationAmongThoseWhoSentRequestState,
  ) =>
      _hasNoLike(likingState)
          ? '0'
          : _findLikeNumbers(likingState,
              chosenAttendeeOnCreationAmongThoseWhoSentRequestState);

  GestureDetector _displayLikeIcon() => GestureDetector(
      child: Icon(Icons.favorite_border, color: _appColors.onSecondary),
      onTap: () {
        if (kDebugMode) {
          print('Like has been clicked!!!');
        }
      });

  /// METHODS ==========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
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

  bool _checkWhetherFollowingNumberMaxOne(
    UserFollowingDynamicByUserState followingState,
  ) =>
      followingState.userFollowingDynamicList
          .map((e) => e.requestedUser)
          .toList()
          .length <=
      1;

  bool _checkWhetherFollowerNumberMaxOne(
    UserFollowingDynamicByUserState followingState,
  ) =>
      followingState.userFollowingDynamicList
          .map((e) => e.requester)
          .toList()
          .length <=
      1;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findFollowerNumber(
          UserFollowingDynamicByUserState followingState,
          ChosenAttendeeOnCreationAmongThoseWhoSentRequestState
              chosenAttendeeOnCreationAmongThoseWhoSentRequestState) =>
      _appFunctions.calculateFollowerNumberOfSpecificUser(
          followingState.userFollowingDynamicList,
          _findAttendeeUserId(
                  chosenAttendeeOnCreationAmongThoseWhoSentRequestState)
              .toInt());

  String _findFollowingNumber(
    UserFollowingDynamicByUserState followingState,
    ChosenAttendeeOnCreationAmongThoseWhoSentRequestState
        chosenAttendeeOnCreationAmongThoseWhoSentRequestState,
  ) =>
      _appFunctions.calculateFollowingNumberOfSpecificUser(
          followingState.userFollowingDynamicList,
          _findAttendeeUserId(
                  chosenAttendeeOnCreationAmongThoseWhoSentRequestState)
              .toInt());

  String _findLikeNumbers(
    UserLikingDynamicByUserState likingState,
    ChosenAttendeeOnCreationAmongThoseWhoSentRequestState
        chosenAttendeeOnCreationAmongThoseWhoSentRequestState,
  ) =>
      _appFunctions.calculateLikeNumberOfSpecificUser(
          likingState.userLikingDynamicList,
          _findAttendeeUserId(
                  chosenAttendeeOnCreationAmongThoseWhoSentRequestState)
              .toInt());

  int _findAttendeeUserId(
    ChosenAttendeeOnCreationAmongThoseWhoSentRequestState
        chosenAttendeeOnCreationAmongThoseWhoSentRequestState,
  ) =>
      chosenAttendeeOnCreationAmongThoseWhoSentRequestState
          .chosenConsistedActivityDynamicWithDistanceList.last.attendee.uId!;
}
