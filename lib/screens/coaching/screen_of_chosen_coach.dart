import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/coaching/bodies/zbodies.dart';
import 'package:my_project/widgets/widget.dart';

class ScreenOfChosenCoach extends StatelessWidget {
  static const String routeName = 'screen_of_chosen_coach';

  const ScreenOfChosenCoach({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    // final ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
    //     chosenResponseAmongThoseWhoRespondedTrainingRequestCubit = context
    //         .read<ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit>();

    return
        //
        // WillPopScope(
        //   onWillPop: () async {
        //     _closeTheScreen(context);
        //     _unchoseChosenCoach(
        //         chosenResponseAmongThoseWhoRespondedTrainingRequestCubit);
        //     return Future(() => true);
        //   },
        //   child:
        Scaffold(
      appBar: _createCoachPhotoOnTop(context),
      body: const ChosenCoachBody(),
      //
      // Column(
      //   children: [
      //     AppBody(
      //         alignment: Alignment.topCenter,
      //         child: SingleChildScrollView(
      //           child: BlocBuilder<
      //                   ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
      //                   ChosenResponseAmongThoseWhoRespondedTrainingRequestState>(
      //               builder: (context, chosenState) {
      //             return Column(
      //               children: [
      //                 const CustomAppSizedBox(),
      //                 _createUserNameArea(
      //                     context,
      //                     chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
      //                     _headline2),
      //                 CustomAppDivider(),
      //                 _createFollowingFollowersAndLikesArea(
      //                     chosenState, _screenWidth, _headline3),
      //                 const CustomAppSizedBox(),
      //                 _displayAboutUser(context, chosenState, _headline3),
      //                 const CustomAppSizedBox(height: 9),
      //                 CustomAppDivider(),
      //               ],
      //             );
      //           }),
      //         )),
      //     const CustomAppSizedBox(height: 9),
      //     _createRecentActivityTitle(),
      //     _bringRecentActivitiesDetailsFromDatabaseAndDisplayThem(
      //         _screenWidth, _headline6),
      //     const CustomAppSizedBox(height: 32),
      //   ],
      // ),
    );
    // );
  }

  /// CREATE ===========================================================================================================
  _createCoachPhotoOnTop(BuildContext context) => PreferredSizeForPicture(
      context: context, child: AppBar(flexibleSpace: _buildChosenCoachPhoto()));

  /// BUILD ============================================================================================================
  BlocBuilder<ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
          ChosenResponseAmongThoseWhoRespondedTrainingRequestState>
      _buildChosenCoachPhoto() => BlocBuilder<
              ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
              ChosenResponseAmongThoseWhoRespondedTrainingRequestState>(
          builder: (context, chosenState) => AppBarHero(
                tag: _choiceCoachHeroTag(chosenState),
                image: _displayChosenCoachPhoto(chosenState),
              ));

  /// DISPLAY ==========================================================================================================
  NetworkImage _displayChosenCoachPhoto(
    ChosenResponseAmongThoseWhoRespondedTrainingRequestState chosenState,
  ) =>
      NetworkImage(chosenState
          .chosenTrainingRequestResponseDynamicWithDistanceList
          .last
          .coachDynamic
          .userDynamic
          .picUrl);

  /// METHODS ==========================================================================================================
  /// Hero Methods -----------------------------------------------------------------------------------------------------
  String _choiceCoachHeroTag(
    ChosenResponseAmongThoseWhoRespondedTrainingRequestState chosenState,
  ) =>
      chosenState.chosenTrainingRequestResponseDynamicWithDistanceList.last
          .trainingRequestResponseId
          .toString() +
      chosenState.chosenTrainingRequestResponseDynamicWithDistanceList.last
          .coachDynamic.userDynamic.uId!
          .toString();

  /// Unchoose Methods -------------------------------------------------------------------------------------------------
  // void _unchoseChosenCoach(
  //   ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
  //       chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
  // ) =>
  //     chosenResponseAmongThoseWhoRespondedTrainingRequestCubit.pressBackButton(
  //         chosenResponseAmongThoseWhoRespondedTrainingRequestCubit
  //             .state.chosenTrainingRequestResponseDynamicWithDistanceList.last);

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  // void _closeTheScreen(BuildContext context) {
  //   Navigator.of(context).pop();
  // }

  // /// SKELTON ==========================================================================================================
  // AppListViewBuilder _recentActivitySkelton(double screenWidth) =>
  //     AppListViewBuilder(
  //         itemCount: 3,
  //         itemBuilder: (context, index) => SkeltonColumn(
  //               screenWidth: screenWidth,
  //             ));

  // SkeltonContainer _skeltonForFollowingsAndFollowers(double screenWidth) =>
  //     SkeltonContainer(
  //         height: _appNumberConstants.skeltonHeight3, width: screenWidth * 0.2);

  // SkeltonContainer _skeltonForLikes(double screenWidth) => SkeltonContainer(
  //     height: _appNumberConstants.skeltonHeight3, width: screenWidth * 0.1);

  // SkeltonContainer _skeltonForBoxesOfCreationAndAttendance() =>
  //     SkeltonContainer(height: 40, width: 60);

  // /// Attendees Photo Url
  // String _attendeesPhotoUrl(
  //         ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
  //             chosenResponseAmongThoseWhoRespondedTrainingRequestCubit) =>
  //     chosenResponseAmongThoseWhoRespondedTrainingRequestCubit
  //         .state
  //         .chosenResponseAmongThoseWhoRespondedTrainingRequest
  //         .last
  //         .coachDynamic
  //         .userDynamic
  //         .picUrl;

  // /// USERNAME & DISTANCE & FOLLOW BUTTON ==============================================================================
  // AppHeader _createUserNameArea(
  //   BuildContext context,
  //   ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
  //       chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
  //   TextStyle? headline2,
  // ) =>
  //     AppHeader(
  //         // username & activity level
  //         firstWidget: _displayUsernameAndDistance(
  //             context, chosenResponseAmongThoseWhoRespondedTrainingRequestCubit, headline2),
  //         // follow button
  //         thirdWidget: ChoiceContainer(
  //             containerText: 'Follow                ',
  //             onTap: () {
  //               if (kDebugMode) {
  //                 print('follow button has been clicked');
  //               }
  //             }));

  // /// USERNAME & DISTANCE ==============================================================================================
  // ChoiceColumn _displayUsernameAndDistance(
  //         BuildContext context,
  //         ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
  //             chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
  //         TextStyle? headline2) =>
  //     ChoiceColumn(
  //         containerColor: Colors.transparent,
  //         headerLabel: chosenResponseAmongThoseWhoRespondedTrainingRequestCubit
  //             .state
  //             .chosenResponseAmongThoseWhoRespondedTrainingRequest
  //             .last
  //             .coachDynamic
  //             .userDynamic
  //             .username,
  //         headerLabelTextStyle: headline2,
  //         detailLabel:
  //             // '(${chosenActivityDynamicsForAttendanceCubit.state.chosenActivityDynamicsForAttendance.last.host.activityLevelDynamic.activityLevelName.toCapitalized()}) '
  //             'nearly ${chosenResponseAmongThoseWhoRespondedTrainingRequestCubit.state.chosenResponseAmongThoseWhoRespondedTrainingRequest.last.distanceBetween.round().toString()} km',
  //         detailLabelTextStyle: Theme.of(context)
  //             .textTheme
  //             .bodyText1!
  //             .copyWith(color: _appColors.textColor.withOpacity(0.7)));

  // /// FOLLOWINGS & FOLLOWERS & LIKES AREA ==============================================================================
  // AppHeader _createFollowingFollowersAndLikesArea(
  //   ChosenResponseAmongThoseWhoRespondedTrainingRequestState chosenState,
  //   double screenWidth,
  //   TextStyle headline3,
  // ) =>
  //     AppHeader(
  //         firstWidget: _createFollowingAndFollowersArea(
  //             chosenState, screenWidth, headline3),
  //         thirdWidget: _bringUserLikesDetailsFromDatabaseAndDisplayLikes(
  //             chosenState, screenWidth, headline3));

  // /// FOLLOWINGS & FOLLOWERS AREA ======================================================================================
  // AppHeader _createFollowingAndFollowersArea(
  //   ChosenResponseAmongThoseWhoRespondedTrainingRequestState chosenState,
  //   double screenWidth,
  //   TextStyle headline3,
  // ) =>
  //     AppHeader(
  //       firstWidget:
  //           _bringUserFollowingsDetailsFromDatabaseAndDisplayFollowings(
  //               chosenState, screenWidth, headline3),
  //       secondWidget: const CustomAppSizedBox(height: 0, width: 10),
  //       thirdWidget: _bringUserFollowingsDetailsFromDatabaseAndDisplayFollowers(
  //           chosenState, screenWidth, headline3),
  //     );

  // /// Followings Widget
  // BlocBuilder<UserFollowingDynamicByIndividualUserBloc,
  //         UserFollowingDynamicByIndividualUserState>
  //     _bringUserFollowingsDetailsFromDatabaseAndDisplayFollowings(
  //   ChosenResponseAmongThoseWhoRespondedTrainingRequestState chosenState,
  //   double screenWidth,
  //   TextStyle headline3,
  // ) =>
  //         BlocBuilder<UserFollowingDynamicByIndividualUserBloc,
  //                 UserFollowingDynamicByIndividualUserState>(
  //             builder: (context, followingState) {
  //           if (followingState.status == Status.loading) {
  //             return _skeltonForFollowingsAndFollowers(screenWidth);
  //           } else if (followingState.status == Status.success) {
  //             return _displayFollowings(
  //                 context, chosenState, followingState, headline3);
  //           } else if (followingState.status == Status.failure) {
  //             return StateError(error: followingState.error);
  //           }
  //           return NothingReturned();
  //         });

  // RichTextWithMultipleRows _displayFollowings(
  //   BuildContext context,
  //   ChosenResponseAmongThoseWhoRespondedTrainingRequestState chosenState,
  //   UserFollowingDynamicByIndividualUserState followingState,
  //   TextStyle headline3,
  // ) =>
  //     RichTextWithMultipleRows(
  //       firstText: __displayNumberOfFollowings(followingState, chosenState),
  //       textStyle: headline3,
  //       // follower
  //       secondText: _displayTextOfFollowings(followingState),
  //       secondTextFontWeight: FontWeight.normal,
  //       colorOfSecondText: _appColors.textColor.withOpacity(0.7),
  //     );

  // String __displayNumberOfFollowings(
  //   UserFollowingDynamicByIndividualUserState followingState,
  //   ChosenResponseAmongThoseWhoRespondedTrainingRequestState chosenState,
  // ) =>
  //     followingState.userFollowingDynamicByIndividualUserList
  //             .map((e) => e.requestedUser)
  //             .toList()
  //             .isEmpty
  //         ? '0'
  //         : _appFunctions.calculateFollowingNumberOfSpecificUser(
  //             followingState.userFollowingDynamicByIndividualUserList,
  //             chosenState.chosenResponseAmongThoseWhoRespondedTrainingRequest.last.coachDynamic
  //                 .userDynamic.uId!
  //                 .toInt());

  // String _displayTextOfFollowings(
  //   UserFollowingDynamicByIndividualUserState followingState,
  // ) =>
  //     followingState.userFollowingDynamicByIndividualUserList
  //                 .map((e) => e.requestedUser)
  //                 .toList()
  //                 .length <=
  //             1
  //         ? ' following'
  //         : ' followings';

  // /// Followers Widget
  // BlocBuilder<UserFollowingDynamicByIndividualUserBloc,
  //         UserFollowingDynamicByIndividualUserState>
  //     _bringUserFollowingsDetailsFromDatabaseAndDisplayFollowers(
  //   ChosenResponseAmongThoseWhoRespondedTrainingRequestState chosenState,
  //   double screenWidth,
  //   TextStyle headline3,
  // ) =>
  //         BlocBuilder<UserFollowingDynamicByIndividualUserBloc,
  //                 UserFollowingDynamicByIndividualUserState>(
  //             builder: (context, followingState) {
  //           if (followingState.status == Status.loading) {
  //             return _skeltonForFollowingsAndFollowers(screenWidth);
  //           } else if (followingState.status == Status.success) {
  //             return _displayFollowers(
  //                 context, chosenState, followingState, headline3);
  //           } else if (followingState.status == Status.failure) {
  //             return StateError(error: followingState.error);
  //           }
  //           return const SizedBox();
  //         });

  // RichTextWithMultipleRows _displayFollowers(
  //   BuildContext context,
  //   ChosenResponseAmongThoseWhoRespondedTrainingRequestState chosenState,
  //   UserFollowingDynamicByIndividualUserState followingState,
  //   TextStyle headline3,
  // ) =>
  //     RichTextWithMultipleRows(
  //       firstText: __displayNumberOfFollowers(followingState, chosenState),
  //       textStyle: headline3,
  //       secondText: _displayTextOfFollowers(followingState),
  //       secondTextFontWeight: FontWeight.normal,
  //       colorOfSecondText: _appColors.textColor.withOpacity(0.7),
  //     );

  // String __displayNumberOfFollowers(
  //   UserFollowingDynamicByIndividualUserState followingState,
  //   ChosenResponseAmongThoseWhoRespondedTrainingRequestState chosenState,
  // ) =>
  //     followingState.userFollowingDynamicByIndividualUserList
  //             .map((e) => e.requester)
  //             .toList()
  //             .isEmpty
  //         ? '0'
  //         : _appFunctions.calculateFollowerNumberOfSpecificUser(
  //             followingState.userFollowingDynamicByIndividualUserList,
  //             chosenState.chosenResponseAmongThoseWhoRespondedTrainingRequest.last.coachDynamic
  //                 .userDynamic.uId!
  //                 .toInt());

  // String _displayTextOfFollowers(
  //   UserFollowingDynamicByIndividualUserState followingState,
  // ) =>
  //     followingState.userFollowingDynamicByIndividualUserList
  //                 .map((e) => e.requester)
  //                 .toList()
  //                 .length <=
  //             1
  //         ? ' follower'
  //         : ' followers';

  // /// Likes widget
  // BlocBuilder<UserLikingDynamicByIndividualUserBloc,
  //         UserLikingDynamicByIndividualUserState>
  //     _bringUserLikesDetailsFromDatabaseAndDisplayLikes(
  //   ChosenResponseAmongThoseWhoRespondedTrainingRequestState chosenState,
  //   double screenWidth,
  //   TextStyle headline3,
  // ) =>
  //         BlocBuilder<UserLikingDynamicByIndividualUserBloc,
  //                 UserLikingDynamicByIndividualUserState>(
  //             builder: (context, likingState) {
  //           if (likingState.status == Status.loading) {
  //             return _skeltonForLikes(screenWidth);
  //           } else if (likingState.status == Status.success) {
  //             return _displayLikes(
  //                 context, chosenState, likingState, headline3);
  //           } else if (likingState.status == Status.failure) {
  //             return StateError(error: likingState.error);
  //           }
  //           return NothingReturned();
  //         });

  // AppHeader _displayLikes(
  //   BuildContext context,
  //   ChosenResponseAmongThoseWhoRespondedTrainingRequestState chosenState,
  //   UserLikingDynamicByIndividualUserState likingState,
  //   TextStyle headline3,
  // ) =>
  //     AppHeader(
  //       firstWidget: _displayLikeIcon(),
  //       thirdWidget: _displayNumberOfLikes(likingState, chosenState, headline3),
  //     );

  // Icon _displayLikeIcon() => Icon(
  //       Icons.favorite_border,
  //       color: _appColors.onSecondary,
  //     );

  // Text _displayNumberOfLikes(
  //   UserLikingDynamicByIndividualUserState likingState,
  //   ChosenResponseAmongThoseWhoRespondedTrainingRequestState chosenState,
  //   TextStyle headline3,
  // ) =>
  //     Text(
  //         likingState.userLikingDynamicByIndividualUserList.isEmpty
  //             ? '0'
  //             : likingState.userLikingDynamicByIndividualUserList
  //                     .map((e) => e.likingUser)
  //                     .toList()
  //                     .isEmpty
  //                 ? '0'
  //                 : _appFunctions.calculateLikeNumberOfSpecificUser(
  //                     likingState.userLikingDynamicByIndividualUserList,
  //                     chosenState.chosenResponseAmongThoseWhoRespondedTrainingRequest.last
  //                         .coachDynamic.userDynamic.uId!
  //                         .toInt()),
  //         style: headline3.copyWith(color: _appColors.onSecondary));

  // /// ABOUT USER =======================================================================================================
  // /// bu alan about_user alanlarini olusturur
  // AppHeaderText _displayAboutUser(
  //   BuildContext context,
  //   ChosenResponseAmongThoseWhoRespondedTrainingRequestState chosenState,
  //   TextStyle headline3,
  // ) =>
  //     AppHeaderText(
  //         textLabel:
  //             '${chosenState.chosenResponseAmongThoseWhoRespondedTrainingRequest.last.coachDynamic.userDynamic.aboutUser} Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris',
  //         textStyle: headline3.copyWith(fontWeight: FontWeight.normal));

  // /// RECENT ACTIVITYT TITLE =========================================================================================
  // TitleOfActivityOnUserCardScreen _createRecentActivityTitle() =>
  //     TitleOfActivityOnUserCardScreen(title: 'RecentActivities');

  // /// RECENT ACTIVITY DETAIL ===========================================================================================
  // BlocBuilder<ConsistedActivityDynamicWithDistanceByIndividualUserBloc,
  //         ConsistedActivityDynamicWithDistanceByIndividualUserState>
  //     _bringRecentActivitiesDetailsFromDatabaseAndDisplayThem(
  //   double screenWidth,
  //   TextStyle headline6,
  // ) =>
  //         BlocBuilder<ConsistedActivityDynamicWithDistanceByIndividualUserBloc,
  //                 ConsistedActivityDynamicWithDistanceByIndividualUserState>(
  //             builder: (context, state) {
  //           if (state.status == Status.loading) {
  //             return _recentActivitySkelton(screenWidth);
  //           } else if (state.status == Status.success) {
  //             return AppListViewBuilder(
  //                 itemCount: _appFunctions.defineElementNumberWillBeDisplayed(
  //                     state
  //                         .consistedActivityDynamicWithDistanceByIndividualUserList,
  //                     3),
  //                 itemBuilder: (context, index) {
  //                   if (state
  //                       .consistedActivityDynamicWithDistanceByIndividualUserList
  //                       .isEmpty) {
  //                     return const SizedBox();
  //                   } else {
  //                     return buildAreaOfRecentActivities(
  //                         state, index, headline6);
  //                   }
  //                 });
  //           } else if (state.status == Status.failure) {
  //             return StateError(error: state.error);
  //           }
  //           return const SizedBox();
  //         });

  // AppHeader buildAreaOfRecentActivities(
  //   ConsistedActivityDynamicWithDistanceByIndividualUserState state,
  //   int index,
  //   TextStyle headline6,
  // ) =>
  //     AppHeader(
  //       spaceFromUpperWidget: 10,
  //       firstWidget: AppHeaderText(
  //           textLabel: _createRecentActivityNames(state, index),
  //           textStyle: headline6.copyWith(
  //               color: _appColors.textColor, fontWeight: FontWeight.w500)),
  //       thirdWidget: AppHeaderText(
  //           textLabel: _createRecentActivityDates(state, index),
  //           textStyle: headline6.copyWith(
  //               color: _appColors.textColor, fontWeight: FontWeight.w500)),
  //     );

  // String _createRecentActivityNames(
  //   ConsistedActivityDynamicWithDistanceByIndividualUserState state,
  //   int index,
  // ) =>
  //     _appFunctions
  //         .reversedListAndReturnItsSublist(
  //             state.consistedActivityDynamicWithDistanceByIndividualUserList,
  //             0,
  //             _appFunctions.defineElementNumberWillBeDisplayed(
  //                 state
  //                     .consistedActivityDynamicWithDistanceByIndividualUserList,
  //                 3))
  //         .elementAt(index)
  //         .createdActivityDynamic
  //         .activityDetailDynamic
  //         .activityNameDynamic
  //         .activityTitle;

  // String _createRecentActivityDates(
  //         ConsistedActivityDynamicWithDistanceByIndividualUserState state,
  //         int index) =>
  //     '${_appDateFormat.monthAndDayOnly.format(_appFunctions.reversedListAndReturnItsSublist(state.consistedActivityDynamicWithDistanceByIndividualUserList, 0, _appFunctions.defineElementNumberWillBeDisplayed(state.consistedActivityDynamicWithDistanceByIndividualUserList, 3)).elementAt(index).createdActivityDynamic.activityDate)}, ${_appFunctions.reversedListAndReturnItsSublist(state.consistedActivityDynamicWithDistanceByIndividualUserList, 0, _appFunctions.defineElementNumberWillBeDisplayed(state.consistedActivityDynamicWithDistanceByIndividualUserList, 3)).elementAt(index).createdActivityDynamic.activityDetailDynamic.timePeriodDynamic.timePeriodName}';
}
