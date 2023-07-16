import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenCoachBodyFollowsAndLikeArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppFunctions _appFunctions = AppFunctions();
  final ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
      chosenResponseAmongThoseWhoRespondedTrainingRequestCubit;

  ChosenCoachBodyFollowsAndLikeArea({
    required this.chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall!;
    Color textColorOfFollows = _appColors.textColor.withOpacity(0.7);
    ChosenResponseAmongThoseWhoRespondedTrainingRequestState
        chosenResponseAmongThoseWhoRespondedTrainingRequestState = context
            .read<ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit>()
            .state;
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        _createFollowingFollowersAndLikesArea(
            chosenResponseAmongThoseWhoRespondedTrainingRequestState,
            screenWidth,
            displaySmall,
            textColorOfFollows),
        const CustomAppSizedBox(),
      ],
    );
  }

  /// SKELTONS =========================================================================================================
  SkeltonContainer _skeltonForFollowingsAndFollowers(double screenWidth) =>
      SkeltonContainer(
          height: _appNumberConstants.skeltonHeight3, width: screenWidth * 0.2);

  SkeltonContainer _skeltonForLikes(double screenWidth) => SkeltonContainer(
      height: _appNumberConstants.skeltonHeight3, width: screenWidth * 0.1);

  /// CREATE ===========================================================================================================
  /// FOLLOWINGS & FOLLOWERS & LIKES AREA ==============================================================================
  AppHeader _createFollowingFollowersAndLikesArea(
    ChosenResponseAmongThoseWhoRespondedTrainingRequestState
        chosenResponseAmongThoseWhoRespondedTrainingRequestState,
    double screenWidth,
    TextStyle displaySmall,
    Color textColorOfFollows,
  ) =>
      AppHeader(
          firstWidget: _createFollowingAndFollowersArea(
              chosenResponseAmongThoseWhoRespondedTrainingRequestState,
              screenWidth,
              displaySmall,
              textColorOfFollows),
          thirdWidget: _bringUserLikesDetailsFromDatabaseAndDisplayLikes(
              chosenResponseAmongThoseWhoRespondedTrainingRequestState,
              screenWidth,
              displaySmall));

  /// FOLLOWINGS & FOLLOWERS AREA ======================================================================================
  AppHeader _createFollowingAndFollowersArea(
    ChosenResponseAmongThoseWhoRespondedTrainingRequestState
        chosenResponseAmongThoseWhoRespondedTrainingRequestState,
    double screenWidth,
    TextStyle displaySmall,
    Color textColorOfFollows,
  ) =>
      AppHeader(
        firstWidget:
            _bringUserFollowingsDetailsFromDatabaseAndDisplayFollowings(
                chosenResponseAmongThoseWhoRespondedTrainingRequestState,
                screenWidth,
                displaySmall,
                textColorOfFollows),
        secondWidget: const CustomAppSizedBox(height: 0, width: 10),
        thirdWidget: _bringUserFollowingsDetailsFromDatabaseAndDisplayFollowers(
            chosenResponseAmongThoseWhoRespondedTrainingRequestState,
            screenWidth,
            displaySmall,
            textColorOfFollows),
      );

  /// LIKES AREA =======================================================================================================
  AppHeader __createLikeArea(
    BuildContext context,
    ChosenResponseAmongThoseWhoRespondedTrainingRequestState
        chosenResponseAmongThoseWhoRespondedTrainingRequestState,
    UserLikingDynamicByUserState likingState,
    TextStyle displaySmall,
  ) =>
      AppHeader(
        firstWidget: _displayLikeIcon(),
        thirdWidget: _displayNumberOfLikes(
            likingState,
            chosenResponseAmongThoseWhoRespondedTrainingRequestState,
            displaySmall),
      );

  /// BLOCS ============================================================================================================
  /// Following Bloc ---------------------------------------------------------------------------------------------------
  BlocBuilder<UserFollowingDynamicByUserBloc, UserFollowingDynamicByUserState>
      _bringUserFollowingsDetailsFromDatabaseAndDisplayFollowings(
    ChosenResponseAmongThoseWhoRespondedTrainingRequestState
        chosenResponseAmongThoseWhoRespondedTrainingRequestState,
    double screenWidth,
    TextStyle displaySmall,
    Color textColorOfFollows,
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
                    chosenResponseAmongThoseWhoRespondedTrainingRequestState,
                    followingState,
                    displaySmall,
                    textColorOfFollows);
              case Status.failure:
                return StateError(error: followingState.error);
            }
          });

  /// Follower Bloc ----------------------------------------------------------------------------------------------------
  BlocBuilder<UserFollowingDynamicByUserBloc, UserFollowingDynamicByUserState>
      _bringUserFollowingsDetailsFromDatabaseAndDisplayFollowers(
    ChosenResponseAmongThoseWhoRespondedTrainingRequestState
        chosenResponseAmongThoseWhoRespondedTrainingRequestState,
    double screenWidth,
    TextStyle displaySmall,
    Color textColorOfFollows,
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
                    chosenResponseAmongThoseWhoRespondedTrainingRequestState,
                    followingState,
                    displaySmall,
                    textColorOfFollows);
              case Status.failure:
                return StateError(error: followingState.error);
            }
          });

  /// Like Bloc --------------------------------------------------------------------------------------------------------
  BlocBuilder<UserLikingDynamicByUserBloc, UserLikingDynamicByUserState>
      _bringUserLikesDetailsFromDatabaseAndDisplayLikes(
    ChosenResponseAmongThoseWhoRespondedTrainingRequestState
        chosenResponseAmongThoseWhoRespondedTrainingRequestState,
    double screenWidth,
    TextStyle displaySmall,
  ) =>
          BlocBuilder<UserLikingDynamicByUserBloc,
              UserLikingDynamicByUserState>(builder: (context, likingState) {
            switch (likingState.status) {
              case Status.initial:
                return _skeltonForLikes(screenWidth);
              case Status.loading:
                return _skeltonForLikes(screenWidth);
              case Status.success:
                return __createLikeArea(
                    context,
                    chosenResponseAmongThoseWhoRespondedTrainingRequestState,
                    likingState,
                    displaySmall);
              case Status.failure:
                return StateError(error: likingState.error);
            }
          });

  /// DISPLAY ==========================================================================================================
  RichTextWithMultipleRows _displayFollowings(
    BuildContext context,
    ChosenResponseAmongThoseWhoRespondedTrainingRequestState
        chosenResponseAmongThoseWhoRespondedTrainingRequestState,
    UserFollowingDynamicByUserState followingState,
    TextStyle displaySmall,
    Color textColorOfFollows,
  ) =>
      RichTextWithMultipleRows(
        firstText: _displayFollowingNumber(followingState,
            chosenResponseAmongThoseWhoRespondedTrainingRequestState),
        textStyle: displaySmall,
        secondText: _displayFolowingText(followingState),
        secondTextFontWeight: FontWeight.normal,
        colorOfSecondText: textColorOfFollows,
      );

  RichTextWithMultipleRows _displayFollowers(
    BuildContext context,
    ChosenResponseAmongThoseWhoRespondedTrainingRequestState
        chosenResponseAmongThoseWhoRespondedTrainingRequestState,
    UserFollowingDynamicByUserState followingState,
    TextStyle displaySmall,
    Color textColorOfFollows,
  ) =>
      RichTextWithMultipleRows(
        firstText: _displayFollowerNumber(followingState,
            chosenResponseAmongThoseWhoRespondedTrainingRequestState),
        textStyle: displaySmall,
        secondText: _displayFolowerText(followingState),
        secondTextFontWeight: FontWeight.normal,
        colorOfSecondText: textColorOfFollows,
      );

  AppHeaderText _displayNumberOfLikes(
    UserLikingDynamicByUserState likingState,
    ChosenResponseAmongThoseWhoRespondedTrainingRequestState
        chosenResponseAmongThoseWhoRespondedTrainingRequestState,
    TextStyle displaySmall,
  ) =>
      AppHeaderText(
          textLabel: _displayLikeNumber(likingState,
              chosenResponseAmongThoseWhoRespondedTrainingRequestState),
          textStyle: displaySmall.copyWith(color: _appColors.onSecondary));

  String _displayFollowingNumber(
    UserFollowingDynamicByUserState followingState,
    ChosenResponseAmongThoseWhoRespondedTrainingRequestState
        chosenResponseAmongThoseWhoRespondedTrainingRequestState,
  ) =>
      _hasNoFollowing(followingState)
          ? '0'
          : _findFollowingNumber(followingState,
              chosenResponseAmongThoseWhoRespondedTrainingRequestState);

  String _displayFolowingText(
    UserFollowingDynamicByUserState followingState,
  ) =>
      _checkWhetherFollowingNumberMaxOne(followingState)
          ? ' following'
          : ' followings';

  String _displayFollowerNumber(
    UserFollowingDynamicByUserState followingState,
    ChosenResponseAmongThoseWhoRespondedTrainingRequestState
        chosenResponseAmongThoseWhoRespondedTrainingRequestState,
  ) =>
      _hasNoFollower(followingState)
          ? '0'
          : _findFollowerNumber(followingState,
              chosenResponseAmongThoseWhoRespondedTrainingRequestState);

  String _displayFolowerText(
    UserFollowingDynamicByUserState followingState,
  ) =>
      _checkWhetherFollowerNumberMaxOne(followingState)
          ? ' follower'
          : ' followers';

  String _displayLikeNumber(
    UserLikingDynamicByUserState likingState,
    ChosenResponseAmongThoseWhoRespondedTrainingRequestState
        chosenResponseAmongThoseWhoRespondedTrainingRequestState,
  ) =>
      _hasNoLike(likingState)
          ? '0'
          : _findLikeNumbers(likingState,
              chosenResponseAmongThoseWhoRespondedTrainingRequestState);

  GestureDetector _displayLikeIcon() => GestureDetector(
        child: Icon(Icons.favorite_border, color: _appColors.onSecondary),
        onTap: () {
          if (kDebugMode) {
            print('Like has been clicked!!!');
          }
        },
      );

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
  String _findFollowingNumber(
    UserFollowingDynamicByUserState followingState,
    ChosenResponseAmongThoseWhoRespondedTrainingRequestState
        chosenResponseAmongThoseWhoRespondedTrainingRequestState,
  ) =>
      _appFunctions.calculateFollowingNumberOfSpecificUser(
          followingState.userFollowingDynamicList,
          _findCoachUserId(
                  chosenResponseAmongThoseWhoRespondedTrainingRequestState)
              .toInt());

  String _findFollowerNumber(
    UserFollowingDynamicByUserState followingState,
    ChosenResponseAmongThoseWhoRespondedTrainingRequestState
        chosenResponseAmongThoseWhoRespondedTrainingRequestState,
  ) =>
      _appFunctions.calculateFollowerNumberOfSpecificUser(
          followingState.userFollowingDynamicList,
          _findCoachUserId(
                  chosenResponseAmongThoseWhoRespondedTrainingRequestState)
              .toInt());

  String _findLikeNumbers(
    UserLikingDynamicByUserState likingState,
    ChosenResponseAmongThoseWhoRespondedTrainingRequestState
        chosenResponseAmongThoseWhoRespondedTrainingRequestState,
  ) =>
      _appFunctions.calculateLikeNumberOfSpecificUser(
          likingState.userLikingDynamicList,
          _findCoachUserId(
                  chosenResponseAmongThoseWhoRespondedTrainingRequestState)
              .toInt());

  int _findCoachUserId(
    ChosenResponseAmongThoseWhoRespondedTrainingRequestState
        chosenResponseAmongThoseWhoRespondedTrainingRequestState,
  ) =>
      chosenResponseAmongThoseWhoRespondedTrainingRequestState
          .chosenTrainingRequestResponseDynamicWithDistanceList
          .last
          .coachDynamic
          .userDynamic
          .uId!;
}
