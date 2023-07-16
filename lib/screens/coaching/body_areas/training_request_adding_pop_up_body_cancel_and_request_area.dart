// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/activity_name_dynamic.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/screens/profile/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class TrainingRequestAddingPopUpBodyCancelAndRequestArea
    extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppTextConstants _appTextConstants = AppTextConstants();
  final AppFeedbacks _appFeedbacks = AppFeedbacks();
  final AppTimeConstants _appTimeConstants = AppTimeConstants();

  final double screenWidth;

  TrainingRequestAddingPopUpBodyCancelAndRequestArea(
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
          _displayRequestButton(context, headlineSmall, backgroundColor),
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
      .read<ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpBloc>()
      .state
      .chosenActivityTypeDynamicList
      .isNotEmpty;

  bool _checkActivityNameIsChosen(BuildContext context) => context
      .read<
          ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUpCubit>()
      .state
      .chosenActivityTitleList
      .isNotEmpty;

  /// Clear method -----------------------------------------------------------------------------------------------------
  void _unchooseChosenActivityType(BuildContext context) => context
      .read<ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpBloc>()
      .state
      .chosenActivityTypeDynamicList
      .clear();

  void _unchooseChosenActivityName(BuildContext context) => context
      .read<
          ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUpCubit>()
      .state
      .chosenActivityTitleList
      .clear();


  // Request BUTTON =====================================================================================================
  /// DISPLAY ==========================================================================================================
  CustomElevatedButton _displayRequestButton(
    BuildContext context,
    TextStyle headlineSmall,
    Color backgroundColor,
  ) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.request,
          textStyle: headlineSmall.copyWith(color: backgroundColor),
          elevatedButtonWidth: context.width * 0.90 * 0.34,
          buttonColor: _appColors.secondary,
          onPressed: () {
            _clickRequestButton(context);
          });

  /// METHODS ==========================================================================================================
  /// Request Method ---------------------------------------------------------------------------------------------------
  void _clickRequestButton(BuildContext context) {
    if (_checkActivityTypeIsNotChosen(context)) {
      _displayDialogAboutDeficientActivityType(context);
    } else if (_checkActivityNameIsNotChosen(context)) {
      _displayDialogAboutActivityName(context);
    } else {
      if (_checkActivityNameIsChosen(context)) {
        if (_checkWhetherChosenActivityNameBelongsToActivityType(context)) {
          _checkAnyLocationHasBeenChosenThenInitiateAddingTrainingRequestProcess(
              context);
        } else {
          _displayDialogAboutActivityName(context);
        }
      }
    }
  }

  // LOCATION UPDATING =================================================================================================
  // METHODS ===========================================================================================================
  void _checkAnyLocationHasBeenChosenThenInitiateAddingTrainingRequestProcess(
      BuildContext context) {
    _checkWhetherLocationIsNotChosen(context)
        ? _createLocationUpdatingDialog(context)
        : _initiateAddingRequestProcess(context);
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

  // METHODS ===========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkActivityTypeIsNotChosen(BuildContext context) => context
      .read<ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpBloc>()
      .state
      .chosenActivityTypeDynamicList
      .isEmpty;

  bool _checkActivityNameIsNotChosen(BuildContext context) => context
      .read<
          ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUpCubit>()
      .state
      .chosenActivityTitleList
      .isEmpty;

  bool _checkWhetherChosenActivityNameBelongsToActivityType(
    BuildContext context,
  ) =>
      context
          .read<
              ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpBloc>()
          .state
          .activityNameDynamicList
          .map((e) => e.activityTitle)
          .toList()
          .contains(_findActivityTitle(context));

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findActivityTitle(BuildContext context) => context
      .read<
          ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUpCubit>()
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
  void _initiateAddingRequestProcess(BuildContext context) {
    _bringChosenTrainingDetailFromDB(context);
    _displayRequestDialog(context);
  }

  // DISPLAY ===========================================================================================================
  Future<dynamic> _displayRequestDialog(BuildContext context) => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return _checkWhetherMemberhsipLimitOfRequestIsExceeded(context)
            ? _createUpdateMembershipTypePopUp(context)
            : _buildRequestPopUp(context);
      });

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherMemberhsipLimitOfRequestIsExceeded(BuildContext context) =>
      _findNumberOfExistingRequests(context) >= _findLimitOfRequest(context);

  // Find Methods ------------------------------------------------------------------------------------------------------
  int _findNumberOfExistingRequests(BuildContext context) => context
      .read<TrainingRequestDynamicRequestedByUserBloc>()
      .state
      .trainingRequestDynamicList
      .length;

  int _findLimitOfRequest(BuildContext context) => context
      .read<UserDynamicBloc>()
      .state
      .userDynamicList
      .last
      .membershipTypeDynamic
      .limitOfCreatingActivityPerDay;

  // UPDATE MEMBERSHIP TYPE POP UP =====================================================================================
  // CREATE ===========================================================================================================
  ActionPopUp _createUpdateMembershipTypePopUp(BuildContext context) =>
      ActionPopUp(
          titleContent: _displayContentOfPopUp,
          action: 'Update',
          actionVoidCallBack: () {
            _closeThePopUpAndGoToMembershipTypeDetailScreen(context);
          },
          cancelVoidCallBack: () {});

  // DISPLAY ===========================================================================================================
  String get _displayContentOfPopUp =>
      'You have reached your daily limit creating request. In order to request more training, please update your membership type';

  // REQUEST POP UP ====================================================================================================
  // BUILD =============================================================================================================
  BlocBuilder<TrainingDetailDynamicByChosenAttributesBloc,
      TrainingDetailDynamicByChosenAttributesState> _buildRequestPopUp(
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
        titleContent: 'Request the Activity?',
        action: 'Request',
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
    _bringChosenTrainingRequestDynamicByChosennAttributesFromDB(context, state);
    _displayRequestTheTrainingDialog(context);
  }

  // DISPLAY ===========================================================================================================
  Future<dynamic> _displayRequestTheTrainingDialog(
    BuildContext context,
  ) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return _listenChosenTrainingRequestBroughtFromDB();
          });

  // LISTEN ============================================================================================================
  BlocListener<TrainingRequestDynamicByChosenAttributesBloc,
          TrainingRequestDynamicByChosenAttributesState>
      _listenChosenTrainingRequestBroughtFromDB() => BlocListener<
              TrainingRequestDynamicByChosenAttributesBloc,
              TrainingRequestDynamicByChosenAttributesState>(
            listenWhen: (previous, current) =>
                _checkWhetherTrainingRequestBroughtSuccessfully(current),
            listener: (context, state) {
              _whetherChosenRequestHasNotBeenRequestedBefore(state)
                  ? _sendCreatingRequestForTheChosenTraining(context)
                  : _whetherChosenRequestIsStillActive(state)
                      ? _createExistenceDialog(context)
                      : _sendUpdatingRequestForTheChosenTraining(context);
            },
            child: _buildChosenTrainingRequestBroughtFromDB(),
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
  bool _checkWhetherTrainingRequestBroughtSuccessfully(
          TrainingRequestDynamicByChosenAttributesState current) =>
      current.status == Status.success;

  bool _whetherChosenRequestHasNotBeenRequestedBefore(
          TrainingRequestDynamicByChosenAttributesState state) =>
      state.trainingRequestDynamicList.isEmpty;

  bool _whetherChosenRequestIsStillActive(
          TrainingRequestDynamicByChosenAttributesState state) =>
      state.trainingRequestDynamicList.last.isActive == true;

  // BUILD =============================================================================================================
  BlocBuilder<TrainingRequestDynamicByChosenAttributesBloc,
          TrainingRequestDynamicByChosenAttributesState>
      _buildChosenTrainingRequestBroughtFromDB() => BlocBuilder<
              TrainingRequestDynamicByChosenAttributesBloc,
              TrainingRequestDynamicByChosenAttributesState>(
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
    TrainingRequestDynamicByChosenAttributesState state,
  ) {
    if (_whetherChosenRequestHasNotBeenRequestedBefore(state)) {
      _cleanAllButton(context);
      return _listenTrainingRequestBroughtFromDB();
    } else {
      if (_whetherChosenRequestIsStillActive(state)) {
        return const SizedBox();
      } else {
        _cleanAllButton(context);
        return _listenTrainingRequestBroughtFromDB();
      }
    }
  }

  // Clean Methods -----------------------------------------------------------------------------------------------------
  void _cleanAllButton(BuildContext context) {
    _unchooseChosenActivityType(context);
    _unchooseChosenActivityName(context);
  }

  // LISTEN ============================================================================================================
  BlocListener<TrainingRequestBloc, TrainingRequestState>
      _listenTrainingRequestBroughtFromDB() =>
          BlocListener<TrainingRequestBloc, TrainingRequestState>(
            listenWhen: (previous, current) =>
                _checkWhetherTrainingRequestInsertBroughtSuccessfully(current),
            listener: (context, state) {
              _recallTrainingRequestDynamicRequestedByUserBloc(context);
            },
            child: _buildTrainingRequest(),
          );

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  _checkWhetherTrainingRequestInsertBroughtSuccessfully(
    TrainingRequestState current,
  ) =>
      current.status == Status.success;

  // BUILD =============================================================================================================
  BlocBuilder<TrainingRequestBloc, TrainingRequestState>
      _buildTrainingRequest() =>
          BlocBuilder<TrainingRequestBloc, TrainingRequestState>(
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
          ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUpCubit>()
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

  int _findLocationDetailIdForCreating(BuildContext context) => context
      .read<ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit>()
      .state
      .chosenLocationDetailDynamicList
      .last
      .locationDetailId!;

  int _findTrainingDetailId(
          TrainingDetailDynamicByChosenAttributesState state) =>
      state.trainingDetailDynamicList.last.trainingDetailId!;

  int _findChosenActivityNameId(BuildContext context) =>
      _getChosenActivity(context).first.activityNameId!;

  int get _findTrainingRequesterId => _appNumberConstants.appUserId;

  int? _findTrainingRequestIdForUpdating(BuildContext context) => context
      .read<TrainingRequestDynamicByChosenAttributesBloc>()
      .state
      .trainingRequestDynamicList
      .last
      .trainingRequestId;

  int _findTrainingDetailIdForUpdating(BuildContext context) => context
      .read<TrainingRequestDynamicByChosenAttributesBloc>()
      .state
      .trainingRequestDynamicList
      .last
      .trainingDetailDynamic
      .trainingDetailId!;

  int _findLocationDetailForUpdating(BuildContext context) => context
      .read<TrainingRequestDynamicByChosenAttributesBloc>()
      .state
      .trainingRequestDynamicList
      .last
      .locationDetailDynamic
      .locationDetailId!;

  int _findlocationDetailId(BuildContext context) => 45;

  DateTime _findCreatedAtForUpdating(BuildContext context) => context
      .read<TrainingRequestDynamicByChosenAttributesBloc>()
      .state
      .trainingRequestDynamicList
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

  void _bringChosenTrainingRequestDynamicByChosennAttributesFromDB(
      BuildContext context,
      TrainingDetailDynamicByChosenAttributesState state) {
    context
        .read<TrainingRequestDynamicByChosenAttributesBloc>()
        .add(LoadTrainingRequestDynamicByChosenAttributesEvent(
          trainingRequesterId: _findTrainingRequesterId,
          trainingDetailId: _findTrainingDetailId(state),
          locationDetailId: _findlocationDetailId(context),
        ));
  }

  void _sendCreatingRequestForTheChosenTraining(BuildContext context) {
    context.read<TrainingRequestBloc>().add(AddTrainingRequestEvent(
        trainingRequest: _createTrainingRequestInstance(context)));
  }

  void _sendUpdatingRequestForTheChosenTraining(BuildContext context) {
    context.read<TrainingRequestBloc>().add(UpdateTrainingRequestEvent(
        trainingRequest: _updateTrainingRequestInstance(context)));
  }

  void _recallTrainingRequestDynamicRequestedByUserBloc(BuildContext context) {
    context
        .read<TrainingRequestDynamicRequestedByUserBloc>()
        .add(RecallTrainingRequestDynamicRequestedByUserEvent());
    context.read<TrainingRequestDynamicRequestedByUserBloc>().add(
        LoadTrainingRequestDynamicRequestedByUserEvent(
            uId: _findTrainingRequesterId, offset: 0));
  }

  // Create Model Instance ---------------------------------------------------------------------------------------------
  TrainingRequest _createTrainingRequestInstance(BuildContext context) {
    final TrainingRequest trainingRequest = TrainingRequest(
      trainingRequesterId: _findTrainingRequesterId,
      trainingDetailId: _findTrainingDetailIdForCreating(context),
      locationDetailId: _findLocationDetailIdForCreating(context),
      createdAt: _findDateTimeNow(),
    );
    return trainingRequest;
  }

  TrainingRequest _updateTrainingRequestInstance(BuildContext context) {
    final TrainingRequest trainingRequest = TrainingRequest(
      trainingRequestId: _findTrainingRequestIdForUpdating(context),
      trainingRequesterId: _findTrainingRequesterId,
      trainingDetailId: _findTrainingDetailIdForUpdating(context),
      locationDetailId: _findLocationDetailForUpdating(context),
      createdAt: _findCreatedAtForUpdating(context),
      updatedAt: _findDateTimeNow(),
      isActive: true,
    );
    return trainingRequest;
  }

  /// Screen Method ----------------------------------------------------------------------------------------------------
  void _closeThePopUpAndGoToMembershipTypeDetailScreen(BuildContext context) {
    _closeTheScreen(context);
    _goToUserTypeDetailScreen(context);
  }

  void _closeTheScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _goToUserTypeDetailScreen(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenOfUserTypeDetails.routeName);
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
