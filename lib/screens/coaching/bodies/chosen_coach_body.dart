import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import 'zbodies.dart';

class ChosenCoachBody extends StatelessWidget {
  const ChosenCoachBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
        chosenResponseAmongThoseWhoRespondedTrainingRequestCubit = context
            .read<ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit>();
    double screenWidth = MediaQuery.of(context).size.width;

    return CustomAppScrollView(
      child: BlocBuilder<
              ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
              ChosenResponseAmongThoseWhoRespondedTrainingRequestState>(
          builder: (context, chosenState) {
        return CustomColumn(
          children: [
            ChosenCoachBodyUsernameArea(
                chosenResponseAmongThoseWhoRespondedTrainingRequestCubit:
                    chosenResponseAmongThoseWhoRespondedTrainingRequestCubit),
            ChosenCoachBodyFollowsAndLikeArea(
                chosenResponseAmongThoseWhoRespondedTrainingRequestCubit:
                    chosenResponseAmongThoseWhoRespondedTrainingRequestCubit),
            ChosenCoachBodyAboutUserArea(
                chosenResponseAmongThoseWhoRespondedTrainingRequestCubit:
                    chosenResponseAmongThoseWhoRespondedTrainingRequestCubit),
            const ChosenCoachBodyExercisePhotosArea(),
            ChosenCoachBodyApproveAndDenyArea(
                chosenResponseAmongThoseWhoRespondedTrainingRequestCubit:
                    chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
                screenWidth: screenWidth),
            //
            //const CustomAppSizedBox(),
            // _createApproveAndDenyArea(
            //     context, chosenState, screenWidth, headlineSmall),
            // const CustomAppSizedBox(height: 18),
          ],
        );
      }),
    );
  }

  /// CREATE ===========================================================================================================
  // CustomRow _createApproveAndDenyArea(
  //   BuildContext context,
  //   ChosenResponseAmongThoseWhoRespondedTrainingRequestState chosenState,
  //   double screenWidth,
  //   TextStyle headlineSmall,
  // ) =>
  //     CustomRow(
  //       mainAxisSize: MainAxisSize.max,
  //       children: [
  //         _displayDenyButton(context, chosenState, screenWidth, headlineSmall),
  //         _displayApproveButton(
  //             context, chosenState, screenWidth, headlineSmall),
  //       ],
  //     );

  /// DISPLAY ==========================================================================================================
  // CustomElevatedButton _displayDenyButton(
  //   BuildContext context,
  //   ChosenResponseAmongThoseWhoRespondedTrainingRequestState chosenState,
  //   double screenWidth,
  //   TextStyle headlineSmall,
  // ) =>
  //     CustomElevatedButton(
  //         textlabel: _appTextConstants.deny,
  //         elevatedButtonWidth: screenWidth * 0.35,
  //         buttonColor: _appColors.buttonDarkColor,
  //         onPressed: _checkIfUserRequestIsApprovedOrDenied(chosenState)
  //             ? null
  //             : () => _displayDenyDialog());

  // CustomElevatedButton _displayApproveButton(
  //   BuildContext context,
  //   ChosenResponseAmongThoseWhoRespondedTrainingRequestState chosenState,
  //   double screenWidth,
  //   TextStyle headlineSmall,
  // ) =>
  //     CustomElevatedButton(
  //         textlabel: _appTextConstants.approve,
  //         elevatedButtonWidth: screenWidth * 0.35,
  //         buttonColor: _appColors.secondary,
  //         onPressed: _checkIfUserRequestIsApprovedOrDenied(chosenState)
  //             ? null
  //             : () => _displayApproveDialog());

  /// METHOD ===========================================================================================================
  // void _displayDenyDialog() {
  //   if (kDebugMode) {
  //     print('Deny button has been clicked!!!');
  //   }
  // }

  // void _displayApproveDialog() {
  //   if (kDebugMode) {
  //     print('Approve button has been clicked!!!');
  //   }
  // }

  /// Check Method -----------------------------------------------------------------------------------------------------
  // bool _checkIfUserRequestIsApprovedOrDenied(
  //   ChosenResponseAmongThoseWhoRespondedTrainingRequestState chosenState,
  // ) =>
  //     chosenState.chosenTrainingRequestResponseDynamicWithDistanceList.last
  //             .processDetailDynamic.processName ==
  //         'Approved' ||
  //     chosenState.chosenTrainingRequestResponseDynamicWithDistanceList.last
  //             .processDetailDynamic.processName ==
  //         'Denied';

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

/// THIS IS THE CODE WITHOUT SILVERAPPBAR
/// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
/// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
/// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
/// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
/// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
/// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
/// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
/// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
/// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
/// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
/// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
/// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
/// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
/// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
/// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
/// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

// class ChosenCoachBody extends StatelessWidget {
//   const ChosenCoachBody({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
//         chosenResponseAmongThoseWhoRespondedTrainingRequestCubit =
//         context.read<ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit>();
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return CustomAppScrollView(
//       child: BlocBuilder<ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
//               ChosenResponseAmongThoseWhoRespondedTrainingRequestState>(
//           builder: (context, chosenState) {
//         return CustomColumn(
//           children: [
//             ChosenCoachBodyUsernameArea(
//                 chosenResponseAmongThoseWhoRespondedTrainingRequestCubit:
//                     chosenResponseAmongThoseWhoRespondedTrainingRequestCubit),
//             ChosenCoachBodyFollowsAndLikeArea(
//               chosenResponseAmongThoseWhoRespondedTrainingRequestCubit:
//                   chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
//             ),
//             // ChosenCoachBodyAboutUserArea(
//             //     chosenResponseAmongThoseWhoRespondedTrainingRequestCubit:
//             //         chosenResponseAmongThoseWhoRespondedTrainingRequestCubit),
//             const ChosenCoachBodyExercisePhotosArea(),
//             const CustomAppSizedBox(),
//             CustomElevatedButton(
//                 textlabel: 'Start conversation',
//                 onPressed: () {
//                   print(screenWidth); // 392.72
//                   print(screenHeight); // 781.09
//                 }),
//             const CustomAppSizedBox(),
//           ],
//         );
//       }),
//     );
