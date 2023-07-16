// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/widgets/widget.dart';

class TrainingRequestDeletingPopUp extends StatelessWidget {
  final AppTimeConstants _appTimeConstants = AppTimeConstants();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();

  TrainingRequestDeletingPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionPopUp(
      action: 'Leave',
      titleContent: 'Leave The Activity?',
      actionVoidCallBack: () {
        _updateChosenTrainingRequestMakeItInactive(context);
        _displayLeavingTrainingRequestDialog(context);
      },
      cancelVoidCallBack: () {},
    );
  }

  // DISPLAY ===========================================================================================================
  Future<dynamic> _displayLeavingTrainingRequestDialog(BuildContext context) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (dialogContext) {
            return _listenAndBuildTrainingRequestBroughtFromDBAfterLeavingTheTrainingRequest();
          });

  // CONSUMER ==========================================================================================================
  BlocConsumer<TrainingRequestBloc, TrainingRequestState>
      _listenAndBuildTrainingRequestBroughtFromDBAfterLeavingTheTrainingRequest() =>
          BlocConsumer<TrainingRequestBloc, TrainingRequestState>(
            listenWhen: (previous, current) =>
                _checkWhetherTrainingRequestBroughtSuccessfully(current),
            listener: (context, state) {
              _recallTrainingRequestDynamicRequestedByUserBloc(context);
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
  _checkWhetherTrainingRequestBroughtSuccessfully(
          TrainingRequestState current) =>
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
  List<TrainingRequestDynamic> _getChosenTrainingRequest(
          BuildContext context) =>
      context
          .read<TrainingRequestDynamicRequestedByUserBloc>()
          .state
          .trainingRequestDynamicList
          .where((element) =>
              element.trainingRequestId ==
              _findChosenTrainingRequestId(context))
          .toList();

  TrainingRequestDynamic _getTrainingRequest(BuildContext context) => context
      .read<ChosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit>()
      .state
      .chosenTrainingRequestDynamicList
      .last;

  // Find Methods ------------------------------------------------------------------------------------------------------
  int _findTrainingRequestId(BuildContext context) =>
      _getChosenTrainingRequest(context).last.trainingRequestId!;

  int _findChosenTrainingRequestId(BuildContext context) =>
      _getTrainingRequest(context).trainingRequestId!;

  int _findTrainingDetailId(BuildContext context) =>
      _getChosenTrainingRequest(context)
          .last
          .trainingDetailDynamic
          .trainingDetailId!;

  int _findLocationDetailId(BuildContext context) =>
      _getChosenTrainingRequest(context)
          .last
          .locationDetailDynamic
          .locationDetailId!;

  int get _findTrainingRequesterId => _appNumberConstants.appUserId;

  DateTime _findRequestedDate(BuildContext context) =>
      _getChosenTrainingRequest(context).last.createdAt;

  DateTime _findDateTimeNow() => DateTime.now();

  // Datebase Methods --------------------------------------------------------------------------------------------------
  void _updateChosenTrainingRequestMakeItInactive(BuildContext context) {
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

  // Create Instance ---------------------------------------------------------------------------------------------------
  TrainingRequest _updateTrainingRequestInstance(BuildContext context) {
    final TrainingRequest trainingRequest = TrainingRequest(
      trainingRequestId: _findTrainingRequestId(context),
      trainingRequesterId: _findTrainingRequesterId,
      trainingDetailId: _findTrainingDetailId(context),
      locationDetailId: _findLocationDetailId(context),
      createdAt: _findRequestedDate(context),
      deactivatedAt: _findDateTimeNow(),
      updatedAt: _findDateTimeNow(),
      isActive: false,
    );
    return trainingRequest;
  }

  // Screen Method -----------------------------------------------------------------------------------------------------
  void _closePopUp(BuildContext context) {
    int pageCount = 0;
    Navigator.of(context).popUntil((_) => pageCount++ >= 3);
  }
}
