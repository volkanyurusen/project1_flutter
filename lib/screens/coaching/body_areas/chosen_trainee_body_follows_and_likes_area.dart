import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenTraineeBodyFollowsAndLikesArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppFunctions _appFunctions = AppFunctions();
  final ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
      chosenResponseAmongThoseWhoRespondedTrainingOfferCubit;
  final double screenWidth;

  ChosenTraineeBodyFollowsAndLikesArea({
    required this.chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChosenResponseAmongThoseWhoRespondedTrainingOfferState
        chosenResponseAmongThoseWhoRespondedTrainingOfferState =
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit.state;
    TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall!;
    Color textColorWithOpacity = _appColors.textColor.withOpacity(0.7);

    return Column(
      children: [
        _createFollowingFollowersAndLikesArea(
            chosenResponseAmongThoseWhoRespondedTrainingOfferState,
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
    ChosenResponseAmongThoseWhoRespondedTrainingOfferState
        chosenResponseAmongThoseWhoRespondedTrainingOfferState,
    double screenWidth,
    TextStyle displaySmall,
    Color textColorWithOpacity,
  ) =>
      AppHeader(
          firstWidget: _createFollowingsAndFollowersArea(
              chosenResponseAmongThoseWhoRespondedTrainingOfferState,
              screenWidth,
              displaySmall,
              textColorWithOpacity),
          thirdWidget: _bringUserLikesDetailsFromDatabaseAndDisplayLikes(
              screenWidth,
              chosenResponseAmongThoseWhoRespondedTrainingOfferState,
              displaySmall));

  /// FOLLOWINGS & FOLLOWERS AREA --------------------------------------------------------------------------------------
  AppHeader _createFollowingsAndFollowersArea(
    ChosenResponseAmongThoseWhoRespondedTrainingOfferState
        chosenResponseAmongThoseWhoRespondedTrainingOfferState,
    double screenWidth,
    TextStyle displaySmall,
    Color textColorWithOpacity,
  ) =>
      AppHeader(
        firstWidget:
            _bringUserFollowingsDetailsFromDatabaseAndDisplayFollowings(
                chosenResponseAmongThoseWhoRespondedTrainingOfferState,
                screenWidth,
                displaySmall,
                textColorWithOpacity),
        secondWidget: const CustomAppSizedBox(height: 0, width: 10),
        thirdWidget: _bringUserFollowingsDetailsFromDatabaseAndDisplayFollowers(
            chosenResponseAmongThoseWhoRespondedTrainingOfferState,
            screenWidth,
            displaySmall,
            textColorWithOpacity),
      );

  /// LIKES AREA -------------------------------------------------------------------------------------------------------
  AppHeader _createLikeArea(
    BuildContext context,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferState
        chosenResponseAmongThoseWhoRespondedTrainingOfferState,
    UserLikingDynamicByUserState likingState,
    TextStyle displaySmall,
  ) =>
      AppHeader(
        firstWidget: _displayLikeIcon(),
        thirdWidget: _displayNumberOfLike(
            likingState,
            chosenResponseAmongThoseWhoRespondedTrainingOfferState,
            displaySmall),
      );

  /// BLOCS ============================================================================================================
  /// Following Bloc ---------------------------------------------------------------------------------------------------
  BlocBuilder<UserFollowingDynamicByUserBloc, UserFollowingDynamicByUserState>
      _bringUserFollowingsDetailsFromDatabaseAndDisplayFollowings(
    ChosenResponseAmongThoseWhoRespondedTrainingOfferState
        chosenResponseAmongThoseWhoRespondedTrainingOfferState,
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
                    chosenResponseAmongThoseWhoRespondedTrainingOfferState,
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
    ChosenResponseAmongThoseWhoRespondedTrainingOfferState
        chosenResponseAmongThoseWhoRespondedTrainingOfferState,
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
                    chosenResponseAmongThoseWhoRespondedTrainingOfferState,
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
    ChosenResponseAmongThoseWhoRespondedTrainingOfferState
        chosenResponseAmongThoseWhoRespondedTrainingOfferState,
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
                    chosenResponseAmongThoseWhoRespondedTrainingOfferState,
                    likingState,
                    displaySmall);
              case Status.failure:
                return StateError(error: likingState.error);
            }
          });

  /// DISPLAY ==========================================================================================================
  RichTextWithMultipleRows _displayFollowings(
    BuildContext context,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferState
        chosenResponseAmongThoseWhoRespondedTrainingOfferState,
    UserFollowingDynamicByUserState followingState,
    TextStyle displaySmall,
    Color textColorWithOpacity,
  ) =>
      RichTextWithMultipleRows(
        firstText: _displayFollowingNumber(followingState,
            chosenResponseAmongThoseWhoRespondedTrainingOfferState),
        textStyle: displaySmall,
        secondText: _displayFolowingText(followingState),
        secondTextFontWeight: FontWeight.normal,
        colorOfSecondText: textColorWithOpacity,
      );

  RichTextWithMultipleRows _displayFollowers(
    BuildContext context,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferState
        chosenResponseAmongThoseWhoRespondedTrainingOfferState,
    UserFollowingDynamicByUserState followingState,
    TextStyle displaySmall,
    Color textColorWithOpacity,
  ) =>
      RichTextWithMultipleRows(
        firstText: _displayFollowerNumber(followingState,
            chosenResponseAmongThoseWhoRespondedTrainingOfferState),
        textStyle: displaySmall,
        secondText: _displayFolowerText(followingState),
        secondTextFontWeight: FontWeight.normal,
        colorOfSecondText: textColorWithOpacity,
      );

  AppHeaderText _displayNumberOfLike(
          UserLikingDynamicByUserState likingState,
          ChosenResponseAmongThoseWhoRespondedTrainingOfferState
              chosenResponseAmongThoseWhoRespondedTrainingOfferState,
          TextStyle displaySmall) =>
      AppHeaderText(
          textLabel: _displayLikeNumber(likingState,
              chosenResponseAmongThoseWhoRespondedTrainingOfferState),
          textStyle: displaySmall.copyWith(color: _appColors.onSecondary));

  String _displayFollowingNumber(
    UserFollowingDynamicByUserState followingState,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferState
        chosenResponseAmongThoseWhoRespondedTrainingOfferState,
  ) =>
      _hasNoFollowing(followingState)
          ? '0'
          : _findFollowingNumber(followingState,
              chosenResponseAmongThoseWhoRespondedTrainingOfferState);

  String _displayFolowingText(
    UserFollowingDynamicByUserState followingState,
  ) =>
      _checkWhetherFollowingNumberMaxOne(followingState)
          ? ' following'
          : ' followings';

  String _displayFollowerNumber(
    UserFollowingDynamicByUserState followingState,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferState
        chosenResponseAmongThoseWhoRespondedTrainingOfferState,
  ) =>
      _hasNoFollower(followingState)
          ? '0'
          : _findFollowerNumber(followingState,
              chosenResponseAmongThoseWhoRespondedTrainingOfferState);

  String _displayFolowerText(
    UserFollowingDynamicByUserState followingState,
  ) =>
      _checkWhetherFollowerNumberMaxOne(followingState)
          ? ' follower'
          : ' followers';

  String _displayLikeNumber(
    UserLikingDynamicByUserState likingState,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferState
        chosenResponseAmongThoseWhoRespondedTrainingOfferState,
  ) =>
      _hasNoLike(likingState)
          ? '0'
          : _findLikeNumbers(likingState,
              chosenResponseAmongThoseWhoRespondedTrainingOfferState);

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
          ChosenResponseAmongThoseWhoRespondedTrainingOfferState
              chosenResponseAmongThoseWhoRespondedTrainingOfferState) =>
      _appFunctions.calculateFollowerNumberOfSpecificUser(
          followingState.userFollowingDynamicList,
          _findAttendeeUserId(
                  chosenResponseAmongThoseWhoRespondedTrainingOfferState)
              .toInt());

  String _findFollowingNumber(
    UserFollowingDynamicByUserState followingState,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferState
        chosenResponseAmongThoseWhoRespondedTrainingOfferState,
  ) =>
      _appFunctions.calculateFollowingNumberOfSpecificUser(
          followingState.userFollowingDynamicList,
          _findAttendeeUserId(
                  chosenResponseAmongThoseWhoRespondedTrainingOfferState)
              .toInt());

  String _findLikeNumbers(
    UserLikingDynamicByUserState likingState,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferState
        chosenResponseAmongThoseWhoRespondedTrainingOfferState,
  ) =>
      _appFunctions.calculateLikeNumberOfSpecificUser(
          likingState.userLikingDynamicList,
          _findAttendeeUserId(
                  chosenResponseAmongThoseWhoRespondedTrainingOfferState)
              .toInt());

  int _findAttendeeUserId(
    ChosenResponseAmongThoseWhoRespondedTrainingOfferState
        chosenResponseAmongThoseWhoRespondedTrainingOfferState,
  ) =>
      chosenResponseAmongThoseWhoRespondedTrainingOfferState
          .chosenTrainingOfferResponseDynamicWithDistanceList
          .last
          .traineeDynamic
          .uId!;
}
