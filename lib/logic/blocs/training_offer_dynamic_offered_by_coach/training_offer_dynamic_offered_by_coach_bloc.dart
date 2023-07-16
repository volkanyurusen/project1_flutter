import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_offer_dynamic_offered_by_coach_event.dart';
part 'training_offer_dynamic_offered_by_coach_state.dart';

class TrainingOfferDynamicOfferedByCoachBloc extends Bloc<
    TrainingOfferDynamicOfferedByCoachEvent,
    TrainingOfferDynamicOfferedByCoachState> {
  final Repositories _repositories = Repositories();

  TrainingOfferDynamicOfferedByCoachBloc()
      : super(const TrainingOfferDynamicOfferedByCoachState(
            status: StatusWithoutLoading.initial)) {
    on<LoadTrainingOfferDynamicOfferedByCoachEvent>(
        _onLoadTrainingOfferDynamicOfferedByCoach);
    on<RecallTrainingOfferDynamicOfferedByCoachEvent>(
        _onRecallTrainingOfferDynamicOfferedByCoach);
  }

  FutureOr<void> _onLoadTrainingOfferDynamicOfferedByCoach(
      event, Emitter<TrainingOfferDynamicOfferedByCoachState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final trainingOfferDynamicOfferedByCoachListResponses =
            await _repositories.getTrainingOfferDynamicDataOfferedByCoach(
                event.coachId, event.offset);
        return trainingOfferDynamicOfferedByCoachListResponses.isEmpty ||
                trainingOfferDynamicOfferedByCoachListResponses.length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingOfferDynamicList:
                    trainingOfferDynamicOfferedByCoachListResponses,
                hasReachedMax: true))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingOfferDynamicList:
                    trainingOfferDynamicOfferedByCoachListResponses,
                hasReachedMax: false));
      }
      final trainingOfferDynamicOfferedByCoachListResponses =
          await _repositories.getTrainingOfferDynamicDataOfferedByCoach(
              event.coachId, event.offset);
      trainingOfferDynamicOfferedByCoachListResponses.isEmpty ||
              trainingOfferDynamicOfferedByCoachListResponses.length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingOfferDynamicList: List.of(state.trainingOfferDynamicList)
                ..addAll(trainingOfferDynamicOfferedByCoachListResponses),
              hasReachedMax: true))
          : emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingOfferDynamicList: List.of(state.trainingOfferDynamicList)
                ..addAll(trainingOfferDynamicOfferedByCoachListResponses),
              hasReachedMax: false));
    } catch (e) {
      TrainingOfferDynamicOfferedByCoachState(
          status: StatusWithoutLoading.failure, error: e.toString());
    }
  }

  FutureOr<void> _onRecallTrainingOfferDynamicOfferedByCoach(
      RecallTrainingOfferDynamicOfferedByCoachEvent event,
      Emitter<TrainingOfferDynamicOfferedByCoachState> emit) {
    emit(state.copyWith(
        status: StatusWithoutLoading.success,
        trainingOfferDynamicList: List.of(state.trainingOfferDynamicList)
          ..clear(),
        hasReachedMax: false));
  }
}
