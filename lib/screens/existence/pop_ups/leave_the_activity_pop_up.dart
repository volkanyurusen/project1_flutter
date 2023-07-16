import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/widgets/widget.dart';

class LeaveTheActivityPopUp extends StatelessWidget {
  final AppTimeConstants _appTimeConstants = AppTimeConstants();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();

  LeaveTheActivityPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return _createLeavePopUp(context);
  }

  // LEAVE POP UP =====================================================================================================
  // CREATE ===========================================================================================================
  ActionPopUp _createLeavePopUp(BuildContext context) {
    return ActionPopUp(
      action: 'Leave',
      titleContent: 'Leave The Activity?',
      actionVoidCallBack: () {
        _updateChosenConsistedActivityMakeItInactive(context);
        _displayLeavingActivityDialog(context);
      },
      cancelVoidCallBack: () {},
    );
  }

  // DISPLAY ===========================================================================================================
  Future<dynamic> _displayLeavingActivityDialog(BuildContext context) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (dialogContext) {
            return _listenAndBuildConsistedActivityBroughtFromDBAfterLeavingTheActivity();
          });

  // CONSUMER ==========================================================================================================
  BlocConsumer<ConsistedActivityBloc, ConsistedActivityState>
      _listenAndBuildConsistedActivityBroughtFromDBAfterLeavingTheActivity() =>
          BlocConsumer<ConsistedActivityBloc, ConsistedActivityState>(
            listenWhen: (previous, current) =>
                _checkWhetherConsistedActivityBroughtSuccessfully(current),
            listener: (context, state) {
              _recallConsistedActivityDynamicWithDistanceAttendedByUserBloc(
                  context);
            },
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

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  _checkWhetherConsistedActivityBroughtSuccessfully(
          ConsistedActivityState current) =>
      current.status == Status.success;

  // ENDING PROCESS ====================================================================================================
  // METHODS ===========================================================================================================
  LoadSuccessfullyAlertDialog _initiateEndingProcess(BuildContext context) {
    Future.delayed(_appTimeConstants.timeOutDuration, () {
      _closePopUp(context);
    });
    return const LoadSuccessfullyAlertDialog(
        content:
            'The process which you chose has been completed without any mistake');
  }

  // Get Methods -------------------------------------------------------------------------------------------------------
  List<ConsistedActivityDynamicWithDistance> _getChosenConsistedActivity(
          BuildContext context) =>
      context
          .read<ConsistedActivityDynamicWithDistanceAttendedByUserBloc>()
          .state
          .consistedActivityDynamicWithDistanceList
          .where((element) =>
              element.createdActivityDynamic.createdActivityId ==
              _findCreatedActivityId(context))
          .toList();

  ConsistedActivityDynamicWithDistance _getChosenCreatedActivity(
          BuildContext context) =>
      context
          .read<
              ChosenActivityAmongConsistedActivityDynamicAttendedByUserCubit>()
          .state
          .chosenConsistedActivityDynamicWithDistanceList
          .last;

  int _getProcessDetailId(BuildContext context, String requestDetail) =>
      context
          .read<ProcessDetailDynamicBloc>()
          .state
          .processDetailDynamicList
          .indexWhere((element) => element.processName == requestDetail) +
      1;

  // Find Methods ------------------------------------------------------------------------------------------------------
  DateTime _findRequestedDate(BuildContext context) =>
      _getChosenConsistedActivity(context).last.requestDate;

  int get _findAttendeeId => _appNumberConstants.appUserId;

  int _findConsistedActivityId(BuildContext context) =>
      _getChosenConsistedActivity(context).last.consistedActivityId!;

  int _findCreatedActivityId(BuildContext context) =>
      _getChosenCreatedActivity(context)
          .createdActivityDynamic
          .createdActivityId!;

  DateTime _findDateTimeNow() => DateTime.now();

  // Datebase Methods --------------------------------------------------------------------------------------------------
  void _updateChosenConsistedActivityMakeItInactive(BuildContext context) {
    context.read<ConsistedActivityBloc>().add(UpdateConsistedActivityEvent(
        consistedActivity: _updateConsistedActivityInstance(context)));
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

  // Create Instance ---------------------------------------------------------------------------------------------------
  ConsistedActivity _updateConsistedActivityInstance(BuildContext context) {
    final ConsistedActivity consistedActivity = ConsistedActivity(
      consistedActivityId: _findConsistedActivityId(context),
      createdActivityId: _findCreatedActivityId(context),
      attendeeId: _findAttendeeId,
      requestDate: _findRequestedDate(context),
      processDetailId: _getProcessDetailId(context, 'Recalled'),
      recalledDate: _findDateTimeNow(),
      updatedDate: _findDateTimeNow(),
      isActive: false,
    );
    return consistedActivity;
  }

  // Screen Method -----------------------------------------------------------------------------------------------------
  void _closePopUp(BuildContext context) {
    int pageCount = 0;
    Navigator.of(context).popUntil((_) => pageCount++ >= 3);
  }
}
