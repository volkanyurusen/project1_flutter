import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';

import 'package:my_project/models/models.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/widgets/widget.dart';

class DenyAttendeePopUp extends StatelessWidget {
  final AppTimeConstants _appTimeConstants = AppTimeConstants();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();

  final ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
      chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit;

  DenyAttendeePopUp({
    required this.chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _createDenyAttendeePopUp(context);
  }

  // DENY POP UP =======================================================================================================
  // CREATE ===========================================================================================================
  ActionPopUp _createDenyAttendeePopUp(BuildContext context) => ActionPopUp(
        titleContent: 'Deny the attendee?',
        action: 'Deny',
        actionVoidCallBack: () async {
          _checkWhetherProcessIsRequest
              ? _sendDenyingRequestForChosenAttendee(context)
              : _sendDenyingRequestForChosenAttendeeWhichWasApprovedBefore(
                  context);
          _displayCompletingProcessAttendeeDialog(context);
        },
        cancelVoidCallBack: () {},
      );

  // DISPLAY ===========================================================================================================
  Future<dynamic> _displayCompletingProcessAttendeeDialog(
          BuildContext context) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (dialogContext) {
            return _listenAndBuildConsistedActivityBroughtFromDBAfterCompletingProceessAboutTheAttendee();
          });

  // CONSISTED ACTIVITY ================================================================================================
  // CONSUMER ==========================================================================================================
  BlocConsumer<ConsistedActivityBloc, ConsistedActivityState>
      _listenAndBuildConsistedActivityBroughtFromDBAfterCompletingProceessAboutTheAttendee() =>
          BlocConsumer<ConsistedActivityBloc, ConsistedActivityState>(
            listenWhen: (previous, current) =>
                _checkWhetherConsistedActivityBroughtSuccessfully(current),
            listener: (context, state) {
              _recallConsistedActivityDynamicWithDistanceAttendedByUserBloc(
                  context);
              if (_checkWhetherProcessIsNotRequest) {
                _initiateActivityConversationProcess(context);
              }
            },
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return DBProcessLoader();
                case Status.loading:
                  return DBProcessLoader();
                case Status.success:
                  return _checkWhetherProcessIsRequest
                      ? _initiateEndingProcess(context)
                      : _listenAndBuildActivityConversationBroughtFromDBAfterCompletingProcessAboutConsistedActivity();
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

  bool get _checkWhetherProcessIsNotRequest =>
      chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
          .state
          .chosenConsistedActivityDynamicWithDistanceList
          .last
          .processDetailDynamic
          .processDetailId !=
      1;

  bool get _checkWhetherProcessIsRequest =>
      chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
          .state
          .chosenConsistedActivityDynamicWithDistanceList
          .last
          .processDetailDynamic
          .processDetailId ==
      1;

  // ACTIVITY CONVERSATION BY CHOSEN ATTRIBUTES ========================================================================
  // CONSUMER ==========================================================================================================
  BlocConsumer<ActivityConversationDynamicByChosenAttributesBloc,
          ActivityConversationDynamicByChosenAttributesState>
      _listenAndBuildActivityConversationBroughtFromDBAfterCompletingProcessAboutConsistedActivity() =>
          BlocConsumer<ActivityConversationDynamicByChosenAttributesBloc,
              ActivityConversationDynamicByChosenAttributesState>(
            listenWhen: (previous, current) => current.status == Status.success,
            listener: (context, activityState) {
              _sendUpdatingRequestForActivityConversation(
                  context, activityState);
            },
            builder: (context, activityState) {
              switch (activityState.status) {
                case Status.initial:
                  return const StateLoading();
                case Status.loading:
                  return const StateLoading();
                case Status.success:
                  return _listenAndBuildActivityConversationBroughtFromDB();
                case Status.failure:
                  return StateError(error: activityState.error);
              }
            },
          );

  BlocConsumer<ActivityConversationDynamicByChosenAttributesBloc,
          ActivityConversationDynamicByChosenAttributesState>
      _listenAndBuildActivityConversationBroughtFromDB() => BlocConsumer<
              ActivityConversationDynamicByChosenAttributesBloc,
              ActivityConversationDynamicByChosenAttributesState>(
            listenWhen: (previous, current) => current.status == Status.success,
            listener: (context, state) {
              _recallActivityConversationDynamicByUserBloc(context);
              _recallMessageDynamicByGroupOfActivityConversationBloc(context);
            },
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return const StateLoading();
                case Status.loading:
                  return const StateLoading();
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

  /// GENERAL METHOD ===================================================================================================
  // Get Methods -------------------------------------------------------------------------------------------------------
  int _getProcessDetailId(BuildContext context, String requestDetail) =>
      context
          .read<ProcessDetailDynamicBloc>()
          .state
          .processDetailDynamicList
          .indexWhere((element) => element.processName == requestDetail) +
      1;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  int? _findConsistedActivityId(BuildContext context) => context
      .read<ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit>()
      .state
      .chosenConsistedActivityDynamicWithDistanceList
      .last
      .consistedActivityId;

  int _findCreatedActivityId(BuildContext context) => context
      .read<ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit>()
      .state
      .chosenConsistedActivityDynamicWithDistanceList
      .last
      .createdActivityDynamic
      .createdActivityId!;

  int _findAttendeeId(BuildContext context) => context
      .read<ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit>()
      .state
      .chosenConsistedActivityDynamicWithDistanceList
      .last
      .attendee
      .uId!;

  DateTime _findRequestedDate(BuildContext context) => context
      .read<ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit>()
      .state
      .chosenConsistedActivityDynamicWithDistanceList
      .last
      .requestDate;

  DateTime? _findApprovedDate(BuildContext context) => context
      .read<ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit>()
      .state
      .chosenConsistedActivityDynamicWithDistanceList
      .last
      .approvedDate;

  DateTime _findDateTimeNow() => DateTime.now();

  // Activivty Conversation Updating -----------------------------------------------------------------------------------
  // Get Methods -------------------------------------------------------------------------------------------------------
  Iterable<ActivityConversationDynamic> _getChosenActivityConversation(
    BuildContext context,
    ActivityConversationDynamicByChosenAttributesState activityState,
  ) =>
      activityState.activityConversationDynamicList.where((element) =>
          element.consistedActivityDynamic.consistedActivityId ==
          _chosenConsistedActivityId(context));

  // Chosen Methods ----------------------------------------------------------------------------------------------------
  int? _chosenConsistedActivityId(BuildContext context) => context
      .read<ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit>()
      .state
      .chosenConsistedActivityDynamicWithDistanceList
      .last
      .consistedActivityId;

  // Find Methods ------------------------------------------------------------------------------------------------------
  int? _findActivityConversationIdForUpdating(
    BuildContext context,
    ActivityConversationDynamicByChosenAttributesState activityState,
  ) =>
      _getChosenActivityConversation(context, activityState)
          .first
          .activityConversationId;

  int? _findConsistedActivityIdForUpdating(
    BuildContext context,
    ActivityConversationDynamicByChosenAttributesState activityState,
  ) =>
      _getChosenActivityConversation(context, activityState)
          .first
          .consistedActivityDynamic
          .consistedActivityId;

  int? _findConversationTypeIdForUpdating(
    BuildContext context,
    ActivityConversationDynamicByChosenAttributesState activityState,
  ) =>
      _getChosenActivityConversation(context, activityState)
          .first
          .conversationTypeDynamic
          .conversationTypeId;

  DateTime _findDateOfParticipationForUpdating(
    BuildContext context,
    ActivityConversationDynamicByChosenAttributesState activityState,
  ) =>
      _getChosenActivityConversation(context, activityState)
          .first
          .dateOfParticipation;

  // DateTime? _findDeactivatedAtForUpdating(
  //   BuildContext context,
  //   ActivityConversationDynamicByChosenAttributesState activityState,
  // ) =>
  //     _getChosenActivityConversation(context, activityState)
  //         .first
  //         .deactivatedAt;

  // Datebase Methods --------------------------------------------------------------------------------------------------
  void _sendDenyingRequestForChosenAttendee(BuildContext context) {
    context.read<ConsistedActivityBloc>().add(UpdateConsistedActivityEvent(
        consistedActivity: _denyConsistedActivity(context)));
  }

  void _sendDenyingRequestForChosenAttendeeWhichWasApprovedBefore(
      BuildContext context) {
    context.read<ConsistedActivityBloc>().add(UpdateConsistedActivityEvent(
        consistedActivity: _denyConsistedActivity(context)));
  }

  void _initiateActivityConversationProcess(BuildContext context) {
    context.read<ActivityConversationDynamicByChosenAttributesBloc>().add(
        LoadActivityConversationDynamicByChosenAttributesEvent(
            consistedActivityId: _findConsistedActivityId(context)!));
  }

  // void _sendDenyingRequestForActivityConversation(BuildContext context) {
  //   context.read<ActivityConversationBloc>().add(
  //       UpdateActivityConversationEvent(
  //           activityConversation:
  //               _createActivityConversationInstance(context)));
  // }

  void _sendUpdatingRequestForActivityConversation(
    BuildContext context,
    ActivityConversationDynamicByChosenAttributesState activityState,
  ) {
    context.read<ActivityConversationBloc>().add(
        UpdateActivityConversationEvent(
            activityConversation: _updateActivityConversationMakeItActiveAgain(
                context, activityState)));
  }

  // Create Instance ---------------------------------------------------------------------------------------------------
  // Update Attendee's status ------------------------------------------------------------------------------------------
  ConsistedActivity _denyConsistedActivity(BuildContext context) {
    final ConsistedActivity consistedActivity = ConsistedActivity(
      consistedActivityId: _findConsistedActivityId(context),
      createdActivityId: _findCreatedActivityId(context),
      processDetailId: _getProcessDetailId(context, 'Denied'),
      attendeeId: _findAttendeeId(context),
      requestDate: _findRequestedDate(context),
      approvedDate: _findApprovedDate(context),
      updatedDate: _findDateTimeNow(),
      deniedDate: _findDateTimeNow(),
      isDenied: true,
      isApproved: false,
      isActive: true,
    );
    return consistedActivity;
  }

  // ActivityConversation _createActivityConversationInstance(
  //     BuildContext context) {
  //   final ActivityConversation activityConversation = ActivityConversation(
  //     conversationTypeId: 1,
  //     consistedActivityId: _findConsistedActivityId(context)!,
  //     dateOfParticipation: _findDateTimeNow(),
  //   );
  //   return activityConversation;
  // }

  ActivityConversation _updateActivityConversationMakeItActiveAgain(
    BuildContext context,
    ActivityConversationDynamicByChosenAttributesState activityState,
  ) {
    final ActivityConversation activityConversation = ActivityConversation(
      activityConversationId:
          _findActivityConversationIdForUpdating(context, activityState),
      consistedActivityId:
          _findConsistedActivityIdForUpdating(context, activityState)!,
      conversationTypeId:
          _findConversationTypeIdForUpdating(context, activityState)!,
      dateOfParticipation:
          _findDateOfParticipationForUpdating(context, activityState),
      deactivatedAt: _findDateTimeNow(),
      updatedAt: _findDateTimeNow(),
      isActive: false,
    );
    return activityConversation;
  }

  // Recall Methods ----------------------------------------------------------------------------------------------------
  // For Creation ------------------------------------------------------------------------------------------------------
  void _recallConsistedActivityDynamicWithDistanceAttendedByUserBloc(
      BuildContext context) {
    context
        .read<
            ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessBloc>()
        .add(
            CleanConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcess());
    context
        .read<
            ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessBloc>()
        .add(
            LoadConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcess(
                createdActivityId: _findCreatedActivityId(context), offset: 0));
  }

  // For Message -------------------------------------------------------------------------------------------------------
  void _recallActivityConversationDynamicByUserBloc(BuildContext context) {
    context
        .read<ActivityConversationDynamicByUserBloc>()
        .add(RecallActivityConversationDynamicByUserEvent());
    context.read<ActivityConversationDynamicByUserBloc>().add(
        LoadActivityConversationDynamicByUserEvent(
            uId: _appNumberConstants.appUserId));
  }

  void _recallMessageDynamicByGroupOfActivityConversationBloc(
      BuildContext context) {
    context
        .read<MessageDynamicByGroupOfActivityConversationBloc>()
        .add(RecallMessageDynamicByGroupOfActivityConversationEvent());
    context.read<MessageDynamicByGroupOfActivityConversationBloc>().add(
        LoadMessageDynamicByGroupOfActivityConversationEvent(
            uId: _appNumberConstants.appUserId));
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
