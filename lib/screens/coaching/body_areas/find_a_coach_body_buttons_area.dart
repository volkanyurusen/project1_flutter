import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class FindACoachBodyButtonsArea extends StatelessWidget {
  final AppTextConstants _appTextConstants = AppTextConstants();
  final AppFeedbacks _appFeedbacks = AppFeedbacks();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final double screenWidth;

  FindACoachBodyButtonsArea({required this.screenWidth, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TrainingOfferDynamicWithDistanceByUserBloc
        trainingOfferDynamicWithDistanceByUserBloc =
        context.read<TrainingOfferDynamicWithDistanceByUserBloc>();
    final ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc
        activityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc =
        context.read<
            ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc>();
    final ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit
        activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit =
        context.read<
            ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit>();
    int appUserId = _appNumberConstants.appUserId;
    TextStyle? headlineSmall = context.textTheme.headlineSmall!;
    Color buttonColor = Theme.of(context).colorScheme.secondary;
    Color backgroundColor = Theme.of(context).colorScheme.background;

    return _createBottomButtonsArea(
        context,
        activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit,
        trainingOfferDynamicWithDistanceByUserBloc,
        activityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc,
        headlineSmall,
        buttonColor,
        backgroundColor,
        appUserId);
  }

  // CREATE ============================================================================================================
  CustomColumn _createBottomButtonsArea(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit
        activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit,
    TrainingOfferDynamicWithDistanceByUserBloc
        trainingOfferDynamicWithDistanceByUserBloc,
    ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc
        activityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc,
    TextStyle headlineSmall,
    Color buttonColor,
    Color backgroundColor,
    int appUserId,
  ) =>
      CustomColumn(
        children: [
          const CustomAppSizedBox(),
          _createBottomRowForButtons(
              context,
              activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit,
              trainingOfferDynamicWithDistanceByUserBloc,
              activityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc,
              headlineSmall,
              buttonColor,
              backgroundColor,
              appUserId),
          const CustomAppSizedBox(),
        ],
      );

  MaxSizeCustomRow _createBottomRowForButtons(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit
        activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit,
    TrainingOfferDynamicWithDistanceByUserBloc
        trainingOfferDynamicWithDistanceByUserBloc,
    ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc
        activityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc,
    TextStyle headlineSmall,
    Color buttonColor,
    Color backgroundColor,
    int appUserId,
  ) =>
      MaxSizeCustomRow(
        children: [
          _createCleanAll(context, headlineSmall),
          _displayFindACoachButton(
              context,
              activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit,
              trainingOfferDynamicWithDistanceByUserBloc,
              activityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc,
              buttonColor,
              backgroundColor,
              appUserId),
        ],
      );

  /// CLEAN ALL BUTTON =================================================================================================
  /// CREATE ===========================================================================================================
  GestureDetector _createCleanAll(BuildContext context, textStyleOfTitle) =>
      GestureDetector(
          child: _displayCleanAllDetails(textStyleOfTitle),
          onTap: () {
            _cleanAllButton(context);
          });

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayCleanAllDetails(textStyleOfTitle) =>
      AppHeaderText(textLabel: 'Clean All', textStyle: textStyleOfTitle);

  /// METHOD ===========================================================================================================
  void _cleanAllButton(BuildContext context) =>
      BlocProvider.of<CleanAllButtonOnFindACoachScreenCubit>(context,
              listen: false)
          .pressCleanAllButtonOnFindACoachScreen();

  /// FIND A COACH BUTTON ==============================================================================================
  /// DISPLAY ==========================================================================================================
  /// This function cheNotcks  a minimum of one option is chosen in all areas. If one of the options isn't chosen
  /// in an area, it warns the user by showing [_createShowDialogAboutSelection], and informing her/him that he/she has
  /// to choose at least one option in that area. If at least one option in each area has been chosen, the next page
  /// according to the user's choices by using [BLOCBUALANDAYARATILACAK] is prepared.
  ChoiceContainer _displayFindACoachButton(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit
        activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit,
    TrainingOfferDynamicWithDistanceByUserBloc
        trainingOfferDynamicWithDistanceByUserBloc,
    ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc
        activityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc,
    Color buttonColor,
    Color backgroundColor,
    int appUserId,
  ) =>
      ChoiceContainer(
          containerText: _appTextConstants.findACoach,
          buttonColor: buttonColor,
          buttonBorderColor: buttonColor,
          labelColor: backgroundColor,
          onTap: () => _pressFindACoachButton(
              context,
              activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit,
              trainingOfferDynamicWithDistanceByUserBloc,
              activityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc,
              appUserId));

  /// METHODS ==========================================================================================================
  void _pressFindACoachButton(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit
        activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit,
    TrainingOfferDynamicWithDistanceByUserBloc
        trainingOfferDynamicWithDistanceByUserBloc,
    ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc
        activityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc,
    int appUserId,
  ) {
    if (_checkActivityTypeIsNotChosen(context)) {
      _displayDialogAboutDeficientActivityType(context);
    } else if (_checkActivityNameIsNotChosen(context)) {
      _displayDialogAboutActivityName(context);
      // } else if (_checkActivityLevelIsNotChosen(context)) {
      //   _displayDialogAboutDeficientActivityLevel(context);
    } else {
      if (_checkActivityNameIsChosen(context,
          activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit)) {
        if (_checkChosenActivityNameBelongsToChosenActivityType(
            context,
            activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit,
            activityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc)) {
          _checkAnyLocationHasBeenChosenThenInitiateBringingOfferProcess(
              context,
              trainingOfferDynamicWithDistanceByUserBloc,
              appUserId,
              activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit);
        } else {
          _displayDialogAboutActivityName(context);
        }
      }
    }
  }

  // LOCATION UPDATING =================================================================================================
  // METHODS ===========================================================================================================
  void _checkAnyLocationHasBeenChosenThenInitiateBringingOfferProcess(
      BuildContext context,
      TrainingOfferDynamicWithDistanceByUserBloc
          trainingOfferDynamicWithDistanceByUserBloc,
      int appUserId,
      ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit
          activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit) {
    _checkWhetherLocationIsNotChosen(context)
        ? _createLocationUpdatingDialog(context)
        : _initiateBringingOfferProcess(
            trainingOfferDynamicWithDistanceByUserBloc,
            appUserId,
            activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit,
            context);
  }

  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherLocationIsNotChosen(BuildContext context) => context
      .read<ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit>()
      .state
      .chosenLocationDetailDynamicList
      .isEmpty;

  // LOCATION UPDATING DIALOG ==========================================================================================
  // CREATE ============================================================================================================
  Future<dynamic> _createLocationUpdatingDialog(BuildContext context) =>
      showDialog(
          context: context,
          builder: (context) {
            return _displayLocationUpdatingPopUp();
          });

  // DISPLAY ===========================================================================================================
  LocationUpdating _displayLocationUpdatingPopUp() => const LocationUpdating();

  /// METHODS ==========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkActivityTypeIsNotChosen(BuildContext context) => context
      .read<ActivityTypeDynamicButtonOnFindACoachScreenBloc>()
      .state
      .chosenActivityTypeDynamicList
      .isEmpty;

  bool _checkActivityNameIsNotChosen(BuildContext context) => context
      .read<
          ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit>()
      .state
      .chosenActivityTitleList
      .isEmpty;

  // bool _checkActivityLevelIsNotChosen(BuildContext context) => context
  //     .read<ActivityLevelDynamicButtonOnFindACoachScreenCubit>()
  //     .state
  //     .chosenActivityLevelDetailList
  //     .isEmpty;

  bool _checkActivityNameIsChosen(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit
        activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit,
  ) =>
      activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit
          .state.chosenActivityTitleList.isNotEmpty;

  bool _checkChosenActivityNameBelongsToChosenActivityType(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit
        activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit,
    ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc
        activityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc,
  ) =>
      _getAListFromActivityTitlesByChosenActivityTypeName(
              activityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc)
          .contains(_findChosenActivityTitle(
              activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit));

  /// Get Methods ------------------------------------------------------------------------------------------------------
  List<String> _getAListFromActivityTitlesByChosenActivityTypeName(
          ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc
              activityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc) =>
      activityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc
          .state.activityNameDynamicList
          .map((e) => e.activityTitle)
          .toList();

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findChosenActivityTitle(
          ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit
              activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit) =>
      activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit
          .state.chosenActivityTitleList.last;

  /// Display Methods --------------------------------------------------------------------------------------------------
  void _displayDialogAboutDeficientActivityType(BuildContext context) =>
      _createShowDialogAboutSelection(
          context, _appFeedbacks.feedbackAboutMissingOneActivityTypeChoice);

  void _displayDialogAboutActivityName(BuildContext context) =>
      _createShowDialogAboutSelection(
          context, _appFeedbacks.feedbackAboutMissingOneActivityNameChoice);

  // void _displayDialogAboutDeficientActivityLevel(BuildContext context) =>
  //     _createShowDialogAboutSelection(
  //         context, _appFeedbacks.feedbackAboutMissingOneActivityLevelChoice);

  /// INITIATE PROCESS =================================================================================================
  /// METHODS ==========================================================================================================
  void _initiateBringingOfferProcess(
      TrainingOfferDynamicWithDistanceByUserBloc
          trainingOfferDynamicWithDistanceByUserBloc,
      int appUserId,
      ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit
          activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit,
      BuildContext context) {
    _cleanTrainingOfferList(trainingOfferDynamicWithDistanceByUserBloc);
    _bringTrainingOfferListOfChosenActivity(
        trainingOfferDynamicWithDistanceByUserBloc,
        appUserId,
        activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit);
    _bringTrainingOfferResponseByUserAndChosenActivity(context,
        activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit);
    _goToResultFindACoachScreen(context);
  }

  /// GENERAL METHODS ==================================================================================================
  /// This function is showing Dialog about missing selection. [alertLabel] is information about the subject of the
  /// alert. [_createShowDialogAboutSelection] funcition returns [SelectionAlertDialog] widget which is local
  /// widget. In case the widget needs somewhere in app, it will be moved to general widget file.
  Future<dynamic> _createShowDialogAboutSelection(
    BuildContext context,
    String alertLabel,
  ) =>
      showDialog(
          context: context,
          builder: (_) => SelectionAlertDialog(alertLabel: alertLabel));

  /// Database Methods -------------------------------------------------------------------------------------------------
  void _cleanTrainingOfferList(
      TrainingOfferDynamicWithDistanceByUserBloc
          trainingOfferDynamicWithDistanceByUserBloc) {
    trainingOfferDynamicWithDistanceByUserBloc
        .add(CleanTrainingOfferDynamicWithDistanceByUser());
  }

  void _bringTrainingOfferListOfChosenActivity(
      TrainingOfferDynamicWithDistanceByUserBloc
          trainingOfferDynamicWithDistanceByUserBloc,
      int appUserId,
      ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit
          activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit) {
    trainingOfferDynamicWithDistanceByUserBloc.add(
        LoadTrainingOfferDynamicWithDistanceByUserEvent(
            userId: appUserId,
            activityTitle: _findChosenActivityTitle(
                activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit)));
  }

  void _bringTrainingOfferResponseByUserAndChosenActivity(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit
        activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit,
  ) {
    context
        .read<TrainingOfferResponseDynamicWithDistanceByChosenAttributesBloc>()
        .add(LoadTrainingOfferResponseDynamicWithDistanceByChosenAttributesEvent(
            activityTitle: _findChosenActivityTitle(
                activityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit),
            userId: _appNumberConstants.appUserId));
  }

  /// Go Other Page Methods --------------------------------------------------------------------------------------------
  void _goToResultFindACoachScreen(BuildContext context) =>
      Navigator.of(context).pushNamed(ScreenOfResultFindACoach.routeName);
}






// import 'package:flutter/material.dart';
// import 'package:my_project/constants/constants.dart';
// import 'package:my_project/logic/blocs/blocs.dart';
// import 'package:my_project/logic/cubits/cubits.dart';
// import 'package:my_project/widgets/widget.dart';

// class FindACoachBodyButtonsArea extends StatelessWidget {
//   final AppColors _appColors = AppColors();
//   final AppTextConstants _appTextConstants = AppTextConstants();
//   final AppFeedbacks _appFeedbacks = AppFeedbacks();
//   final double screenWidth;

//   FindACoachBodyButtonsArea({
//     required this.screenWidth,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     TextStyle? headlineSmall  = Theme.of(context).textTheme.headlineSmall !;
//     Color backgroundColor = Theme.of(context).colorScheme.background;

//     return CustomColumn(
//       children: [
//         const CustomAppSizedBox(),
//         _createBottomRowForButtons(context, headlineSmall , backgroundColor),
//         const CustomAppSizedBox(height: 30),
//       ],
//     );
//   }

//   CustomRow _createBottomRowForButtons(
//     BuildContext context,
//     TextStyle headlineSmall ,
//     Color backgroundColor,
//   ) {
//     return CustomRow(
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         _displayCancelButton(context, headlineSmall , backgroundColor),
//         _disoplayOfferButton(context, headlineSmall , backgroundColor),
//       ],
//     );
//   }

//   /// DISPLAY ==========================================================================================================
//   CustomElevatedButton _displayCancelButton(
//     BuildContext context,
//     TextStyle headlineSmall ,
//     Color backgroundColor,
//   ) =>
//       CustomElevatedButton(
//           textlabel: _appTextConstants.cancel,
//           textStyle: headlineSmall .copyWith(color: backgroundColor),
//           elevatedButtonWidth: MediaQuery.of(context).size.width * 0.90 * 0.34,
//           buttonColor: _appColors.buttonDarkColor,
//           onPressed: () => _clickCancelButton(context));

//   CustomElevatedButton _disoplayOfferButton(
//     BuildContext context,
//     TextStyle headlineSmall ,
//     Color backgroundColor,
//   ) =>
//       CustomElevatedButton(
//           textlabel: _appTextConstants.offer,
//           textStyle: headlineSmall .copyWith(color: backgroundColor),
//           elevatedButtonWidth: MediaQuery.of(context).size.width * 0.90 * 0.34,
//           buttonColor: _appColors.secondary,
//           onPressed: () => _clickOfferButton(context));

//   /// METHODS ==========================================================================================================
//   /// Cancel Method ----------------------------------------------------------------------------------------------------
//   void _clickCancelButton(BuildContext context) {
//     if (_checkActivityTypeIsChosen(context)) {
//       _unchooseChosenActivityType(context);
//     }
//     if (_checkActivityNameIsChosen(context)) {
//       _unchooseChosenActivityName(context);
//     }
//     if (_checkActivityLevelIsChosen(context)) {
//       _unchooseChosenActivityLevel(context);
//     }
//     _closePopUp(context);
//   }

//   /// Offer Method ---------------------------------------------------------------------------------------------------
//   void _clickOfferButton(BuildContext context) {
//     if (_checkActivityTypeIsNotChosen(context)) {
//       _displayDialogAboutDeficientActivityType(context);
//     } else if (_checkActivityNameIsNotChosen(context)) {
//       _displayDialogAboutActivityName(context);
//     } else if (_checkActivityLevelIsNotChosen(context)) {
//       _displayDialogAboutDeficientActivityLevel(context);
//     } else {
//       if (_checkActivityNameIsChosen(context)) {
//         if (_checkWhetherChosenActivityNameBelongsToActivityType(context)) {
//           _correctChoice(context);
//         } else {
//           _wrongChoice(context);
//           _displayDialogAboutActivityName(context);
//         }
//       }
//     }
//     //
//     // ?ADDING Offer codes will be here!!!The below code will close the page after adding training Offer.
//     // Navigator.of(
//     //         context)
//     //     .pop();
//   }

//   void _correctChoice(BuildContext context) => print(
//       '''ActivityNameDynamicByActivityTypeDynamicList: ${context.read<ActivityNameDynamicByActivityTypeDynamicOnFindACoachBloc>().state.activityNameDynamicList.map((e) => e.activityTitle).toList()} and chosenActivityTitleList is: ${context.read<ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachCubit>().state.chosenActivityTitleList[0]} ARE EQUAL''');

//   void _wrongChoice(BuildContext context) => print(
//       '''ActivityNameDynamicByActivityTypeDynamicList: ${context.read<ActivityNameDynamicByActivityTypeDynamicOnFindACoachBloc>().state.activityNameDynamicList.map((e) => e.activityTitle).toList()} and chosenActivityTitleList is: ${context.read<ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachCubit>().state.chosenActivityTitleList[0]} ARE NOT EQUAL''');

//   /// Clear method -----------------------------------------------------------------------------------------------------
//   void _unchooseChosenActivityType(BuildContext context) => context
//       .read<ActivityTypeDynamicButtonOnFindACoachBloc>()
//       .state
//       .chosenActivityTypeDynamicList
//       .clear();

//   void _unchooseChosenActivityName(BuildContext context) => context
//       .read<
//           ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachCubit>()
//       .state
//       .chosenActivityTitleList
//       .clear();

//   void _unchooseChosenActivityLevel(BuildContext context) => context
//       .read<ActivityLevelDynamicButtonOnFindACoachCubit>()
//       .state
//       .chosenActivityLevelDetailList
//       .clear();

//   /// Check Method -----------------------------------------------------------------------------------------------------
//   bool _checkActivityTypeIsChosen(BuildContext context) => context
//       .read<ActivityTypeDynamicButtonOnFindACoachBloc>()
//       .state
//       .chosenActivityTypeDynamicList
//       .isNotEmpty;

//   bool _checkActivityNameIsChosen(BuildContext context) => context
//       .read<
//           ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachCubit>()
//       .state
//       .chosenActivityTitleList
//       .isNotEmpty;

//   bool _checkActivityLevelIsChosen(BuildContext context) => context
//       .read<ActivityLevelDynamicButtonOnFindACoachCubit>()
//       .state
//       .chosenActivityLevelDetailList
//       .isNotEmpty;

//   bool _checkActivityTypeIsNotChosen(BuildContext context) => context
//       .read<ActivityTypeDynamicButtonOnFindACoachBloc>()
//       .state
//       .chosenActivityTypeDynamicList
//       .isEmpty;

//   bool _checkActivityNameIsNotChosen(BuildContext context) => context
//       .read<
//           ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachCubit>()
//       .state
//       .chosenActivityTitleList
//       .isEmpty;

//   bool _checkActivityLevelIsNotChosen(BuildContext context) => context
//       .read<ActivityLevelDynamicButtonOnFindACoachCubit>()
//       .state
//       .chosenActivityLevelDetailList
//       .isEmpty;

//   bool _checkWhetherChosenActivityNameBelongsToActivityType(
//     BuildContext context,
//   ) =>
//       context
//           .read<
//               ActivityNameDynamicByActivityTypeDynamicOnFindACoachBloc>()
//           .state
//           .activityNameDynamicList
//           .map((e) => e.activityTitle)
//           .toList()
//           .contains(context
//               .read<
//                   ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachCubit>()
//               .state
//               .chosenActivityTitleList[0]);

//   /// SHOW DIALOGS =====================================================================================================
//   /// This function is showing Dialog about missing selection. [alertLabel] is information about the subject of the
//   /// alert. [_createShowDialogAboutSelection] funcition returns [SelectionAlertDialog] widget which is local
//   /// widget. In case the widget needs somewhere in app, it will be moved to general widget file.
//   Future<dynamic> _createShowDialogAboutSelection(
//     BuildContext context,
//     String alertLabel,
//   ) =>
//       showDialog(
//           context: context,
//           builder: (_) => SelectionAlertDialog(alertLabel: alertLabel));

//   Future<dynamic> _displayDialogAboutDeficientActivityType(
//           BuildContext context) =>
//       _createShowDialogAboutSelection(
//           context, _appFeedbacks.feedbackAboutMissingOneActivityTypeChoice);

//   Future<dynamic> _displayDialogAboutActivityName(BuildContext context) =>
//       _createShowDialogAboutSelection(
//           context, _appFeedbacks.feedbackAboutMissingOneActivityNameChoice);

//   Future<dynamic> _displayDialogAboutDeficientActivityLevel(
//           BuildContext context) =>
//       _createShowDialogAboutSelection(
//           context, _appFeedbacks.feedbackAboutMissingOneActivityLevelChoice);

//   /// Screen Method ----------------------------------------------------------------------------------------------------
//   void _closePopUp(BuildContext context) => Navigator.of(context).pop();
// }