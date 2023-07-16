import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/screens/navigation/local_widgets/local_widgets.dart';
import 'package:my_project/screens/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class PageOfCoaching extends StatelessWidget {
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  PageOfCoaching({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TrainingRequestDynamicRequestedByUserBloc
        trainingRequestDynamicRequestedByUserBloc =
        context.read<TrainingRequestDynamicRequestedByUserBloc>();
    final TrainingOfferDynamicOfferedByCoachBloc
        trainingOfferDynamicOfferedByCoachBloc =
        context.read<TrainingOfferDynamicOfferedByCoachBloc>();
    //
    // final TrainingRequestResponseDynamicForRequestOfUserBloc
    //     trainingRequestResponseDynamicForRequestOfUserBloc =
    //     context.read<TrainingRequestResponseDynamicForRequestOfUserBloc>();
    // final TrainingOfferResponseDynamicForOfferOfCoachBloc
    //     trainingOfferResponseDynamicForOfferOfCoachBloc =
    //     context.read<TrainingOfferResponseDynamicForOfferOfCoachBloc>();

    int appUserId = _appNumberConstants.appUserId;
    int appCoachId = _appNumberConstants.appCoachId;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle? displayLarge = Theme.of(context).textTheme.displayLarge!;
    Color backgroundColor =
        Theme.of(context).colorScheme.background.withOpacity(0.60);

    return Stack(
      children: [
        _createScreenSizedBox(context, backgroundColor),
        _createChoiceColumnForUsersAndCoachs(
            context,
            trainingRequestDynamicRequestedByUserBloc,
            trainingOfferDynamicOfferedByCoachBloc,
            //
            // trainingRequestResponseDynamicForRequestOfUserBloc,
            // trainingOfferResponseDynamicForOfferOfCoachBloc,
            appUserId,
            appCoachId,
            screenHeight,
            screenWidth,
            displayLarge)
      ],
    );
  }

  /// CREATE ===========================================================================================================
  /// Below function creates the backround color
  ScreenSizedBox _createScreenSizedBox(
    BuildContext context,
    Color backgroundColor,
  ) =>
      ScreenSizedBox(child: _displayScreenStack(context, backgroundColor));

  /// Below function is create the
  Column _createChoiceColumnForUsersAndCoachs(
    BuildContext context,
    TrainingRequestDynamicRequestedByUserBloc
        trainingRequestDynamicRequestedByUserBloc,
    //
    // TrainingRequestResponseDynamicForRequestOfUserBloc
    //     trainingRequestResponseDynamicForRequestOfUserBloc,
    TrainingOfferDynamicOfferedByCoachBloc
        trainingOfferDynamicOfferedByCoachBloc,
    //
    // TrainingOfferResponseDynamicForOfferOfCoachBloc
    //     trainingOfferResponseDynamicForOfferOfCoachBloc,
    int appUserId,
    int appCoachId,
    double screenHeight,
    double screenWidth,
    TextStyle displayLarge,
  ) =>
      Column(
        children: [
          _generateUsersBox(
              context,
              trainingRequestDynamicRequestedByUserBloc,
              // trainingRequestResponseDynamicForRequestOfUserBloc,
              appUserId,
              appCoachId,
              screenHeight,
              screenWidth,
              displayLarge),
          appCoachId != 0
              ? _generateCoachesBox(
                  context,
                  trainingOfferDynamicOfferedByCoachBloc,
                  // trainingOfferResponseDynamicForOfferOfCoachBloc,
                  appCoachId,
                  screenHeight,
                  screenWidth,
                  displayLarge)
              : const SizedBox(),
        ],
      );

  /// GENERATE =========================================================================================================
  _generateUsersBox(
    BuildContext context,
    TrainingRequestDynamicRequestedByUserBloc
        trainingRequestDynamicRequestedByUserBloc,
    // TrainingRequestResponseDynamicForRequestOfUserBloc
    //     trainingRequestResponseDynamicForRequestOfUserBloc,
    int appUserId,
    int appCoachId,
    double screenHeight,
    double screenWidth,
    TextStyle displayLarge,
  ) =>
      Flexible(
        flex: 1,
        child: _generateUserButton(
            context,
            trainingRequestDynamicRequestedByUserBloc,
            // trainingRequestResponseDynamicForRequestOfUserBloc,
            appUserId,
            appCoachId,
            screenHeight,
            screenWidth,
            displayLarge),
      );

  Flexible _generateCoachesBox(
    BuildContext context,
    TrainingOfferDynamicOfferedByCoachBloc
        trainingOfferDynamicOfferedByCoachBloc,
    // TrainingOfferResponseDynamicForOfferOfCoachBloc
    //     trainingOfferResponseDynamicForOfferOfCoachBloc,
    int appCoachId,
    double screenHeight,
    double screenWidth,
    TextStyle displayLarge,
  ) =>
      Flexible(
        flex: 1,
        child: _generateCoachButton(
            context,
            trainingOfferDynamicOfferedByCoachBloc,
            // trainingOfferResponseDynamicForOfferOfCoachBloc,
            appCoachId,
            screenHeight,
            screenWidth,
            displayLarge),
      );

  GestureDetector _generateUserButton(
    BuildContext context,
    TrainingRequestDynamicRequestedByUserBloc
        trainingRequestDynamicRequestedByUserBloc,
    // TrainingRequestResponseDynamicForRequestOfUserBloc
    //     trainingRequestResponseDynamicForRequestOfUserBloc,
    int appUserId,
    int appCoachId,
    double screenHeight,
    double screenWidth,
    TextStyle displayLarge,
  ) =>
      GestureDetector(
          child: _displayChoiceBoxOfUsers(
              appCoachId, screenHeight, screenWidth, displayLarge),
          onTap: () => _goToForUsersScreenScreenAndBringRequestDynamicFromDB(
              context,
              trainingRequestDynamicRequestedByUserBloc,
              // trainingRequestResponseDynamicForRequestOfUserBloc,
              appUserId));

  GestureDetector _generateCoachButton(
    BuildContext context,
    TrainingOfferDynamicOfferedByCoachBloc
        trainingOfferDynamicOfferedByCoachBloc,
    // TrainingOfferResponseDynamicForOfferOfCoachBloc
    //     trainingOfferResponseDynamicForOfferOfCoachBloc,
    int appCoachId,
    double screenHeight,
    double screenWidth,
    TextStyle displayLarge,
  ) =>
      GestureDetector(
          child: _displayChoiceBoxOfCoaches(
              screenHeight, screenWidth, displayLarge),
          onTap: () => _goToForCoachesScreenScreenAndBringOfferDynamicFromDB(
              context,
              trainingOfferDynamicOfferedByCoachBloc,
              // trainingOfferResponseDynamicForOfferOfCoachBloc,
              appCoachId));

  /// DISPLAY ==========================================================================================================
  CustomScreenStack _displayScreenStack(
    BuildContext context,
    Color backgroundColor,
  ) =>
      CustomScreenStack(
        assetImage: 'assets/images/coaching/coaching0.jpg',
        imageFilterBlurSigmaX: 0.5,
        imageFilterBlurSigmaY: 0.5,
        color: backgroundColor,
      );

  CoachingChoiceBox _displayChoiceBoxOfUsers(
    int appCoachId,
    double screenHeight,
    double screenWidth,
    TextStyle displayLarge,
  ) =>
      CoachingChoiceBox(
        height: appCoachId == 0 ? screenHeight : screenHeight / 2,
        width: screenWidth,
        boxName: 'Users',
        textStyle: displayLarge,
      );

  CoachingChoiceBox _displayChoiceBoxOfCoaches(
    double screenHeight,
    double screenWidth,
    TextStyle displayLarge,
  ) =>
      CoachingChoiceBox(
        height: screenHeight / 2,
        width: screenWidth,
        boxName: 'Coaches',
        textStyle: displayLarge,
      );

  /// METHODS ==========================================================================================================
  void _goToForUsersScreenScreenAndBringRequestDynamicFromDB(
    BuildContext context,
    TrainingRequestDynamicRequestedByUserBloc
        trainingRequestDynamicRequestedByUserBloc,
    // TrainingRequestResponseDynamicForRequestOfUserBloc
    //     trainingRequestResponseDynamicForRequestOfUserBloc,
    int appUserId,
  ) {
    //
    // _bringUserTrainingRequestFromDB(
    //     context, trainingRequestDynamicRequestedByUserBloc, appUserId);
    // _bringTrainingRequestResponseFromDB(
    //     context, trainingRequestResponseDynamicForRequestOfUserBloc, appUserId);

    _goToForUsersScreen(context);
  }

  //
  //void _bringUserTrainingRequestFromDB(
  //   BuildContext context,
  //   TrainingRequestDynamicRequestedByUserBloc
  //       trainingRequestDynamicRequestedByUserBloc,
  //   int appUserId,
  // ) =>
  //     trainingRequestDynamicRequestedByUserBloc
  //         .add(LoadTrainingRequestDynamicRequestedByUserEvent(uId: appUserId));

  //
  //void _bringTrainingRequestResponseFromDB(
  //   BuildContext context,
  //   TrainingRequestResponseDynamicForRequestOfUserBloc
  //       trainingRequestResponseDynamicForRequestOfUserBloc,
  //   int appUserId,
  // ) =>
  //     trainingRequestResponseDynamicForRequestOfUserBloc.add(
  //         LoadTrainingRequestResponseDynamicForRequestOfUserEvent(
  //             uId: appUserId));

  void _goToForCoachesScreenScreenAndBringOfferDynamicFromDB(
    BuildContext context,
    TrainingOfferDynamicOfferedByCoachBloc
        trainingOfferDynamicOfferedByCoachBloc,
    int appCoachId,
  ) {
    // _
    // bringCoachTrainingOfferFromDB(
    //     context, trainingOfferDynamicOfferedByCoachBloc, appCoachId);
    // _bringTrainingOfferResponseFromDB(
    //     context, trainingOfferResponseDynamicForOfferOfCoachBloc, appCoachId,);
    _goToForCoachsScreen(context);
  }

  //
  //void _bringCoachTrainingOfferFromDB(
  //   BuildContext context,
  //   TrainingOfferDynamicOfferedByCoachBloc
  //       trainingOfferDynamicOfferedByCoachBloc,
  //   int appCoachId,
  // ) =>
  //     trainingOfferDynamicOfferedByCoachBloc.add(
  //         LoadTrainingOfferDynamicOfferedByCoachEvent(coachId: appCoachId));

  //
  //void _bringTrainingOfferResponseFromDB(
  //   BuildContext context,
  //   TrainingOfferResponseDynamicForOfferOfCoachBloc
  //       trainingOfferResponseDynamicForOfferOfCoachBloc,
  //   int appCoachId,
  // ) =>
  //     trainingOfferResponseDynamicForOfferOfCoachBloc.add(
  //         LoadTrainingOfferResponseDynamicForOfferOfCoachEvent(
  //             coachId: appCoachId));

  void _goToForUsersScreen(BuildContext context) =>
      Navigator.of(context).pushNamed(ScreenOfUsers.routeName);

  void _goToForCoachsScreen(BuildContext context) =>
      Navigator.of(context).pushNamed(ScreenOfCoaches.routeName);
}
