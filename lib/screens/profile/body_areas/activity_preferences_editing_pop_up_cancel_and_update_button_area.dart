import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/widgets/widget.dart';

class ActivityPreferencesEditingPopUpActivityCancelAndUpdateButtonArea
    extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppFunctions _appFunctions = AppFunctions();
  // final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppInformationConstants _appInformationConstants =
      AppInformationConstants();
  // final AppTimeConstants _appTimeConstants = AppTimeConstants();

  ActivityPreferencesEditingPopUpActivityCancelAndUpdateButtonArea({super.key});

  @override
  Widget build(BuildContext context) {
    return _createCancelAndUpdatedButtonArea(context);
  }

  // CANCEL AND UPDAATE BUTTONS ========================================================================================
  // CREATE ============================================================================================================
  CustomRow _createCancelAndUpdatedButtonArea(BuildContext context) =>
      CustomRow(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(flex: 1, child: _displayCancelButton(context)),
          const CustomAppSizedBox(width: 18),
          Flexible(flex: 1, child: _buildUpdateButton()),
        ],
      );

  /// CANCEL BUTTON ====================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// DISPLAY ==========================================================================================================
  CustomElevatedButton _displayCancelButton(BuildContext context) =>
      CustomElevatedButton(
          buttonColor: _appColors.unselectedButtonColor,
          textlabel: 'Cancel',
          onPressed: () {
            _clickCancelButton(context);
          });

  /// METHODS ==========================================================================================================
  void _clickCancelButton(BuildContext context) {
    _cleanChosenActivityTitleButtons(context);
    _closeTheScreen(context);
  }

  // Clean Methods -----------------------------------------------------------------------------------------------------
  void _cleanChosenActivityTitleButtons(BuildContext context) {
    context.read<ActivityNameButtonCubit>().cleanUserPreferredActivityTitle();
  }

  /// UPDATE BUTTON ====================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// BUILD ============================================================================================================
  BlocBuilder<ActivityNameButtonCubit, ActivityNameButtonState>
      _buildUpdateButton() =>
          BlocBuilder<ActivityNameButtonCubit, ActivityNameButtonState>(
            builder: (context, nameState) {
              return _displayUpdateButton(context, nameState);
            },
          );

  /// DISPLAY ==========================================================================================================
  CustomElevatedButton _displayUpdateButton(
          BuildContext context, ActivityNameButtonState buttonState) =>
      CustomElevatedButton(
        buttonColor: _appColors.secondary,
        textlabel: 'Update',
        onPressed: _checkWhetherHostChooseNewActivity(context)
            ? null
            : () {
                _clickUpdateButton(context, buttonState);
              },
      );

  bool _checkWhetherHostChooseNewActivity(BuildContext context) =>
      _appFunctions.areListsEqual(
        _getPreferredActivityTitleListPreviouslyChosenByHost(context),
        _findCurrentActivityNameButtonTitleList(context),
      );

  /// METHODS ==========================================================================================================
  // Get Methods -------------------------------------------------------------------------------------------------------
  List<String> _getPreferredActivityTitleListPreviouslyChosenByHost(
          BuildContext context) =>
      context
          .read<CreatedActivityDynamicByHostBloc>()
          .state
          .createdActivityDynamicList
          .map((e) => e.activityNameDynamic.activityTitle)
          .toList();

  // Find Methods ------------------------------------------------------------------------------------------------------
  List<String> _findCurrentActivityNameButtonTitleList(BuildContext context) =>
      context.read<ActivityNameButtonCubit>().state.chosenActivityTitleList;

  /// METHODS ==========================================================================================================
  // Screen Methods ----------------------------------------------------------------------------------------------------
  void _closeTheScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _clickUpdateButton(
    BuildContext context,
    ActivityNameButtonState buttonState,
  ) {
    if (context
        .read<CreatedActivityDynamicByHostBloc>()
        .state
        .createdActivityDynamicList
        .map((e) => e.activityNameDynamic.activityTitle)
        .toList()
        .contains(context
            .read<ChosenActivityNameInActivityPreferencesCubit>()
            .state
            .chosenActivityTitleInActivityPreferences
            .last)) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return _displayActionPopUpForDeleting(context);
          });
      //
      // print(
      //     'contains; user preferances: ${context.read<CreatedActivityDynamicByHostBloc>().state.createdActivityDynamicList.map((e) => e.activityNameDynamic.activityTitle).toList()}');
      // print(
      //     'contains; chosen: ${context.read<ChosenActivityNameInActivityPreferencesCubit>().state.chosenActivityTitleInActivityPreferences}');
      // print(
      //     'contains; activityNameId ${context.read<ActivityNameDynamicBloc>().state.activityNameDynamicList.where((element) => element.activityTitle == context.read<ChosenActivityNameInActivityPreferencesCubit>().state.chosenActivityTitleInActivityPreferences.last).first.activityNameId}');
    } else {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return _checkWhetherMembershipLimitOfCreatingActivityIsExceeded(
                    context)
                ? MembershipUpdating(
                    informationContent:
                        _appInformationConstants.kAboutActivityPreferencesLimit)
                : _displayActionPopUp(context);
          });
      //
      // print(
      //     'not contains; user preferances: ${context.read<CreatedActivityDynamicByHostBloc>().state.createdActivityDynamicList.map((e) => e.activityNameDynamic.activityTitle).toList()}');
      // print(
      //     'not contains; chosen: ${context.read<ChosenActivityNameInActivityPreferencesCubit>().state.chosenActivityTitleInActivityPreferences}');
      // print(
      //     'not contains; activityNameId ${context.read<ActivityNameDynamicBloc>().state.activityNameDynamicList.where((element) => element.activityTitle == context.read<ChosenActivityNameInActivityPreferencesCubit>().state.chosenActivityTitleInActivityPreferences.last).first.activityNameId}');
    }
  }
}

// FOR UPDATING ========================================================================================================
// DISLAY ===========================================================================================================
ActionPopUp _displayActionPopUpForDeleting(
  BuildContext context,
) =>
    ActionPopUp(
      titleContent: 'Delete the Activity?',
      action: 'Delete',
      actionVoidCallBack: () {
        _initiateDeletingProcess(context);
      },
      cancelVoidCallBack: () {
        _closeTheScreen(context);
      },
    );

void _initiateDeletingProcess(BuildContext context) {
  _bringChosenCreatedActivityDynamicByChosenAttributesFromDB(context);
  _displayCreateTheActivityDialog(context);
}

// FOR ADDING ==========================================================================================================
// METHODS ===========================================================================================================
// Check Methods -----------------------------------------------------------------------------------------------------
bool _checkWhetherMembershipLimitOfCreatingActivityIsExceeded(
        BuildContext context) =>
    _findNumberOfExistingCreatedActivities(context) >=
    _findLimitOfCreationPerDay(context);

// Find Methods ------------------------------------------------------------------------------------------------------
int _findNumberOfExistingCreatedActivities(BuildContext context) => context
    .read<CreatedActivityDynamicByHostBloc>()
    .state
    .createdActivityDynamicList
    .length;

int _findLimitOfCreationPerDay(BuildContext context) => context
    .read<UserDynamicBloc>()
    .state
    .userDynamicList
    .last
    .membershipTypeDynamic
    .limitOfCreatingActivityPerDay;

// DISPLAY =============================================================================================================
ActionPopUp _displayActionPopUp(BuildContext context) => ActionPopUp(
      titleContent: 'Add the Activity?',
      action: 'Add',
      actionVoidCallBack: () {
        _initiateAddingProcess(context);
      },
      cancelVoidCallBack: () {
        _closeTheScreen(context);
      },
    );

// ADDING METHODS ====================================================================================================
dynamic _initiateAddingProcess(BuildContext context) async {
  _bringChosenCreatedActivityDynamicByChosenAttributesFromDB(context);
  _displayCreateTheActivityDialog(context);
}

// DISPLAY ===========================================================================================================
Future<dynamic> _displayCreateTheActivityDialog(BuildContext context) =>
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return _listenActivityDetailBroughtFromDB();
        });

// LISTEN ============================================================================================================
BlocListener<CreatedActivityDynamicByChosenAttributesBloc,
        CreatedActivityDynamicByChosenAttributesState>
    _listenActivityDetailBroughtFromDB() => BlocListener<
            CreatedActivityDynamicByChosenAttributesBloc,
            CreatedActivityDynamicByChosenAttributesState>(
          listenWhen: (previous, current) =>
              _checkWhetherCreatedActivityBroughtSuccessfully(current),
          listener: (context, state) {
            // _whetherChosenActivityHasNotBeenCreatedBefore(state)
            //     ? _sendCreatingRequestTheChosenActivity(context)
            //     : _whetherChosenActivityIsStillActive(state)
            //         ? _sendDeletingRequestTheChosenActivity(context)
            //         : _sendUpdatingRequestTheChosenActivity(context);
          },
          child: _buildChosenActivityDetailBroughtFromDB(),
        );

// METHODS ===========================================================================================================
// Check Methods -----------------------------------------------------------------------------------------------------
bool _checkWhetherCreatedActivityBroughtSuccessfully(
        CreatedActivityDynamicByChosenAttributesState current) =>
    current.status == Status.success;

bool _whetherChosenActivityHasNotBeenCreatedBefore(
        CreatedActivityDynamicByChosenAttributesState state) =>
    state.createdActivityDynamicList.isEmpty;

bool _whetherChosenActivityIsStillActive(
        CreatedActivityDynamicByChosenAttributesState state) =>
    state.createdActivityDynamicList.last.isActive == true;

// CREATE ============================================================================================================
// void _createExistenceDialog(BuildContext context) {
//   showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (context) => _displayInformationOfExistenceDialog());
// }

// DISPLAY ===========================================================================================================
// InformationOfExistenceAlertDialog _displayInformationOfExistenceDialog() =>
//     const InformationOfExistenceAlertDialog(
//         detail: 'activity', pageNumberThatWillBeClosed: 3);

// BUILD =============================================================================================================
BlocBuilder<CreatedActivityDynamicByChosenAttributesBloc,
        CreatedActivityDynamicByChosenAttributesState>
    _buildChosenActivityDetailBroughtFromDB() => BlocBuilder<
            CreatedActivityDynamicByChosenAttributesBloc,
            CreatedActivityDynamicByChosenAttributesState>(
          builder: (context, state) {
            switch (state.status) {
              case Status.initial:
                return DBProcessLoader();
              case Status.loading:
                return DBProcessLoader();
              case Status.success:
                return _listenCreatedActivityBroughtFromDB();
              case Status.failure:
                return StateError(error: state.error);
            }
          },
        );

// LISTEN ============================================================================================================
BlocListener<CreatedActivityBloc, CreatedActivityState>
    _listenCreatedActivityBroughtFromDB() =>
        BlocListener<CreatedActivityBloc, CreatedActivityState>(
          listenWhen: (previous, current) =>
              _checkWhetherCreatedActivityInsertSuccessfully(current),
          listener: (context, state) {
            _recallCreatedActivityDynamicByHostBloc(context);
            _recallResultOfPreferredActivityDynamicBloc(context);
            context
                .read<ActivityNameButtonCubit>()
                .cleanUserPreferredActivityTitle();
            context
                .read<ActivityNameButtonCubit>()
                .addUserPreferredActivityTitle(
                    _getActivityTitleListChosenByHost(context));
          },
          child: _buildCreatedActivity(),
        );

// Get Methods -------------------------------------------------------------------------------------------------------
List<String> _getActivityTitleListChosenByHost(BuildContext context) => context
    .read<CreatedActivityDynamicByHostBloc>()
    .state
    .createdActivityDynamicList
    .map((e) => e.activityNameDynamic.activityTitle)
    .toList();

// Check Methods -----------------------------------------------------------------------------------------------------
_checkWhetherCreatedActivityInsertSuccessfully(
  CreatedActivityState current,
) =>
    current.status == Status.success;

// BUILD =============================================================================================================
BlocBuilder<CreatedActivityBloc, CreatedActivityState>
    _buildCreatedActivity() =>
        BlocBuilder<CreatedActivityBloc, CreatedActivityState>(
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

// METHODS ===========================================================================================================
void _closeTheScreenWithDelaying(BuildContext context) {
  Future.delayed(AppTimeConstants().timeOutDuration, () {
    _closePopUp(context);
  });
}

// METHODS =============================================================================================================
// Find Methods --------------------------------------------------------------------------------------------------------
int get _findHostId => AppNumberConstants().appUserId;

int _findActivityNameId(BuildContext context) => context
    .read<ActivityNameDynamicBloc>()
    .state
    .activityNameDynamicList
    .where((element) =>
        element.activityTitle ==
        context
            .read<ChosenActivityNameInActivityPreferencesCubit>()
            .state
            .chosenActivityTitleInActivityPreferences
            .last)
    .first
    .activityNameId!;

int _findLocationDetailIdForCreating(BuildContext context) => context
    .read<ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit>()
    .state
    .chosenLocationDetailDynamicList
    .last
    .locationDetailId!;

DateTime _findDateTimeNow() => DateTime.now();

int? _findCreatedActivityIdForUpdating(BuildContext context) => context
    .read<CreatedActivityDynamicByChosenAttributesBloc>()
    .state
    .createdActivityDynamicList
    .last
    .createdActivityId;

int _findActivityNameIdForUpdating(BuildContext context) => context
    .read<CreatedActivityDynamicByChosenAttributesBloc>()
    .state
    .createdActivityDynamicList
    .last
    .activityNameDynamic
    .activityNameId!;

int _findLocationDetailIdForUpdating(BuildContext context) => context
    .read<CreatedActivityDynamicByChosenAttributesBloc>()
    .state
    .createdActivityDynamicList
    .last
    .locationDetailDynamic
    .locationDetailId!;

DateTime _findCreatedAtForUpdating(BuildContext context) => context
    .read<CreatedActivityDynamicByChosenAttributesBloc>()
    .state
    .createdActivityDynamicList
    .last
    .createdAt;

// Database Methods --------------------------------------------------------------------------------------------------
void _bringChosenCreatedActivityDynamicByChosenAttributesFromDB(
  BuildContext context,
) {
  context
      .read<CreatedActivityDynamicByChosenAttributesBloc>()
      .add(LoadCreatedActivityDynamicByChosenAttributesEvent(
        activityNameId: _findActivityNameId(context),
        hostId: AppNumberConstants().appUserId,
      ));
}

void _sendCreatingRequestTheChosenActivity(BuildContext context) {
  context.read<CreatedActivityBloc>().add(AddCreatedActivityEvent(
      createdActivity: _createCreatedActivityInstance(context)));
}

void _sendUpdatingRequestTheChosenActivity(BuildContext context) {
  context.read<CreatedActivityBloc>().add(UpdateCreatedActivityEvent(
      createdActivity: _updateCreatedActivityInstance(context)));
}

void _recallCreatedActivityDynamicByHostBloc(BuildContext context) {
  context
      .read<CreatedActivityDynamicByHostBloc>()
      .add(RecallCreatedActivityDynamicByHostEvent());
  context.read<CreatedActivityDynamicByHostBloc>().add(
      LoadCreatedActivityDynamicByHostEvent(hostId: _findHostId, offset: 0));
}

void _recallResultOfPreferredActivityDynamicBloc(BuildContext context) {
  context
      .read<ResultOfPreferredActivityDynamicBloc>()
      .add(CleanResultOfPreferredActivityDynamic());
  BlocProvider.of<ResultOfPreferredActivityDynamicBloc>(context).add(
      LoadResultOfPreferredActivityDynamic(
          uId: _findHostId,
          activityTitle: context
              .read<CreatedActivityDynamicByHostBloc>()
              .state
              .createdActivityDynamicList
              .first
              .activityNameDynamic
              .activityTitle,
          locationCircularDiamter: context
              .read<
                  ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit>()
              .state
              .chosenLocationDetailDynamicList
              .last
              .membershipMaxDiameter,
          lat: context
              .read<
                  ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit>()
              .state
              .chosenLocationDetailDynamicList
              .last
              .lat,
          lon: context
              .read<
                  ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit>()
              .state
              .chosenLocationDetailDynamicList
              .last
              .lon));
}

// Create Model Instance ---------------------------------------------------------------------------------------------
CreatedActivity _createCreatedActivityInstance(BuildContext context) {
  final CreatedActivity createdActivity = CreatedActivity(
    hostId: _findHostId,
    activityNameId: _findActivityNameId(context),
    locationDetailId: _findLocationDetailIdForCreating(context),
    createdAt: _findDateTimeNow(),
  );
  return createdActivity;
}

CreatedActivity _updateCreatedActivityInstance(BuildContext context) {
  final CreatedActivity createdActivity = CreatedActivity(
    createdActivityId: _findCreatedActivityIdForUpdating(context),
    hostId: _findHostId,
    activityNameId: _findActivityNameIdForUpdating(context),
    locationDetailId: _findLocationDetailIdForUpdating(context),
    createdAt: _findCreatedAtForUpdating(context),
    updatedAt: _findDateTimeNow(),
    isActive: true,
  );
  return createdActivity;
}

// Screen Methods ------------------------------------------------------------------------------------------------------
void _closeTheScreen(BuildContext context) => Navigator.of(context).pop();

void _closePopUp(BuildContext context) {
  int pageCount = 0;
  Navigator.of(context).popUntil((_) => pageCount++ >= 3);
}
