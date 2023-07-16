import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_offer_response_dynamic_responded_by_trainee_event.dart';
part 'training_offer_response_dynamic_responded_by_trainee_state.dart';

class TrainingOfferResponseDynamicRespondedByTraineeBloc extends Bloc<
    TrainingOfferResponseDynamicRespondedByTraineeEvent,
    TrainingOfferResponseDynamicRespondedByTraineeState> {
  final Repositories _repositories = Repositories();

  TrainingOfferResponseDynamicRespondedByTraineeBloc()
      : super(const TrainingOfferResponseDynamicRespondedByTraineeState(
            status: StatusWithoutLoading.initial)) {
    on<LoadTrainingOfferResponseDynamicRespondedByTraineeEvent>(
        _onLoadTrainingOfferResponseDynamicRespondedByTrainee);
    on<RecallTrainingOfferResponseDynamicRespondedByTraineeEvent>(
        _onRecallTrainingOfferResponseDynamicRespondedByTrainee);
  }

  FutureOr<void> _onLoadTrainingOfferResponseDynamicRespondedByTrainee(event,
      Emitter<TrainingOfferResponseDynamicRespondedByTraineeState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final trainingOfferResponseDynamicRespondedByTraineeListResponses =
            await _repositories
                .getTrainingOfferResponseDynamicDataRespondedByTrainee(
                    event.traineeId, event.offset);
        return trainingOfferResponseDynamicRespondedByTraineeListResponses
                    .isEmpty ||
                trainingOfferResponseDynamicRespondedByTraineeListResponses
                        .length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingOfferResponseDynamicList:
                    trainingOfferResponseDynamicRespondedByTraineeListResponses,
                hasReachedMax: true))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingOfferResponseDynamicList:
                    trainingOfferResponseDynamicRespondedByTraineeListResponses,
                hasReachedMax: false));
      }
      final trainingOfferResponseDynamicRespondedByTraineeListResponses =
          await _repositories
              .getTrainingOfferResponseDynamicDataRespondedByTrainee(
                  event.traineeId, event.offset);
      trainingOfferResponseDynamicRespondedByTraineeListResponses.isEmpty ||
              trainingOfferResponseDynamicRespondedByTraineeListResponses
                      .length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingOfferResponseDynamicList: List.of(
                  state.trainingOfferResponseDynamicList)
                ..addAll(
                    trainingOfferResponseDynamicRespondedByTraineeListResponses),
              hasReachedMax: true))
          : emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingOfferResponseDynamicList: List.of(
                  state.trainingOfferResponseDynamicList)
                ..addAll(
                    trainingOfferResponseDynamicRespondedByTraineeListResponses),
              hasReachedMax: false));
    } catch (e) {
      TrainingOfferDynamicOfferedByCoachState(
          status: StatusWithoutLoading.failure, error: e.toString());
    }
  }

  FutureOr<void> _onRecallTrainingOfferResponseDynamicRespondedByTrainee(
      RecallTrainingOfferResponseDynamicRespondedByTraineeEvent event,
      Emitter<TrainingOfferResponseDynamicRespondedByTraineeState> emit) {
    emit(state.copyWith(
        status: StatusWithoutLoading.success,
        trainingOfferResponseDynamicList:
            List.of(state.trainingOfferResponseDynamicList)..clear(),
        hasReachedMax: false));
  }
}
