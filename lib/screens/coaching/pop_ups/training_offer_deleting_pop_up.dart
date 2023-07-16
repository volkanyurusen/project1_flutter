import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/widgets/widget.dart';

class TrainingOfferDeletingPopUp extends StatelessWidget {
  final AppTimeConstants _appTimeConstants = AppTimeConstants();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();

  TrainingOfferDeletingPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionPopUp(
      action: 'Leave',
      titleContent: 'Leave The Training?',
      actionVoidCallBack: () {
        _updateChosenTrainingOfferMakeItInactive(context);
        _displayLeavingTrainingOfferDialog(context);
      },
      cancelVoidCallBack: () {},
    );
  }

  // DISPLAY ===========================================================================================================
  Future<dynamic> _displayLeavingTrainingOfferDialog(BuildContext context) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (dialogContext) {
            return _listenAndBuildTrainingOfferBroughtFromDBAfterLeavingTheTrainingOffer();
          });

  // CONSUMER ==========================================================================================================
  BlocConsumer<TrainingOfferBloc, TrainingOfferState>
      _listenAndBuildTrainingOfferBroughtFromDBAfterLeavingTheTrainingOffer() =>
          BlocConsumer<TrainingOfferBloc, TrainingOfferState>(
            listenWhen: (previous, current) =>
                _checkWhetherTrainingOfferBroughtSuccessfully(current),
            listener: (context, state) {
              _recallTrainingOfferDynamicOfferedByCoachBloc(context);
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
  _checkWhetherTrainingOfferBroughtSuccessfully(
          TrainingOfferState current) =>
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
  List<TrainingOfferDynamic> _getChosenTrainingOffer(
          BuildContext context) =>
      context
          .read<TrainingOfferDynamicOfferedByCoachBloc>()
          .state
          .trainingOfferDynamicList
          .where((element) =>
              element.trainingOfferId ==
              _findChosenTrainingOfferId(context))
          .toList();

  TrainingOfferDynamic _getTrainingOffer(BuildContext context) => context
      .read<ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit>()
      .state
      .chosenTrainingOfferDynamicList
      .last;

  // Find Methods ------------------------------------------------------------------------------------------------------
  int _findTrainingOfferId(BuildContext context) =>
      _getChosenTrainingOffer(context).last.trainingOfferId!;

  int _findChosenTrainingOfferId(BuildContext context) =>
      _getTrainingOffer(context).trainingOfferId!;

  int _findTrainingDetailId(BuildContext context) =>
      _getChosenTrainingOffer(context)
          .last
          .trainingDetailDynamic
          .trainingDetailId!;

  int _findLocationDetailId(BuildContext context) =>
      _getChosenTrainingOffer(context)
          .last.coachingLocationDetailDynamic
          .coachingLocationDetailId!;

  int get _findCoachId => _appNumberConstants.appCoachId;

  DateTime _findOfferedDate(BuildContext context) =>
      _getChosenTrainingOffer(context).last.createdAt;

  DateTime _findDateTimeNow() => DateTime.now();

  // Datebase Methods --------------------------------------------------------------------------------------------------
  void _updateChosenTrainingOfferMakeItInactive(BuildContext context) {
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

  // Create Instance ---------------------------------------------------------------------------------------------------
  TrainingOffer _updateTrainingOfferInstance(BuildContext context) {
    final TrainingOffer trainingOffer = TrainingOffer(
      trainingOfferId: _findTrainingOfferId(context),
      coachId: _findCoachId,
      trainingDetailId: _findTrainingDetailId(context),
      coachingLocationDetailId: _findLocationDetailId(context),
      createdAt: _findOfferedDate(context),
      deactivatedAt: _findDateTimeNow(),
      updatedAt: _findDateTimeNow(),
      isActive: false,
    );
    return trainingOffer;
  }

  // Screen Method -----------------------------------------------------------------------------------------------------
  void _closePopUp(BuildContext context) {
    int pageCount = 0;
    Navigator.of(context).popUntil((_) => pageCount++ >= 3);
  }
}
