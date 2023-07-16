import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenCoachWhoCreatedOfferBodyStartConversationButtonArea
    extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppTimeConstants _appTimeConstants = AppTimeConstants();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppTextConstants _appTextConstants = AppTextConstants();
  final AppInformationConstants _appInformationConstants =
      AppInformationConstants();

  final ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit
      chosenOfferAmongThoseWhoCreatedTrainingOfferCubit;

  ChosenCoachWhoCreatedOfferBodyStartConversationButtonArea({
    required this.chosenOfferAmongThoseWhoCreatedTrainingOfferCubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _createActionButtonArea(context);
  }

  /// CREATE ===========================================================================================================
  Column _createActionButtonArea(BuildContext context) => Column(
        children: [
          const CustomAppSizedBox(),
          _displayActionButton(context),
          const CustomAppSizedBox(height: 18),
        ],
      );

  /// DISPLAY ==========================================================================================================
  CustomElevatedButton _displayActionButton(
    BuildContext context,
  ) =>
      _checkWhetherTheConversationHasBeenStartedBefore(context)
          ? CustomElevatedButton(
              textlabel: 'Leave the Offer',
              buttonColor: _appColors.textColor,
              onPressed: () {
                _displayLeaveTheTrainingPopUp(context);
              })
          : CustomElevatedButton(
              textlabel: _appTextConstants.startConversation,
              buttonColor: _appColors.secondary,
              onPressed: () {
                _displayResponseTheOfferPopUp(context);
              });

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherTheConversationHasBeenStartedBefore(BuildContext context) =>
      context
          .read<
              TrainingOfferResponseDynamicWithDistanceByChosenAttributesBloc>()
          .state
          .trainingOfferResponseDynamicWithDistanceList
          .where((element) =>
              element.trainingOfferDynamic.trainingOfferId ==
              _findTrainingOfferId(context))
          .toList()
          .isNotEmpty;

  // LEAVE THE ACTIVITY ===============================================================================================
  // DISPLAY ===========================================================================================================
  void _displayLeaveTheTrainingPopUp(BuildContext context) {
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
        titleContent: 'Leave the Training Offer?',
        action: 'Leave',
        actionVoidCallBack: () async {
          _sendLeavingRequestTheChosenOffer(context);
          _displayLeavingOfferDialog(context);
        },
        cancelVoidCallBack: () {},
      );

  // DISPLAY ===========================================================================================================
  Future<dynamic> _displayLeavingOfferDialog(BuildContext context) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (dialogContext) {
            return _listenConsistedActivityBroughtFromDBAfterLeavingTheActivity();
          });

  // LISTEN ============================================================================================================
  BlocListener<TrainingOfferResponseBloc, TrainingOfferResponseState>
      _listenConsistedActivityBroughtFromDBAfterLeavingTheActivity() {
    return BlocListener<TrainingOfferResponseBloc, TrainingOfferResponseState>(
      listenWhen: (previous, current) =>
          _checkWhetherTrainingOfferResponseBroughtSuccessfully(current),
      listener: (context, state) {
        _recallTrainingOfferResponseDynamicWithDistanceByChosenAttributesBloc(
            context);
        context.read<TrainingOfferResponseDynamicRespondedByTraineeBloc>().add(
            LoadTrainingOfferResponseDynamicRespondedByTraineeEvent(
                traineeId: _appNumberConstants.appUserId));
      },
      child: _buildChosenTrainingOfferResponseBroughtFromDB(),
    );
  }

  // ATTEND THE OFFER ==================================================================================================
  // DISPLAY ===========================================================================================================
  void _displayResponseTheOfferPopUp(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return _checkWhetherExistingRespondedTrainingOfferMoreThanDailyLimit(
                  context)
              ? MembershipUpdating(
                  informationContent:
                      _appInformationConstants.kAboutFindACoachLimit)
              : _createRespondPopUp(context);
        });
  }

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherExistingRespondedTrainingOfferMoreThanDailyLimit(
          BuildContext context) =>
      _findNumberOfExistingRespondedTrainingOffer(context) >=
      _findLimitOfRespondingPerDay(context);

  // Find Methods ------------------------------------------------------------------------------------------------------
  int _findNumberOfExistingRespondedTrainingOffer(BuildContext context) =>
      context
          .read<
              TrainingOfferResponseDynamicWithDistanceByChosenAttributesBloc>()
          .state
          .trainingOfferResponseDynamicWithDistanceList
          .length;

  int _findLimitOfRespondingPerDay(BuildContext context) => context
      .read<UserDynamicBloc>()
      .state
      .userDynamicList
      .last
      .membershipTypeDynamic
      .limitOfAttendancePerDay;

  // RESPOND POP UP ====================================================================================================
  // CREATE ===========================================================================================================
  ActionPopUp _createRespondPopUp(BuildContext context) => ActionPopUp(
        titleContent: 'Respond the Training Offer?',
        action: 'Respond',
        actionVoidCallBack: () {
          _initiateRespondTheTrainingOfferProcess(context); //OK
          _displayRespondingTrainingOfferDialog(context);
        },
        cancelVoidCallBack: () {},
      );

  // DISPLAY ===========================================================================================================
  Future<dynamic> _displayRespondingTrainingOfferDialog(BuildContext context) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (dialogContext) {
            return _buildTrainingOfferResponseDynamicBroughtFromDB();
            //
            // BlocListener<
            //     TrainingOfferResponseDynamicByChosenAttributesBloc,
            //     TrainingOfferResponseDynamicByChosenAttributesState>(
            //   listener: (context, state) {
            //     state.trainingOfferResponseDynamicList.isEmpty
            //         ? _sendRespondingRequestTheChosenTrainingOffer(context)
            //         : _sendUpdatingRequestTheChosenTrainingOfferResponse(context);
            //   },
            //   child: _buildTrainingOfferResponseDynamicBroughtFromDB(),
            // );
          });

  // CONSUMER ==========================================================================================================
  BlocConsumer<TrainingOfferResponseDynamicByChosenAttributesBloc,
          TrainingOfferResponseDynamicByChosenAttributesState>
      _buildTrainingOfferResponseDynamicBroughtFromDB() {
    return BlocConsumer<TrainingOfferResponseDynamicByChosenAttributesBloc,
        TrainingOfferResponseDynamicByChosenAttributesState>(
      listener: (context, state) {
        state.trainingOfferResponseDynamicList.isEmpty
            ? _sendRespondingRequestTheChosenTrainingOffer(context)
            : _sendUpdatingRequestTheChosenTrainingOfferResponse(context); // OK
      },
      builder: (context, state) {
        switch (state.status) {
          case Status.initial:
            return const StateLoading();
          case Status.loading:
            return const StateLoading();
          case Status.success:
            return _listenTrainingOfferResponseBroughtFromDB();
          case Status.failure:
            return StateError(error: state.error);
        }
      },
    );
  }

  // LISTEN ============================================================================================================
  BlocListener<TrainingOfferResponseBloc, TrainingOfferResponseState>
      _listenTrainingOfferResponseBroughtFromDB() {
    return BlocListener<TrainingOfferResponseBloc, TrainingOfferResponseState>(
      listenWhen: (previous, current) =>
          _checkWhetherTrainingOfferResponseBroughtSuccessfully(current),
      listener: (context, state) {
        _recallTrainingOfferResponseDynamicWithDistanceByChosenAttributesBloc(
            context);
        context.read<TrainingOfferResponseDynamicRespondedByTraineeBloc>().add(
            LoadTrainingOfferResponseDynamicRespondedByTraineeEvent(
                traineeId: _appNumberConstants.appUserId));
        print(state.dbStatusList[0].message);
        // context
        //     .read<TrainingOfferConversationDynamicByChosenAttributesBloc>()
        //     .add(LoadTrainingOfferConversationDynamicByChosenAttributesEvent(
        //         trainingOfferResponseId: state.dbStatusList[0].id));
      },
      child: _buildChosenTrainingOfferResponseBroughtFromDB(),
    );
  }

  // BUILD =============================================================================================================
  BlocBuilder<TrainingOfferResponseBloc, TrainingOfferResponseState>
      _buildChosenTrainingOfferResponseBroughtFromDB() =>
          BlocBuilder<TrainingOfferResponseBloc, TrainingOfferResponseState>(
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return DBProcessLoader();
                case Status.loading:
                  return DBProcessLoader();
                case Status.success:
                  return _listenTrainingOfferConversationDynamicBroughtFromDB();
                case Status.failure:
                  return StateError(error: state.error);
              }
            },
          );

  // LISTEN ============================================================================================================
  BlocListener<TrainingOfferConversationDynamicByChosenAttributesBloc,
          TrainingOfferConversationDynamicByChosenAttributesState>
      _listenTrainingOfferConversationDynamicBroughtFromDB() => BlocListener<
              TrainingOfferConversationDynamicByChosenAttributesBloc,
              TrainingOfferConversationDynamicByChosenAttributesState>(
            listenWhen: (previous, current) => current.status == Status.success,
            listener: (context, state) =>
                state.trainingOfferConversationDynamicList.isEmpty
                    ? _sendConversationRequestTheChosenTrainingOffer(context)
                    : _sendUpdatingRequestTheChosenTrainingOfferConversation(
                        context, state),
            child: _buildTrainingOfferConversationDynamicBroughtFromDB(),
          );

  // BUILD =============================================================================================================
  BlocBuilder<TrainingOfferConversationDynamicByChosenAttributesBloc,
          TrainingOfferConversationDynamicByChosenAttributesState>
      _buildTrainingOfferConversationDynamicBroughtFromDB() => BlocBuilder<
              TrainingOfferConversationDynamicByChosenAttributesBloc,
              TrainingOfferConversationDynamicByChosenAttributesState>(
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return DBProcessLoader();
                case Status.loading:
                  return DBProcessLoader();
                case Status.success:
                  return _listenTrainingOfferConversationBroughtFromDB();
                case Status.failure:
                  return StateError(error: state.error);
              }
            },
          );

  // LISTEN ============================================================================================================
  BlocListener<TrainingOfferConversationBloc, TrainingOfferConversationState>
      _listenTrainingOfferConversationBroughtFromDB() => BlocListener<
              TrainingOfferConversationBloc, TrainingOfferConversationState>(
            listenWhen: (previous, current) => current.status == Status.success,
            listener: (context, state) => context
                .read<FindACoachConversationDynamicByTraineeBloc>()
                .add(LoadFindACoachConversationDynamicByTraineeEvent(
                    traineeId: _appNumberConstants.appUserId)),
            child: _buildTrainingOfferConversationBroughtFromDB(),
          );

  // BUILD =============================================================================================================
  BlocBuilder<TrainingOfferConversationBloc, TrainingOfferConversationState>
      _buildTrainingOfferConversationBroughtFromDB() => BlocBuilder<
              TrainingOfferConversationBloc, TrainingOfferConversationState>(
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
  // Check Methods -----------------------------------------------------------------------------------------------------
  _checkWhetherTrainingOfferResponseBroughtSuccessfully(
          TrainingOfferResponseState current) =>
      current.status == Status.success;

  // GENERAL METHODS ===================================================================================================
  // Get Methods -------------------------------------------------------------------------------------------------------
  int _getProcessDetailId(BuildContext context, String requestDetail) =>
      context
          .read<ProcessDetailDynamicBloc>()
          .state
          .processDetailDynamicList
          .indexWhere((element) => element.processName == requestDetail) +
      1;

  TrainingOfferDynamicWithDistance _getChosenTrainingOffer(
          BuildContext context) =>
      context
          .read<ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit>()
          .state
          .chosenTrainingOfferDynamicWithDistanceList
          .last;

  List<TrainingOfferResponseDynamicWithDistance>
      _getChosenTrainingOfferResponse(BuildContext context) => context
          .read<
              TrainingOfferResponseDynamicWithDistanceByChosenAttributesBloc>()
          .state
          .trainingOfferResponseDynamicWithDistanceList
          .where((element) =>
              element.trainingOfferDynamic.trainingOfferId ==
              _chosenTrainingOfferId(context))
          .toList();

  // Chosen Methods ----------------------------------------------------------------------------------------------------
  int? _chosenTrainingOfferId(BuildContext context) => context
      .read<ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit>()
      .state
      .chosenTrainingOfferDynamicWithDistanceList
      .last
      .trainingOfferId!;

  // Find Methods ------------------------------------------------------------------------------------------------------
  int _findTrainingOfferId(BuildContext context) =>
      _getChosenTrainingOffer(context).trainingOfferId!;

  int _findTrainingOfferResponseId(BuildContext context) =>
      _getChosenTrainingOfferResponse(context).last.trainingOfferResponseId!;

  DateTime _findRequestedDate(BuildContext context) =>
      _getChosenTrainingOfferResponse(context).last.requestDate;

  DateTime _findApprovedDate(BuildContext context) =>
      _getChosenTrainingOfferResponse(context).last.approvedDate!;

  int get _findTraineeId => _appNumberConstants.appUserId;

  int? _findTrainingOfferResponseIdForUpdating(BuildContext context) => context
      .read<TrainingOfferResponseDynamicByChosenAttributesBloc>()
      .state
      .trainingOfferResponseDynamicList
      .last
      .trainingOfferResponseId;

  int _findTrainingOfferIdForUpdating(BuildContext context) => context
      .read<TrainingOfferResponseDynamicByChosenAttributesBloc>()
      .state
      .trainingOfferResponseDynamicList
      .last
      .trainingOfferDynamic
      .trainingOfferId!;

  DateTime? _findRequestDateForUpdating(BuildContext context) => context
      .read<TrainingOfferResponseDynamicByChosenAttributesBloc>()
      .state
      .trainingOfferResponseDynamicList
      .last
      .requestDate;

  DateTime? _findApprovedDateForUpdating(BuildContext context) => context
      .read<TrainingOfferResponseDynamicByChosenAttributesBloc>()
      .state
      .trainingOfferResponseDynamicList
      .last
      .approvedDate;

  DateTime? _findRecallDateForUpdating(BuildContext context) => context
      .read<TrainingOfferResponseDynamicByChosenAttributesBloc>()
      .state
      .trainingOfferResponseDynamicList
      .last
      .recalledDate;

  DateTime? _findDeniedDateForUpdating(BuildContext context) => context
      .read<TrainingOfferResponseDynamicByChosenAttributesBloc>()
      .state
      .trainingOfferResponseDynamicList
      .last
      .deniedDate;

  DateTime _findDateTimeNow() => DateTime.now();

  String _findChosenTrainingOfferActivityTitle(BuildContext context) => context
      .read<ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit>()
      .state
      .chosenTrainingOfferDynamicWithDistanceList
      .last
      .trainingDetailDynamic
      .activityNameDynamic
      .activityTitle;

  // Datebase Methods --------------------------------------------------------------------------------------------------
  void _initiateRespondTheTrainingOfferProcess(BuildContext context) {
    context.read<TrainingOfferResponseDynamicByChosenAttributesBloc>().add(
        LoadTrainingOfferResponseDynamicByChosenAttributesEvent(
            trainingOfferId: _findTrainingOfferId(context),
            traineeId: _findTraineeId));
  }

  void _sendRespondingRequestTheChosenTrainingOffer(BuildContext context) {
    context.read<TrainingOfferResponseBloc>().add(AddTrainingOfferResponseEvent(
        trainingOfferResponse: _createTrainingOfferResponseInstance(context)));
  }

  void _sendUpdatingRequestTheChosenTrainingOfferResponse(
      BuildContext context) {
    context.read<TrainingOfferResponseBloc>().add(
        UpdateTrainingOfferResponseEvent(
            trainingOfferResponse:
                _updateTrainingOfferResponseMakeItActiveAgain(context)));
  }

  void _sendLeavingRequestTheChosenOffer(BuildContext context) {
    context.read<TrainingOfferResponseBloc>().add(
        UpdateTrainingOfferResponseEvent(
            trainingOfferResponse:
                _updateTrainingOfferResponseMakeItInactive(context)));
  }

  void _recallTrainingOfferResponseDynamicWithDistanceByChosenAttributesBloc(
      BuildContext context) {
    context
        .read<TrainingOfferResponseDynamicWithDistanceByChosenAttributesBloc>()
        .add(
            RecallTrainingOfferResponseDynamicWithDistanceByChosenAttributesEvent());
    context
        .read<TrainingOfferResponseDynamicWithDistanceByChosenAttributesBloc>()
        .add(
            LoadTrainingOfferResponseDynamicWithDistanceByChosenAttributesEvent(
                userId: _findTraineeId,
                activityTitle: _findChosenTrainingOfferActivityTitle(context)));
  }

  void _sendConversationRequestTheChosenTrainingOffer(BuildContext context) {
    context.read<TrainingOfferConversationBloc>().add(
        AddTrainingOfferConversationEvent(
            trainingOfferConversation:
                _createTrainingOfferConversationInstance(context)));
  }

  void _sendUpdatingRequestTheChosenTrainingOfferConversation(
    BuildContext context,
    TrainingOfferConversationDynamicByChosenAttributesState state,
  ) {
    context.read<TrainingOfferConversationBloc>().add(
        UpdateTrainingOfferConversationEvent(
            trainingOfferConversation:
                _updateTrainingOfferConversationMakeItActiveAgain(
                    context, state)));
  }

  // Create Instance ---------------------------------------------------------------------------------------------------
  TrainingOfferResponse _createTrainingOfferResponseInstance(
      BuildContext context) {
    final TrainingOfferResponse trainingOfferResponse = TrainingOfferResponse(
      trainingOfferId: _findTrainingOfferId(context),
      traineeId: _findTraineeId,
      processDetailId: _getProcessDetailId(context, 'Approved'),
      requestDate: _findDateTimeNow(),
      approvedDate: _findDateTimeNow(),
      updatedDate: _findDateTimeNow(),
      isDenied: false,
      isApproved: true,
      isActive: true,
    );
    return trainingOfferResponse;
  }

  TrainingOfferResponse _updateTrainingOfferResponseMakeItInactive(
      BuildContext context) {
    final TrainingOfferResponse trainingOfferResponse = TrainingOfferResponse(
      trainingOfferResponseId: _findTrainingOfferResponseId(context),
      trainingOfferId: _findTrainingOfferId(context),
      processDetailId: _getProcessDetailId(context, 'Recalled'),
      traineeId: _findTraineeId,
      requestDate: _findRequestedDate(context),
      approvedDate: _findApprovedDate(context),
      recalledDate: _findDateTimeNow(),
      updatedDate: _findDateTimeNow(),
      isDenied: false,
      isApproved: false,
      isActive: true,
    );
    return trainingOfferResponse;
  }

  TrainingOfferResponse _updateTrainingOfferResponseMakeItActiveAgain(
      BuildContext context) {
    final TrainingOfferResponse trainingOfferResponse = TrainingOfferResponse(
      trainingOfferResponseId: _findTrainingOfferResponseIdForUpdating(context),
      trainingOfferId: _findTrainingOfferIdForUpdating(context),
      processDetailId: _getProcessDetailId(context, 'Approved'),
      traineeId: _findTraineeId,
      requestDate: _findRequestDateForUpdating(context),
      approvedDate: _findDateTimeNow(),
      updatedDate: _findDateTimeNow(),
      recalledDate: _findRecallDateForUpdating(context),
      deniedDate: _findDeniedDateForUpdating(context),
      isDenied: false,
      isApproved: true,
      isActive: true,
    );
    return trainingOfferResponse;
  }

  TrainingOfferConversation _createTrainingOfferConversationInstance(
      BuildContext context) {
    final TrainingOfferConversation trainingOfferConversation =
        TrainingOfferConversation(
      conversationTypeId: 2,
      trainingOfferResponseId:1,
          // context.read<TrainingOfferResponseBloc>().state.dbStatusList[0].id,
      dateOfParticipation: _findDateTimeNow(),
      isActive: true,
    );
    return trainingOfferConversation;
  }

  TrainingOfferConversation _updateTrainingOfferConversationMakeItActiveAgain(
    BuildContext context,
    TrainingOfferConversationDynamicByChosenAttributesState state,
  ) {
    final TrainingOfferConversation trainingOfferConversation =
        TrainingOfferConversation(
      trainingOfferConversationId: state.trainingOfferConversationDynamicList
          .last.trainingOfferConversationId,
      conversationTypeId: 2,
      trainingOfferResponseId: state.trainingOfferConversationDynamicList.last
          .trainingOfferResponseDynamic.trainingOfferResponseId!,
      dateOfParticipation:
          state.trainingOfferConversationDynamicList.last.dateOfParticipation,
      updatedAt: _findDateTimeNow(),
      isActive: true,
    );

    return trainingOfferConversation;
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
