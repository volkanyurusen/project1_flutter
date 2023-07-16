import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/models/models_reading/xmodels_reading.dart';
import 'package:my_project/widgets/widget.dart';

class UserCardDetailBodyAttendTheActivityButtonArea
    extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppTimeConstants _appTimeConstants = AppTimeConstants();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppInformationConstants _appInformationConstants =
      AppInformationConstants();

  final ResultOfPreferredActivityDynamicBloc
      resultOfPreferredActivityDynamicBloc;

  UserCardDetailBodyAttendTheActivityButtonArea(
      {Key? key, required this.resultOfPreferredActivityDynamicBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppSizedBox(),
        _displayActionButton(context),
        const CustomAppSizedBox(),
      ],
    );
  }

  CustomElevatedButton _displayActionButton(
    BuildContext context,
  ) =>
      _checkWhetherHasBeenAttendedBefore(context)
          ? CustomElevatedButton(
              buttonColor: _appColors.textColor,
              textlabel: 'Leave the Activity',
              onPressed: () {
                _displayLeaveTheActivityPopUp(context);
              })
          : CustomElevatedButton(
              buttonColor: _appColors.secondary,
              textlabel: 'Attend The Activity',
              onPressed: () {
                _displayAttendTheActivityPopUp(context);
              },
            );

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherHasBeenAttendedBefore(BuildContext context) => context
      .read<ConsistedActivityDynamicWithDistanceAttendedByUserBloc>()
      .state
      .consistedActivityDynamicWithDistanceList
      .where((element) =>
          element.createdActivityDynamic.createdActivityId ==
          _findCreatedActivityId(context))
      .toList()
      .isNotEmpty;

  // LEAVE THE ACTIVITY ===============================================================================================
  // DISPLAY ===========================================================================================================
  void _displayLeaveTheActivityPopUp(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return _createLeavePopUp(context);
        });
  }

  // LEAVE POP UP =====================================================================================================
  // CREATE ===========================================================================================================
  ActionPopUp _createLeavePopUp(BuildContext context) => ActionPopUp(
        titleContent: 'Leave the activity?',
        action: 'Leave',
        actionVoidCallBack: () async {
          _sendLeavingRequestTheChosenActivity(context);
          _displayLeavingActivityDialog(context);
        },
        cancelVoidCallBack: () {},
      );

  // DISPLAY ===========================================================================================================
  Future<dynamic> _displayLeavingActivityDialog(BuildContext context) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (dialogContext) {
            return _listenConsistedActivityBroughtFromDBAfterLeavingTheActivity();
          });

  // LISTEN ============================================================================================================
  BlocListener<ConsistedActivityBloc, ConsistedActivityState>
      _listenConsistedActivityBroughtFromDBAfterLeavingTheActivity() =>
          BlocListener<ConsistedActivityBloc, ConsistedActivityState>(
            listenWhen: (previous, current) =>
                _checkWhetherConsistedActivityBroughtSuccessfully(current),
            listener: (context, state) {
              _recallConsistedActivityDynamicWithDistanceAttendedByUserBloc(
                  context);
              _recallAttendedActivityByAttendeeBloc(context);
            },
            child: _buildChosenConsistedActivityBroughtFromDB(),
          );

  // ATTEND THE ACTIVITY ===============================================================================================
  // DISPLAY ===========================================================================================================
  void _displayAttendTheActivityPopUp(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return _checkWhetherExistingAttendedActivitiesMoreThanDailyLimit(
                  context)
              ? MembershipUpdating(
                  informationContent:
                      _appInformationConstants.kAboutActivityAttendingLimit)
              : _createAttendPopUp(context);
        });
  }

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherExistingAttendedActivitiesMoreThanDailyLimit(
          BuildContext context) =>
      _findNumberOfExistingAttendedActivities(context) >=
      _findLimitOfAttendancePerDay(context);

  // Find Methods ------------------------------------------------------------------------------------------------------
  int _findNumberOfExistingAttendedActivities(BuildContext context) => context
      .read<ConsistedActivityDynamicWithDistanceAttendedByUserBloc>()
      .state
      .consistedActivityDynamicWithDistanceList
      .length;

  int _findLimitOfAttendancePerDay(BuildContext context) => context
      .read<UserDynamicBloc>()
      .state
      .userDynamicList
      .last
      .membershipTypeDynamic
      .limitOfAttendancePerDay;

  // ATTEND POP UP =====================================================================================================
  // CREATE ===========================================================================================================
  ActionPopUp _createAttendPopUp(BuildContext context) => ActionPopUp(
        titleContent: 'Attend the Activity?',
        action: 'Attend',
        actionVoidCallBack: () {
          _initiateAttendTheActivityProcess(context);
          _displayAttendingActivityDialog(context);
        },
        cancelVoidCallBack: () {},
      );

  // DISPLAY ===========================================================================================================
  Future<dynamic> _displayAttendingActivityDialog(BuildContext context) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (dialogContext) {
            return _buildAndListenConsistedActivityDynamicBroughtFromDB();
          });

  // CONSUMER ==========================================================================================================
  BlocConsumer<ConsistedActivityDynamicByCreatedActivityAttendeeBloc,
          ConsistedActivityDynamicByCreatedActivityAttendeeState>
      _buildAndListenConsistedActivityDynamicBroughtFromDB() => BlocConsumer<
              ConsistedActivityDynamicByCreatedActivityAttendeeBloc,
              ConsistedActivityDynamicByCreatedActivityAttendeeState>(
            listener: (context, state) {
              state.consistedActivityDynamicList.isEmpty
                  ? _sendAttendingRequestTheChosenActivity(context)
                  : _sendUpdatingRequestTheChosenActivity(context);
            },
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return const StateLoading();
                case Status.loading:
                  return const StateLoading();
                case Status.success:
                  return _listenConsistedActivityBroughtFromDB();
                case Status.failure:
                  return StateError(error: state.error);
              }
            },
          );

  // LISTEN ============================================================================================================
  BlocListener<ConsistedActivityBloc, ConsistedActivityState>
      _listenConsistedActivityBroughtFromDB() {
    return BlocListener<ConsistedActivityBloc, ConsistedActivityState>(
      listenWhen: (previous, current) =>
          _checkWhetherConsistedActivityBroughtSuccessfully(current),
      listener: (context, state) {
        _recallConsistedActivityDynamicWithDistanceAttendedByUserBloc(context);
        _recallAttendedActivityByAttendeeBloc(context);
      },
      child: _buildChosenConsistedActivityBroughtFromDB(),
    );
  }

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  _checkWhetherConsistedActivityBroughtSuccessfully(
          ConsistedActivityState current) =>
      current.status == Status.success;

  // BUILD =============================================================================================================
  BlocBuilder<ConsistedActivityBloc, ConsistedActivityState>
      _buildChosenConsistedActivityBroughtFromDB() =>
          BlocBuilder<ConsistedActivityBloc, ConsistedActivityState>(
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
  // Get Methods -------------------------------------------------------------------------------------------------------
  int _getProcessDetailId(BuildContext context, String requestDetail) =>
      context
          .read<ProcessDetailDynamicBloc>()
          .state
          .processDetailDynamicList
          .indexWhere((element) => element.processName == requestDetail) +
      1;

  ActivityTile _getChosenCreatedActivity(BuildContext context) => context
      .read<ChosenResultOfPreferredActivityDynamicCubit>()
      .state
      .chosenCreatedActivityDynamicWithDistanceList
      .last;

  List<ConsistedActivityDynamicWithDistance> _getChosenConsistedActivity(
          BuildContext context) =>
      context
          .read<ConsistedActivityDynamicWithDistanceAttendedByUserBloc>()
          .state
          .consistedActivityDynamicWithDistanceList
          .where((element) =>
              element.createdActivityDynamic.createdActivityId ==
              _chosenCreatedActivityId(context))
          .toList();

  // Chosen Methods ----------------------------------------------------------------------------------------------------
  int? _chosenCreatedActivityId(BuildContext context) => context
      .read<ChosenResultOfPreferredActivityDynamicCubit>()
      .state
      .chosenCreatedActivityDynamicWithDistanceList
      .last
      .createdActivityId;

  // Find Methods ------------------------------------------------------------------------------------------------------
  int _findCreatedActivityId(BuildContext context) =>
      _getChosenCreatedActivity(context).createdActivityId!;

  int _findConsistedActivityId(BuildContext context) =>
      _getChosenConsistedActivity(context).last.consistedActivityId!;

  DateTime _findRequestedDate(BuildContext context) =>
      _getChosenConsistedActivity(context).last.requestDate;

  int get _findAttendeeId => _appNumberConstants.appUserId;

  int? _findConsistedActivityIdForUpdating(BuildContext context) => context
      .read<ConsistedActivityDynamicByCreatedActivityAttendeeBloc>()
      .state
      .consistedActivityDynamicList
      .last
      .consistedActivityId;

  int _findCreatedActivityIdForUpdating(BuildContext context) => context
      .read<ConsistedActivityDynamicByCreatedActivityAttendeeBloc>()
      .state
      .consistedActivityDynamicList
      .last
      .createdActivityDynamic
      .createdActivityId!;

  DateTime? _findRequestDateForUpdating(BuildContext context) => context
      .read<ConsistedActivityDynamicByCreatedActivityAttendeeBloc>()
      .state
      .consistedActivityDynamicList
      .last
      .requestDate;

  DateTime? _findApprovedDateForUpdating(BuildContext context) => context
      .read<ConsistedActivityDynamicByCreatedActivityAttendeeBloc>()
      .state
      .consistedActivityDynamicList
      .last
      .approvedDate;

  DateTime? _findRecallDateForUpdating(BuildContext context) => context
      .read<ConsistedActivityDynamicByCreatedActivityAttendeeBloc>()
      .state
      .consistedActivityDynamicList
      .last
      .recalledDate;

  DateTime? _findDeniedDateForUpdating(BuildContext context) => context
      .read<ConsistedActivityDynamicByCreatedActivityAttendeeBloc>()
      .state
      .consistedActivityDynamicList
      .last
      .deniedDate;

  DateTime _findDateTimeNow() => DateTime.now();

  // Datebase Methods --------------------------------------------------------------------------------------------------
  void _initiateAttendTheActivityProcess(BuildContext context) {
    context.read<ConsistedActivityDynamicByCreatedActivityAttendeeBloc>().add(
        LoadConsistedActivityDynamicByCreatedActivityAttendeeEvent(
            createdActivityId: _findCreatedActivityId(context),
            attendeeId: _findAttendeeId));
  }

  void _sendAttendingRequestTheChosenActivity(BuildContext context) {
    context.read<ConsistedActivityBloc>().add(AddConsistedActivityEvent(
        consistedActivity: _createConsistedActivityInstance(context)));
  }

  void _sendUpdatingRequestTheChosenActivity(BuildContext context) {
    context.read<ConsistedActivityBloc>().add(UpdateConsistedActivityEvent(
        consistedActivity: _updateConsistedActivityMakeItActiveAgain(context)));
  }

  void _sendLeavingRequestTheChosenActivity(BuildContext context) {
    context.read<ConsistedActivityBloc>().add(UpdateConsistedActivityEvent(
        consistedActivity: _updateConsistedActivityMakeItInactive(context)));
  }

  void _recallConsistedActivityDynamicWithDistanceAttendedByUserBloc(
      BuildContext context) {
    context
        .read<ConsistedActivityDynamicWithDistanceAttendedByUserBloc>()
        .add(RecallConsistedActivityDynamicWithDistanceAttendedByUserEvent());
    context.read<ConsistedActivityDynamicWithDistanceAttendedByUserBloc>().add(
        LoadConsistedActivityDynamicWithDistanceAttendedByUserEvent(
            uId: _findAttendeeId, offset: 0));
  }

  void _recallAttendedActivityByAttendeeBloc(BuildContext context) {
    context
        .read<AttendedActivityByAttendeeBloc>()
        .add(RecallAttendedActivityByAttendeeEvent());
    context.read<AttendedActivityByAttendeeBloc>().add(
        LoadAttendedActivityByAttendeeEvent(
            attendeeId: _appNumberConstants.appUserId));
  }

  // Create Instance ---------------------------------------------------------------------------------------------------
  ConsistedActivity _createConsistedActivityInstance(BuildContext context) {
    final ConsistedActivity consistedActivity = ConsistedActivity(
      createdActivityId: _findCreatedActivityId(context),
      attendeeId: _findAttendeeId,
      processDetailId: _getProcessDetailId(context, 'Requested'),
      requestDate: _findDateTimeNow(),
    );
    return consistedActivity;
  }

  ConsistedActivity _updateConsistedActivityMakeItInactive(
      BuildContext context) {
    final ConsistedActivity consistedActivity = ConsistedActivity(
      consistedActivityId: _findConsistedActivityId(context),
      createdActivityId: _findCreatedActivityId(context),
      processDetailId: _getProcessDetailId(context, 'Recalled'),
      attendeeId: _findAttendeeId,
      requestDate: _findRequestedDate(context),
      recalledDate: _findDateTimeNow(),
      updatedDate: _findDateTimeNow(),
      isActive: false,
    );
    return consistedActivity;
  }

  ConsistedActivity _updateConsistedActivityMakeItActiveAgain(
      BuildContext context) {
    final ConsistedActivity consistedActivity = ConsistedActivity(
      consistedActivityId: _findConsistedActivityIdForUpdating(context),
      createdActivityId: _findCreatedActivityIdForUpdating(context),
      processDetailId: _getProcessDetailId(context, 'Requested'),
      attendeeId: _findAttendeeId,
      requestDate: _findRequestDateForUpdating(context),
      approvedDate: _findApprovedDateForUpdating(context),
      updatedDate: _findDateTimeNow(),
      recalledDate: _findRecallDateForUpdating(context),
      deniedDate: _findDeniedDateForUpdating(context),
      isActive: true,
    );
    return consistedActivity;
  }

  // Screen Methods ----------------------------------------------------------------------------------------------------
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
