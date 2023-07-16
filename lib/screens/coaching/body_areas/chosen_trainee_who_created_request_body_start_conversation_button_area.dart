import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenCoachWhoCreatedRequestBodyStartConversationButtonArea
    extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppTimeConstants _appTimeConstants = AppTimeConstants();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppTextConstants _appTextConstants = AppTextConstants();
  final AppInformationConstants _appInformationConstants =
      AppInformationConstants();

  final ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit
      chosenRequestAmongThoseWhoCreatedTrainingRequestCubit;

  ChosenCoachWhoCreatedRequestBodyStartConversationButtonArea({
    required this.chosenRequestAmongThoseWhoCreatedTrainingRequestCubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _createActionButtonArea(context);
  }

  /// CREATE ===========================================================================================================
  Column _createActionButtonArea(BuildContext context) => Column(
        children: [
          CustomAppDivider(height: 0),
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
              textlabel: 'Leave the Request',
              buttonColor: _appColors.textColor,
              onPressed: () {
                _displayLeaveTheTrainingPopUp(context);
              })
          : CustomElevatedButton(
              textlabel: _appTextConstants.startConversation,
              buttonColor: _appColors.secondary,
              onPressed: () {
                _displayResponseTheRequestPopUp(context);
              });

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherTheConversationHasBeenStartedBefore(BuildContext context) =>
      context
          .read<
              TrainingRequestResponseDynamicWithDistanceByChosenAttributesBloc>()
          .state
          .trainingRequestResponseDynamicWithDistanceList
          .where((element) =>
              element.trainingRequestDynamic.trainingRequestId ==
              _findTrainingRequestId(context))
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
        titleContent: 'Leave the Training Request?',
        action: 'Leave',
        actionVoidCallBack: () async {
          _sendLeavingRequestTheChosenRequest(context);
          _displayLeavingRequestDialog(context);
        },
        cancelVoidCallBack: () {},
      );

  // DISPLAY ===========================================================================================================
  Future<dynamic> _displayLeavingRequestDialog(BuildContext context) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (dialogContext) {
            return _listenConsistedActivityBroughtFromDBAfterLeavingTheActivity();
          });

  // LISTEN ============================================================================================================
  BlocListener<TrainingRequestResponseBloc, TrainingRequestResponseState>
      _listenConsistedActivityBroughtFromDBAfterLeavingTheActivity() {
    return BlocListener<TrainingRequestResponseBloc,
        TrainingRequestResponseState>(
      listenWhen: (previous, current) =>
          _checkWhetherTrainingRequestResponseBroughtSuccessfully(current),
      listener: (context, state) {
        _recallTrainingRequestResponseDynamicWithDistanceByChosenAttributesBloc(
            context);
      },
      child: _buildChosenTrainingRequestResponseBroughtFromDB(),
    );
  }

  // ATTEND THE REQUEST ================================================================================================
  // DISPLAY ===========================================================================================================
  void _displayResponseTheRequestPopUp(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return _checkWhetherExistingRespondedTrainingRequestMoreThanDailyLimit(
                  context)
              ? CoachingTypeUpdating(
                  informationContent:
                      _appInformationConstants.kAboutFindATraineeLimit)
              : _createRespondPopUp(context);
        });
  }

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherExistingRespondedTrainingRequestMoreThanDailyLimit(
          BuildContext context) =>
      _findNumberOfExistingRespondedTrainingRequest(context) >=
      _findLimitOfRespondingPerDay(context);

  // Find Methods ------------------------------------------------------------------------------------------------------
  int _findNumberOfExistingRespondedTrainingRequest(BuildContext context) =>
      context
          .read<
              TrainingRequestResponseDynamicWithDistanceByChosenAttributesBloc>()
          .state
          .trainingRequestResponseDynamicWithDistanceList
          .length;

  int _findLimitOfRespondingPerDay(BuildContext context) => context
      .read<CoachDynamicBloc>()
      .state
      .coachDynamicList
      .last
      .coachingTypeDynamic
      .creatingTrainingLimitPerDay;

  // RESPOND POP UP ====================================================================================================
  // CREATE ===========================================================================================================
  ActionPopUp _createRespondPopUp(BuildContext context) => ActionPopUp(
        titleContent: 'Respond the Training Request?',
        action: 'Respond',
        actionVoidCallBack: () {
          _initiateRespondTheTrainingRequestProcess(context);
          _displayRespondingTrainingRequestDialog(context);
        },
        cancelVoidCallBack: () {},
      );

  // DISPLAY ===========================================================================================================
  Future<dynamic> _displayRespondingTrainingRequestDialog(
          BuildContext context) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (dialogContext) {
            return _buildTrainingRequestResponseDynamicBroughtFromDB();
            //
            // BlocListener<
            //     TrainingRequestResponseDynamicByChosenAttributesBloc,
            //     TrainingRequestResponseDynamicByChosenAttributesState>(
            //   listener: (context, state) {
            //     state.trainingRequestResponseDynamicList.isEmpty
            //         ? _sendRespondingRequestTheChosenTrainingRequest(context)
            //         : _sendUpdatingRequestTheChosenTrainingRequestResponse(context);
            //   },
            //   child: _buildTrainingRequestResponseDynamicBroughtFromDB(),
            // );
          });

  // CONSUMER ==========================================================================================================
  BlocConsumer<TrainingRequestResponseDynamicByChosenAttributesBloc,
          TrainingRequestResponseDynamicByChosenAttributesState>
      _buildTrainingRequestResponseDynamicBroughtFromDB() {
    return BlocConsumer<TrainingRequestResponseDynamicByChosenAttributesBloc,
        TrainingRequestResponseDynamicByChosenAttributesState>(
      listener: (context, state) {
        state.trainingRequestResponseDynamicList.isEmpty
            ? _sendRespondingRequestTheChosenTrainingRequest(context)
            : _sendUpdatingRequestTheChosenTrainingRequestResponse(context);
      },
      builder: (context, state) {
        switch (state.status) {
          case Status.initial:
            return const StateLoading();
          case Status.loading:
            return const StateLoading();
          case Status.success:
            return _listenTrainingRequestResponseBroughtFromDB();
          case Status.failure:
            return StateError(error: state.error);
        }
      },
    );
  }

  // LISTEN ============================================================================================================
  BlocListener<TrainingRequestResponseBloc, TrainingRequestResponseState>
      _listenTrainingRequestResponseBroughtFromDB() {
    return BlocListener<TrainingRequestResponseBloc,
        TrainingRequestResponseState>(
      listenWhen: (previous, current) =>
          _checkWhetherTrainingRequestResponseBroughtSuccessfully(current),
      listener: (context, state) {
        _recallTrainingRequestResponseDynamicWithDistanceByChosenAttributesBloc(
            context);
      },
      child: _buildChosenTrainingRequestResponseBroughtFromDB(),
    );
  }

  // BUILD =============================================================================================================
  BlocBuilder<TrainingRequestResponseBloc, TrainingRequestResponseState>
      _buildChosenTrainingRequestResponseBroughtFromDB() => BlocBuilder<
              TrainingRequestResponseBloc, TrainingRequestResponseState>(
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
  _checkWhetherTrainingRequestResponseBroughtSuccessfully(
          TrainingRequestResponseState current) =>
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

  TrainingRequestDynamicWithDistance _getChosenTrainingRequest(
          BuildContext context) =>
      context
          .read<ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit>()
          .state
          .chosenTrainingRequestDynamicWithDistanceList
          .last;

  List<TrainingRequestResponseDynamicWithDistance>
      _getChosenTrainingRequestResponse(BuildContext context) => context
          .read<
              TrainingRequestResponseDynamicWithDistanceByChosenAttributesBloc>()
          .state
          .trainingRequestResponseDynamicWithDistanceList
          .where((element) =>
              element.trainingRequestDynamic.trainingRequestId ==
              _chosenTrainingRequestId(context))
          .toList();

  // Chosen Methods ----------------------------------------------------------------------------------------------------
  int? _chosenTrainingRequestId(BuildContext context) => context
      .read<ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit>()
      .state
      .chosenTrainingRequestDynamicWithDistanceList
      .last
      .trainingRequestId!;

  // Find Methods ------------------------------------------------------------------------------------------------------
  int _findTrainingRequestId(BuildContext context) =>
      _getChosenTrainingRequest(context).trainingRequestId!;

  int _findTrainingRequestResponseId(BuildContext context) =>
      _getChosenTrainingRequestResponse(context)
          .last
          .trainingRequestResponseId!;

  DateTime _findRequestedDate(BuildContext context) =>
      _getChosenTrainingRequestResponse(context).last.requestDate;

  int get _findCoachId => _appNumberConstants.appCoachId;

  int get _findCoachUserId => _appNumberConstants.appUserId;

  int? _findTrainingRequestResponseIdForUpdating(BuildContext context) =>
      context
          .read<TrainingRequestResponseDynamicByChosenAttributesBloc>()
          .state
          .trainingRequestResponseDynamicList
          .last
          .trainingRequestResponseId;

  int _findTrainingRequestIdForUpdating(BuildContext context) => context
      .read<TrainingRequestResponseDynamicByChosenAttributesBloc>()
      .state
      .trainingRequestResponseDynamicList
      .last
      .trainingRequestDynamic
      .trainingRequestId!;

  DateTime? _findRequestDateForUpdating(BuildContext context) => context
      .read<TrainingRequestResponseDynamicByChosenAttributesBloc>()
      .state
      .trainingRequestResponseDynamicList
      .last
      .requestDate;

  DateTime? _findApprovedDateForUpdating(BuildContext context) => context
      .read<TrainingRequestResponseDynamicByChosenAttributesBloc>()
      .state
      .trainingRequestResponseDynamicList
      .last
      .approvedDate;

  DateTime? _findRecallDateForUpdating(BuildContext context) => context
      .read<TrainingRequestResponseDynamicByChosenAttributesBloc>()
      .state
      .trainingRequestResponseDynamicList
      .last
      .recalledDate;

  DateTime? _findDeniedDateForUpdating(BuildContext context) => context
      .read<TrainingRequestResponseDynamicByChosenAttributesBloc>()
      .state
      .trainingRequestResponseDynamicList
      .last
      .deniedDate;

  DateTime _findDateTimeNow() => DateTime.now();

  String _findChosenTrainingRequestActivityTitle(BuildContext context) =>
      context
          .read<ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit>()
          .state
          .chosenTrainingRequestDynamicWithDistanceList
          .last
          .trainingDetailDynamic
          .activityNameDynamic
          .activityTitle;

  // Datebase Methods --------------------------------------------------------------------------------------------------
  void _initiateRespondTheTrainingRequestProcess(BuildContext context) {
    context.read<TrainingRequestResponseDynamicByChosenAttributesBloc>().add(
        LoadTrainingRequestResponseDynamicByChosenAttributesEvent(
            trainingRequestId: _findTrainingRequestId(context),
            coachId: _findCoachId));
  }

  void _sendRespondingRequestTheChosenTrainingRequest(BuildContext context) {
    context.read<TrainingRequestResponseBloc>().add(
        AddTrainingRequestResponseEvent(
            trainingRequestResponse:
                _createTrainingRequestResponseInstance(context)));
  }

  void _sendUpdatingRequestTheChosenTrainingRequestResponse(
      BuildContext context) {
    context.read<TrainingRequestResponseBloc>().add(
        UpdateTrainingRequestResponseEvent(
            trainingRequestResponse:
                _updateTrainingRequestResponseMakeItActiveAgain(context)));
  }

  void _sendLeavingRequestTheChosenRequest(BuildContext context) {
    context.read<TrainingRequestResponseBloc>().add(
        UpdateTrainingRequestResponseEvent(
            trainingRequestResponse:
                _updateTrainingRequestResponseMakeItInactive(context)));
  }

  void _recallTrainingRequestResponseDynamicWithDistanceByChosenAttributesBloc(
      BuildContext context) {
    context
        .read<
            TrainingRequestResponseDynamicWithDistanceByChosenAttributesBloc>()
        .add(
            RecallTrainingRequestResponseDynamicWithDistanceByChosenAttributesEvent());
    context
        .read<
            TrainingRequestResponseDynamicWithDistanceByChosenAttributesBloc>()
        .add(
            LoadTrainingRequestResponseDynamicWithDistanceByChosenAttributesEvent(
                coachUserId: _findCoachUserId,
                activityTitle:
                    _findChosenTrainingRequestActivityTitle(context)));
  }

  // Create Instance ---------------------------------------------------------------------------------------------------
  TrainingRequestResponse _createTrainingRequestResponseInstance(
      BuildContext context) {
    final TrainingRequestResponse trainingRequestResponse =
        TrainingRequestResponse(
      trainingRequestId: _findTrainingRequestId(context),
      coachId: _findCoachId,
      processDetailId: _getProcessDetailId(context, 'Requested'),
      requestDate: _findDateTimeNow(),
    );
    return trainingRequestResponse;
  }

  TrainingRequestResponse _updateTrainingRequestResponseMakeItInactive(
      BuildContext context) {
    final TrainingRequestResponse trainingRequestResponse =
        TrainingRequestResponse(
      trainingRequestResponseId: _findTrainingRequestResponseId(context),
      trainingRequestId: _findTrainingRequestId(context),
      processDetailId: _getProcessDetailId(context, 'Recalled'),
      coachId: _findCoachId,
      requestDate: _findRequestedDate(context),
      recalledDate: _findDateTimeNow(),
      updatedDate: _findDateTimeNow(),
      isActive: false,
    );
    return trainingRequestResponse;
  }

  TrainingRequestResponse _updateTrainingRequestResponseMakeItActiveAgain(
      BuildContext context) {
    final TrainingRequestResponse trainingRequestResponse =
        TrainingRequestResponse(
      trainingRequestResponseId:
          _findTrainingRequestResponseIdForUpdating(context),
      trainingRequestId: _findTrainingRequestIdForUpdating(context),
      processDetailId: _getProcessDetailId(context, 'Requested'),
      coachId: _findCoachId,
      requestDate: _findRequestDateForUpdating(context),
      approvedDate: _findApprovedDateForUpdating(context),
      updatedDate: _findDateTimeNow(),
      recalledDate: _findRecallDateForUpdating(context),
      deniedDate: _findDeniedDateForUpdating(context),
      isActive: true,
    );
    return trainingRequestResponse;
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
