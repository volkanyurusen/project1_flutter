import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/widgets/widget.dart';

class ApproveCoachPopUp extends StatelessWidget {
  final AppTimeConstants _appTimeConstants = AppTimeConstants();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();

  final ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
      chosenResponseAmongThoseWhoRespondedTrainingRequestCubit;

  ApproveCoachPopUp({
    required this.chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _createApproveCoachPopUp(context);
  }

  // APPROVE POP UP ====================================================================================================
  // CREATE ===========================================================================================================
  ActionPopUp _createApproveCoachPopUp(BuildContext context) => ActionPopUp(
        titleContent: 'Approve the coach?',
        action: 'Approve',
        actionVoidCallBack: () async {
          chosenResponseAmongThoseWhoRespondedTrainingRequestCubit
                      .state
                      .chosenTrainingRequestResponseDynamicWithDistanceList
                      .last
                      .processDetailDynamic
                      .processDetailId ==
                  1
              ? _sendApprovingRequestForChosenCoach(context) //OK
              : _sendApprovingRequestForChosenCoachWhichWasDeniedBefore(
                  context);
          _displayCompletingProcessCoachDialog(context);
        },
        cancelVoidCallBack: () {},
      );

  // DISPLAY ===========================================================================================================
  Future<dynamic> _displayCompletingProcessCoachDialog(BuildContext context) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (dialogContext) {
            return _listenAndBuildTrainingRequestResponseBroughtFromDBAfterCompletingProceessAboutTheCoach();
          });

  // TRAINING REQUEST RESPONSE =========================================================================================
  // CONSUMER ==========================================================================================================
  BlocConsumer<TrainingRequestResponseBloc, TrainingRequestResponseState>
      _listenAndBuildTrainingRequestResponseBroughtFromDBAfterCompletingProceessAboutTheCoach() =>
          BlocConsumer<TrainingRequestResponseBloc,
              TrainingRequestResponseState>(
            listenWhen: (previous, current) =>
                _checkWhetherTrainingRequestResponseBroughtSuccessfully(
                    current),
            listener: (context, state) {
              _recallTrainingRequestResponseDynamicWithDistanceRespopndedByCoachBloc(
                  context);
              _initiateTrainingRequestConversationProcess(context);
            },
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return DBProcessLoader();
                case Status.loading:
                  return DBProcessLoader();
                case Status.success:
                  return _listenAndBuildTrainingRequestConversationBroughtFromDBAfterCompletingProcessAboutTrainingRequestResponse();
                case Status.failure:
                  return StateError(error: state.error);
              }
            },
          );

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  _checkWhetherTrainingRequestResponseBroughtSuccessfully(
          TrainingRequestResponseState current) =>
      current.status == Status.success;

  // TRAINING REQUEST CONVERSATION BY CHOSEN ATTRIBUTES ================================================================
  // CONSUMER ==========================================================================================================
  BlocConsumer<TrainingRequestConversationDynamicByChosenAttributesBloc,
          TrainingRequestConversationDynamicByChosenAttributesState>
      _listenAndBuildTrainingRequestConversationBroughtFromDBAfterCompletingProcessAboutTrainingRequestResponse() =>
          BlocConsumer<TrainingRequestConversationDynamicByChosenAttributesBloc,
              TrainingRequestConversationDynamicByChosenAttributesState>(
            listenWhen: (previous, current) => current.status == Status.success,
            listener: (context, trainingRequestState) {
              trainingRequestState
                      .trainingRequestConversationDynamicList.isEmpty
                  ? _sendAddingRequestForTrainingRequestConversation(context)
                  : _sendUpdatingRequestForTrainingRequestConversation(
                      context, trainingRequestState);
            },
            builder: (context, trainingRequestState) {
              switch (trainingRequestState.status) {
                case Status.initial:
                  return const StateLoading();
                case Status.loading:
                  return const StateLoading();
                case Status.success:
                  return _listenAndBuildTrainingRequestConversationBroughtFromDB();
                case Status.failure:
                  return StateError(error: trainingRequestState.error);
              }
            },
          );

  BlocConsumer<TrainingRequestConversationDynamicByChosenAttributesBloc,
          TrainingRequestConversationDynamicByChosenAttributesState>
      _listenAndBuildTrainingRequestConversationBroughtFromDB() => BlocConsumer<
              TrainingRequestConversationDynamicByChosenAttributesBloc,
              TrainingRequestConversationDynamicByChosenAttributesState>(
            listenWhen: (previous, current) => current.status == Status.success,
            listener: (context, state) {
              _recallTrainingRequestConversationDynamicByUserBloc(context);
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
  int? _findTrainingRequestResponseId(BuildContext context) => context
      .read<ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit>()
      .state
      .chosenTrainingRequestResponseDynamicWithDistanceList
      .last
      .trainingRequestResponseId;

  int _findTrainingRequestId(BuildContext context) => context
      .read<ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit>()
      .state
      .chosenTrainingRequestResponseDynamicWithDistanceList
      .last
      .trainingRequestDynamic
      .trainingRequestId!;

  int _findCoachId(BuildContext context) => context
      .read<ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit>()
      .state
      .chosenTrainingRequestResponseDynamicWithDistanceList
      .last
      .coachDynamic
      .coachId!;

  DateTime _findRequestedDate(BuildContext context) => context
      .read<ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit>()
      .state
      .chosenTrainingRequestResponseDynamicWithDistanceList
      .last
      .requestDate;

  DateTime? _findDeniedDate(BuildContext context) => context
      .read<ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit>()
      .state
      .chosenTrainingRequestResponseDynamicWithDistanceList
      .last
      .deniedDate;

  DateTime? _findApprovedDate(BuildContext context) => context
      .read<ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit>()
      .state
      .chosenTrainingRequestResponseDynamicWithDistanceList
      .last
      .approvedDate;

  DateTime _findDateTimeNow() => DateTime.now();

  // Activivty Conversation Updating -----------------------------------------------------------------------------------
  // Get Methods -------------------------------------------------------------------------------------------------------
  Iterable<TrainingRequestConversationDynamic>
      _getChosenTrainingRequestConversation(
    BuildContext context,
    TrainingRequestConversationDynamicByChosenAttributesState
        trainingRequestState,
  ) =>
          trainingRequestState.trainingRequestConversationDynamicList.where(
              (element) =>
                  element.trainingRequestResponseDynamic
                      .trainingRequestResponseId ==
                  _chosenTrainingRequestResponseId(context));

  // Chosen Methods ----------------------------------------------------------------------------------------------------
  int? _chosenTrainingRequestResponseId(BuildContext context) => context
      .read<ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit>()
      .state
      .chosenTrainingRequestResponseDynamicWithDistanceList
      .last
      .trainingRequestResponseId;

  // Find Methods ------------------------------------------------------------------------------------------------------
  int? _findTrainingRequestConversationIdForUpdating(
    BuildContext context,
    TrainingRequestConversationDynamicByChosenAttributesState
        trainingRequestState,
  ) =>
      _getChosenTrainingRequestConversation(context, trainingRequestState)
          .first
          .trainingRequestConversationId;

  int? _findTrainingRequestResponseIdForUpdating(
    BuildContext context,
    TrainingRequestConversationDynamicByChosenAttributesState
        trainingRequestState,
  ) =>
      _getChosenTrainingRequestConversation(context, trainingRequestState)
          .first
          .trainingRequestResponseDynamic
          .trainingRequestResponseId;

  int? _findConversationTypeIdForUpdating(
    BuildContext context,
    TrainingRequestConversationDynamicByChosenAttributesState
        trainingRequestState,
  ) =>
      _getChosenTrainingRequestConversation(context, trainingRequestState)
          .first
          .conversationTypeDynamic
          .conversationTypeId;

  DateTime _findDateOfParticipationForUpdating(
    BuildContext context,
    TrainingRequestConversationDynamicByChosenAttributesState
        trainingRequestState,
  ) =>
      _getChosenTrainingRequestConversation(context, trainingRequestState)
          .first
          .dateOfParticipation;

  DateTime? _findDeactivatedAtForUpdating(
    BuildContext context,
    TrainingRequestConversationDynamicByChosenAttributesState
        trainingRequestState,
  ) =>
      _getChosenTrainingRequestConversation(context, trainingRequestState)
          .first
          .deactivatedAt;

  // Datebase Methods --------------------------------------------------------------------------------------------------
  void _sendApprovingRequestForChosenCoach(BuildContext context) {
    context.read<TrainingRequestResponseBloc>().add(
        UpdateTrainingRequestResponseEvent(
            trainingRequestResponse: _approveTrainingRequestResponse(context)));
  }

  void _sendApprovingRequestForChosenCoachWhichWasDeniedBefore(
      BuildContext context) {
    context.read<TrainingRequestResponseBloc>().add(
        UpdateTrainingRequestResponseEvent(
            trainingRequestResponse: _approveTrainingRequestResponse(context)));
  }

  void _initiateTrainingRequestConversationProcess(BuildContext context) {
    context
        .read<TrainingRequestConversationDynamicByChosenAttributesBloc>()
        .add(LoadTrainingRequestConversationDynamicByChosenAttributesEvent(
            trainingRequestResponseId:
                _findTrainingRequestResponseId(context)!));
  }

  void _sendAddingRequestForTrainingRequestConversation(BuildContext context) {
    context.read<TrainingRequestConversationBloc>().add(
        AddTrainingRequestConversationEvent(
            trainingRequestConversation:
                _createTrainingRequestConversationInstance(context)));
  }

  void _sendUpdatingRequestForTrainingRequestConversation(
    BuildContext context,
    TrainingRequestConversationDynamicByChosenAttributesState
        trainingRequestState,
  ) {
    context.read<TrainingRequestConversationBloc>().add(
        UpdateTrainingRequestConversationEvent(
            trainingRequestConversation:
                _updateTrainingRequestConversationMakeItActiveAgain(
                    context, trainingRequestState)));
  }

  // Create Instance ---------------------------------------------------------------------------------------------------
  // Update Coach's status ---------------------------------------------------------------------------------------------
  TrainingRequestResponse _approveTrainingRequestResponse(
      BuildContext context) {
    final TrainingRequestResponse trainingRequestResponse =
        TrainingRequestResponse(
      trainingRequestResponseId: _findTrainingRequestResponseId(context),
      trainingRequestId: _findTrainingRequestId(context),
      processDetailId: _getProcessDetailId(context, 'Approved'),
      coachId: _findCoachId(context),
      requestDate: _findRequestedDate(context),
      approvedDate: _findDateTimeNow(),
      updatedDate: _findDateTimeNow(),
      deniedDate: _findDeniedDate(context),
      isDenied: false,
      isApproved: true,
      isActive: true,
    );
    return trainingRequestResponse; //OK
  }

  TrainingRequestConversation _createTrainingRequestConversationInstance(
      BuildContext context) {
    final TrainingRequestConversation trainingRequestConversation =
        TrainingRequestConversation(
      conversationTypeId: 2,
      trainingRequestResponseId: _findTrainingRequestResponseId(context)!,
      dateOfParticipation: _findDateTimeNow(),
    );
    return trainingRequestConversation;
  }

  TrainingRequestConversation
      _updateTrainingRequestConversationMakeItActiveAgain(
    BuildContext context,
    TrainingRequestConversationDynamicByChosenAttributesState
        trainingRequestState,
  ) {
    final TrainingRequestConversation trainingRequestConversation =
        TrainingRequestConversation(
      trainingRequestConversationId:
          _findTrainingRequestConversationIdForUpdating(
              context, trainingRequestState),
      trainingRequestResponseId: _findTrainingRequestResponseIdForUpdating(
          context, trainingRequestState)!,
      conversationTypeId:
          _findConversationTypeIdForUpdating(context, trainingRequestState)!,
      dateOfParticipation:
          _findDateOfParticipationForUpdating(context, trainingRequestState),
      deactivatedAt:
          _findDeactivatedAtForUpdating(context, trainingRequestState),
      updatedAt: _findDateTimeNow(),
      isActive: true,
    );
    return trainingRequestConversation;
  }

  // Recall Methods ----------------------------------------------------------------------------------------------------
  // For Creation ------------------------------------------------------------------------------------------------------
  void _recallTrainingRequestResponseDynamicWithDistanceRespopndedByCoachBloc(
      BuildContext context) {
    context
        .read<TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc>()
        .add(
            CleanTrainingRequestResponseDynamicWithDistanceByTrainingRequest());
    context
        .read<TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc>()
        .add(
            LoadTrainingRequestResponseDynamicWithDistanceByTrainingRequestEvent(
                trainingRequestId: _findTrainingRequestId(context), offset: 0));
  }

  // For Message -------------------------------------------------------------------------------------------------------
  void _recallTrainingRequestConversationDynamicByUserBloc(
      BuildContext context) {
    context
        .read<TrainingRequestConversationDynamicByUserBloc>()
        .add(RecallTrainingRequestConversationDynamicByUserEvent());
    context.read<TrainingRequestConversationDynamicByUserBloc>().add(
        LoadTrainingRequestConversationDynamicByUserEvent(
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
