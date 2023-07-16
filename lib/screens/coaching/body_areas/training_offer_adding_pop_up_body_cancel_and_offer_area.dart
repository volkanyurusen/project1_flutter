import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/activity_name_dynamic.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/screens/profile/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class TrainingOfferAddingPopUpBodyCancelAndOfferArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppTextConstants _appTextConstants = AppTextConstants();
  final AppFeedbacks _appFeedbacks = AppFeedbacks();
  final AppTimeConstants _appTimeConstants = AppTimeConstants();

  final double screenWidth;

  TrainingOfferAddingPopUpBodyCancelAndOfferArea(
      {required this.screenWidth, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? headlineSmall = Theme.of(context).textTheme.headlineSmall!;
    Color backgroundColor = Theme.of(context).colorScheme.background;

    return _createBottomButtonsArea(context, headlineSmall, backgroundColor);
  }

  // CREATE ============================================================================================================
  Column _createBottomButtonsArea(
    BuildContext context,
    TextStyle headlineSmall,
    Color backgroundColor,
  ) {
    return Column(
      children: [
        const CustomAppSizedBox(height: 30),
        _createBottomRowForButtons(context, headlineSmall, backgroundColor),
        const CustomAppSizedBox(),
      ],
    );
  }

  CustomRow _createBottomRowForButtons(
    BuildContext context,
    TextStyle headlineSmall,
    Color backgroundColor,
  ) =>
      CustomRow(
        mainAxisSize: MainAxisSize.max,
        children: [
          _displayCancelButton(context, headlineSmall, backgroundColor),
          _displayOfferButton(context, headlineSmall, backgroundColor),
        ],
      );

  // CANCEL BUTTON =====================================================================================================
  /// DISPLAY ==========================================================================================================
  CustomElevatedButton _displayCancelButton(
    BuildContext context,
    TextStyle headlineSmall,
    Color backgroundColor,
  ) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.cancel,
          textStyle: headlineSmall.copyWith(color: backgroundColor),
          elevatedButtonWidth: context.width * 0.90 * 0.34,
          buttonColor: _appColors.buttonDarkColor,
          onPressed: () {
            _initiateCancelProcess(context);
          });

  /// METHODS ==========================================================================================================
  /// Cancel Method ----------------------------------------------------------------------------------------------------
  void _initiateCancelProcess(BuildContext context) {
    if (_checkActivityTypeIsChosen(context)) {
      _unchooseChosenActivityType(context);
    }
    if (_checkActivityNameIsChosen(context)) {
      _unchooseChosenActivityName(context);
    }
    _closeTheScreen(context);
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkActivityTypeIsChosen(BuildContext context) => context
      .read<ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpBloc>()
      .state
      .chosenActivityTypeDynamicList
      .isNotEmpty;

  bool _checkActivityNameIsChosen(BuildContext context) => context
      .read<
          ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingOfferAddingPopUpCubit>()
      .state
      .chosenActivityTitleList
      .isNotEmpty;


  /// Clear method -----------------------------------------------------------------------------------------------------
  void _unchooseChosenActivityType(BuildContext context) => context
      .read<ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpBloc>()
      .state
      .chosenActivityTypeDynamicList
      .clear();

  void _unchooseChosenActivityName(BuildContext context) => context
      .read<
          ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingOfferAddingPopUpCubit>()
      .state
      .chosenActivityTitleList
      .clear();


  // OFFER BUTTON =====================================================================================================
  /// DISPLAY ==========================================================================================================
  CustomElevatedButton _displayOfferButton(
    BuildContext context,
    TextStyle headlineSmall,
    Color backgroundColor,
  ) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.offer,
          textStyle: headlineSmall.copyWith(color: backgroundColor),
          elevatedButtonWidth: context.width * 0.90 * 0.34,
          buttonColor: _appColors.secondary,
          onPressed: () {
            _clickOfferButton(context);
          });

  /// METHODS ==========================================================================================================
  /// Offer Method ---------------------------------------------------------------------------------------------------
  void _clickOfferButton(BuildContext context) {
    if (_checkActivityTypeIsNotChosen(context)) {
      _displayDialogAboutDeficientActivityType(context);
    } else if (_checkActivityNameIsNotChosen(context)) {
      _displayDialogAboutActivityName(context);
    } else {
      if (_checkActivityNameIsChosen(context)) {
        if (_checkWhetherChosenActivityNameBelongsToActivityType(context)) {
          _checkAnyLocationHasBeenChosenThenInitiateAddingTrainingOfferProcess(
              context);
        } else {
          _displayDialogAboutActivityName(context);
        }
      }
    }
  }

  // LOCATION UPDATING =================================================================================================
  // METHODS ===========================================================================================================
  void _checkAnyLocationHasBeenChosenThenInitiateAddingTrainingOfferProcess(
      BuildContext context) {
    _checkWhetherLocationIsNotChosen(context)
        ? _createLocationUpdatingDialog(context)
        : _initiateAddingOfferProcess(context);
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

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkActivityTypeIsNotChosen(BuildContext context) => context
      .read<ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpBloc>()
      .state
      .chosenActivityTypeDynamicList
      .isEmpty;

  bool _checkActivityNameIsNotChosen(BuildContext context) => context
      .read<
          ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingOfferAddingPopUpCubit>()
      .state
      .chosenActivityTitleList
      .isEmpty;

  bool _checkWhetherChosenActivityNameBelongsToActivityType(
    BuildContext context,
  ) =>
      context
          .read<
              ActivityNameDynamicByActivityTypeDynamicOnTrainingOfferAddingPopUpBloc>()
          .state
          .activityNameDynamicList
          .map((e) => e.activityTitle)
          .toList()
          .contains(_findActivityTitle(context));

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findActivityTitle(BuildContext context) => context
      .read<
          ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingOfferAddingPopUpCubit>()
      .state
      .chosenActivityTitleList[0];

  /// Dialog Methods ---------------------------------------------------------------------------------------------------
  Future<dynamic> _displayDialogAboutDeficientActivityType(
          BuildContext context) =>
      _createShowDialogAboutSelection(
          context, _appFeedbacks.feedbackAboutMissingOneActivityTypeChoice);

  Future<dynamic> _displayDialogAboutActivityName(BuildContext context) =>
      _createShowDialogAboutSelection(
          context, _appFeedbacks.feedbackAboutMissingOneActivityNameChoice);

  // ADDING METHODS ====================================================================================================
  void _initiateAddingOfferProcess(BuildContext context) {
    _bringChosenTrainingDetailFromDB(context);
    _displayOfferDialog(context);
  }

  // DISPLAY ===========================================================================================================
  Future<dynamic> _displayOfferDialog(BuildContext context) => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return _checkWhetherCoachingLimitOfOfferIsExceeded(context)
            ? _createUpdateCoachingTypePopUp(context)
            : _buildOfferPopUp(context);
      });

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherCoachingLimitOfOfferIsExceeded(BuildContext context) =>
      _findNumberOfExistingOffers(context) >= _findLimitOfOffer(context);

  // Find Methods ------------------------------------------------------------------------------------------------------
  int _findNumberOfExistingOffers(BuildContext context) => context
      .read<TrainingOfferDynamicOfferedByCoachBloc>()
      .state
      .trainingOfferDynamicList
      .length;

  int _findLimitOfOffer(BuildContext context) => context
      .read<CoachDynamicBloc>()
      .state
      .coachDynamicList
      .last
      .coachingTypeDynamic
      .creatingTrainingLimitPerDay;

  // UPDATE COACHING TYPE POP UP =======================================================================================
  // CREATE ===========================================================================================================
  ActionPopUp _createUpdateCoachingTypePopUp(BuildContext context) =>
      ActionPopUp(
          titleContent: _displayContentOfPopUp,
          action: 'Update',
          actionVoidCallBack: () {
            _closeThePopUpAndGoToCoachingTypeDetailScreen(context);
          },
          cancelVoidCallBack: () {});

  // DISPLAY ===========================================================================================================
  String get _displayContentOfPopUp =>
      'You have reached your daily limit creating offer. In order to offer more training, please update your coaching type';

  // OFFER POP UP ======================================================================================================
  // BUILD =============================================================================================================
  BlocBuilder<TrainingDetailDynamicByChosenAttributesBloc,
      TrainingDetailDynamicByChosenAttributesState> _buildOfferPopUp(
          BuildContext context) =>
      BlocBuilder<TrainingDetailDynamicByChosenAttributesBloc,
          TrainingDetailDynamicByChosenAttributesState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.initial:
              return DBProcessLoader();
            case Status.loading:
              return DBProcessLoader();
            case Status.success:
              return _displayActionPopUp(context, state);
            case Status.failure:
              return StateError(error: state.error);
          }
        },
      );

  // DISLAY ===========================================================================================================
  ActionPopUp _displayActionPopUp(
    BuildContext context,
    TrainingDetailDynamicByChosenAttributesState state,
  ) =>
      ActionPopUp(
        titleContent: 'Offer the Activity?',
        action: 'Offer',
        actionVoidCallBack: () {
          _initiateAddingProcess(context, state);
        },
        cancelVoidCallBack: () {},
      );

  // ADDING METHODS ====================================================================================================
  dynamic _initiateAddingProcess(
    BuildContext context,
    TrainingDetailDynamicByChosenAttributesState state,
  ) async {
    _bringChosenTrainingOfferDynamicByChosennAttributesFromDB(context, state);
    _displayOfferTheTrainingDialog(context);
  }

  // DISPLAY ===========================================================================================================
  Future<dynamic> _displayOfferTheTrainingDialog(
    BuildContext context,
  ) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return _listenChosenTrainingOfferBroughtFromDB();
          });

  // LISTEN ============================================================================================================
  BlocListener<TrainingOfferDynamicByChosenAttributesBloc,
          TrainingOfferDynamicByChosenAttributesState>
      _listenChosenTrainingOfferBroughtFromDB() => BlocListener<
              TrainingOfferDynamicByChosenAttributesBloc,
              TrainingOfferDynamicByChosenAttributesState>(
            listenWhen: (previous, current) =>
                _checkWhetherTrainingOfferBroughtSuccessfully(current),
            listener: (context, state) {
              _whetherChosenOfferHasNotBeenOfferedBefore(state)
                  ? _sendCreatingRequestForTheChosenTraining(context)
                  : _whetherChosenOfferIsStillActive(state)
                      ? _createExistenceDialog(context)
                      : _sendUpdatingRequestForTheChosenTraining(context);
            },
            child: _buildChosenTrainingOfferBroughtFromDB(),
          );

  // DISPLAY ===========================================================================================================
  void _createExistenceDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => _displayInformationOfExistenceDialog());
  }

  InformationOfExistenceAlertDialog _displayInformationOfExistenceDialog() =>
      const InformationOfExistenceAlertDialog(
          detail: 'training', pageNumberThatWillBeClosed: 3);

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherTrainingOfferBroughtSuccessfully(
          TrainingOfferDynamicByChosenAttributesState current) =>
      current.status == Status.success;

  bool _whetherChosenOfferHasNotBeenOfferedBefore(
          TrainingOfferDynamicByChosenAttributesState state) =>
      state.trainingOfferDynamicList.isEmpty;

  bool _whetherChosenOfferIsStillActive(
          TrainingOfferDynamicByChosenAttributesState state) =>
      state.trainingOfferDynamicList.last.isActive == true;

  // BUILD =============================================================================================================
  BlocBuilder<TrainingOfferDynamicByChosenAttributesBloc,
          TrainingOfferDynamicByChosenAttributesState>
      _buildChosenTrainingOfferBroughtFromDB() => BlocBuilder<
              TrainingOfferDynamicByChosenAttributesBloc,
              TrainingOfferDynamicByChosenAttributesState>(
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return DBProcessLoader();
                case Status.loading:
                  return DBProcessLoader();
                case Status.success:
                  return _initiateProcess(context, state);
                case Status.failure:
                  return StateError(error: state.error);
              }
            },
          );

  // METHODS ===========================================================================================================
  Widget _initiateProcess(
    BuildContext context,
    TrainingOfferDynamicByChosenAttributesState state,
  ) {
    if (_whetherChosenOfferHasNotBeenOfferedBefore(state)) {
      _cleanAllButton(context);
      return _listenTrainingOfferBroughtFromDB();
    } else {
      if (_whetherChosenOfferIsStillActive(state)) {
        return const SizedBox();
      } else {
        _cleanAllButton(context);
        return _listenTrainingOfferBroughtFromDB();
      }
    }
  }

  // Clean Methods -----------------------------------------------------------------------------------------------------
  void _cleanAllButton(BuildContext context) {
    _unchooseChosenActivityType(context);
    _unchooseChosenActivityName(context);
  }

  // LISTEN ============================================================================================================
  BlocListener<TrainingOfferBloc, TrainingOfferState>
      _listenTrainingOfferBroughtFromDB() =>
          BlocListener<TrainingOfferBloc, TrainingOfferState>(
            listenWhen: (previous, current) =>
                _checkWhetherTrainingOfferInsertBroughtSuccessfully(current),
            listener: (context, state) {
              _recallTrainingOfferDynamicOfferedByCoachBloc(context);
            },
            child: _buildTrainingOffer(),
          );

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  _checkWhetherTrainingOfferInsertBroughtSuccessfully(
    TrainingOfferState current,
  ) =>
      current.status == Status.success;

  // BUILD =============================================================================================================
  BlocBuilder<TrainingOfferBloc, TrainingOfferState> _buildTrainingOffer() =>
      BlocBuilder<TrainingOfferBloc, TrainingOfferState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.initial:
              return DBProcessLoader();
            case Status.loading:
              return DBProcessLoader();
            case Status.success:
              return _initiateEndingProcess(context);
            case Status.failure:
              return StateError(error: state.error);
          }
        },
      );

  // END METHODS =======================================================================================================
  LoadSuccessfullyAlertDialog _initiateEndingProcess(BuildContext context) {
    _closeTheScreenWithDelaying(context);
    return _displayLoadSuccessfullyDialog();
  }

  // DISPLAY ===========================================================================================================
  LoadSuccessfullyAlertDialog _displayLoadSuccessfullyDialog() =>
      const LoadSuccessfullyAlertDialog(
          content:
              'The process which you chose has been completed without any mistake');

  // GENERAL METHODS ===================================================================================================
  /// Get Method ----------------------------------------------------------------------------------------------------
  Iterable<ActivityNameDynamic> _getChosenActivity(BuildContext context) =>
      context
          .read<ActivityNameDynamicBloc>()
          .state
          .activityNameDynamicList
          .where((element) =>
              element.activityTitle == _chosenActivityTitle(context));


  // Chosen Methods ----------------------------------------------------------------------------------------------------
  String _chosenActivityTitle(BuildContext context) => context
      .read<
          ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingOfferAddingPopUpCubit>()
      .state
      .chosenActivityTitleList
      .last;

  // Find Methods ------------------------------------------------------------------------------------------------------
  int _findTrainingDetailIdForCreating(BuildContext context) => context
      .read<TrainingDetailDynamicByChosenAttributesBloc>()
      .state
      .trainingDetailDynamicList
      .last
      .trainingDetailId!;

  int _findTrainingDetailId(
          TrainingDetailDynamicByChosenAttributesState state) =>
      state.trainingDetailDynamicList.last.trainingDetailId!;

  int _findChosenActivityNameId(BuildContext context) =>
      _getChosenActivity(context).first.activityNameId!;


  int get _findCoachId => _appNumberConstants.appCoachId;

  int? _findTrainingOfferIdForUpdating(BuildContext context) => context
      .read<TrainingOfferDynamicByChosenAttributesBloc>()
      .state
      .trainingOfferDynamicList
      .last
      .trainingOfferId;

  int _findTrainingDetailIdForUpdating(BuildContext context) => context
      .read<TrainingOfferDynamicByChosenAttributesBloc>()
      .state
      .trainingOfferDynamicList
      .last
      .trainingDetailDynamic
      .trainingDetailId!;

  int _findCoachingLocationDetailId(BuildContext context) => 45;

  DateTime _findCreatedAtForUpdating(BuildContext context) => context
      .read<TrainingOfferDynamicByChosenAttributesBloc>()
      .state
      .trainingOfferDynamicList
      .last
      .createdAt;

  DateTime _findDateTimeNow() => DateTime.now();

  /// SHOW DIALOGS =====================================================================================================
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

  // Database Methods --------------------------------------------------------------------------------------------------
  void _bringChosenTrainingDetailFromDB(BuildContext context) {
    context
        .read<TrainingDetailDynamicByChosenAttributesBloc>()
        .add(LoadTrainingDetailDynamicByChosenAttributesEvent(
          activityNameId: _findChosenActivityNameId(context),
         
        ));
  }

  void _bringChosenTrainingOfferDynamicByChosennAttributesFromDB(
      BuildContext context,
      TrainingDetailDynamicByChosenAttributesState state) {
    context
        .read<TrainingOfferDynamicByChosenAttributesBloc>()
        .add(LoadTrainingOfferDynamicByChosenAttributesEvent(
          coachId: _findCoachId,
          trainingDetailId: _findTrainingDetailId(state),
          coachingLocationDetailId: _findCoachingLocationDetailId(context),
        ));
  }

  void _sendCreatingRequestForTheChosenTraining(BuildContext context) {
    context.read<TrainingOfferBloc>().add(AddTrainingOfferEvent(
        trainingOffer: _createTrainingOfferInstance(context)));
  }

  void _sendUpdatingRequestForTheChosenTraining(BuildContext context) {
    context.read<TrainingOfferBloc>().add(UpdateTrainingOfferEvent(
        trainingOffer: _updateTrainingOfferInstance(context)));
  }

  void _recallTrainingOfferDynamicOfferedByCoachBloc(BuildContext context) {
    context
        .read<TrainingOfferDynamicOfferedByCoachBloc>()
        .add(RecallTrainingOfferDynamicOfferedByCoachEvent());
    context.read<TrainingOfferDynamicOfferedByCoachBloc>().add(
        LoadTrainingOfferDynamicOfferedByCoachEvent(
            coachId: _findCoachId, offset: 0));
  }

  // Create Model Instance ---------------------------------------------------------------------------------------------
  TrainingOffer _createTrainingOfferInstance(BuildContext context) {
    final TrainingOffer trainingOffer = TrainingOffer(
      coachId: _findCoachId,
      trainingDetailId: _findTrainingDetailIdForCreating(context),
      coachingLocationDetailId: 45,
      createdAt: _findDateTimeNow(),
    );
    return trainingOffer;
  }

  TrainingOffer _updateTrainingOfferInstance(BuildContext context) {
    final TrainingOffer trainingOffer = TrainingOffer(
      trainingOfferId: _findTrainingOfferIdForUpdating(context),
      coachId: _findCoachId,
      trainingDetailId: _findTrainingDetailIdForUpdating(context),
      coachingLocationDetailId: 45,
      createdAt: _findCreatedAtForUpdating(context),
      updatedAt: _findDateTimeNow(),
      isActive: true,
    );
    return trainingOffer;
  }

  /// Screen Method ----------------------------------------------------------------------------------------------------
  void _closeThePopUpAndGoToCoachingTypeDetailScreen(BuildContext context) {
    _closeTheScreen(context);
    _goToCoachingTypeDetailScreen(context);
  }

  void _closeTheScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _goToCoachingTypeDetailScreen(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenOfCoachingTypeDetails.routeName);
  }

  void _closeTheScreenWithDelaying(BuildContext context) {
    Future.delayed(_appTimeConstants.timeOutDuration, () {
      _closePopUp(context);
    });
  }

  void _closePopUp(BuildContext context) {
    int pageCount = 0;
    Navigator.of(context).popUntil((_) => pageCount++ >= 3);
  }
}
