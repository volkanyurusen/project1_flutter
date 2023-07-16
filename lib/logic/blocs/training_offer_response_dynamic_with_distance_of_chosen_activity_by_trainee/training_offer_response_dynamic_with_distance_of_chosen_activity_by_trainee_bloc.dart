import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_offer_response_dynamic_with_distance_of_chosen_activity_by_trainee_event.dart';
part 'training_offer_response_dynamic_with_distance_of_chosen_activity_by_trainee_state.dart';

class TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc
    extends Bloc<
        TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeEvent,
        TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState> {
  final Repositories _repositories = Repositories();

  TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc()
      : super(
            const TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState(
                status: StatusWithoutLoading.initial)) {
    on<LoadTrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeEvent>(
        _onLoadTrainingOfferResponseDynamicWithDistanceOfChosenActivityByTrainee);
    on<CleanTrainingOfferResponseDynamicWithDistanceOfChosenActivityByTrainee>(
        _onCleanTrainingOfferResponseDynamicWithDistanceOfChosenActivityByTrainee);
  }

  FutureOr<void>
      _onLoadTrainingOfferResponseDynamicWithDistanceOfChosenActivityByTrainee(
          event,
          Emitter<TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState>
              emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeListResponses =
            await _repositories
                .getTrainingOfferResponseDynamicWithDistanceDataOfChosenActivityByTrainee(
                    event.traineeId, event.activityNameId, event.offset);
        return trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeListResponses
                    .isEmpty ||
                trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeListResponses
                        .length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingOfferResponseDynamicWithDistanceList:
                    trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeListResponses,
                hasReachedMax: true))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingOfferResponseDynamicWithDistanceList:
                    trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeListResponses,
                hasReachedMax: false));
      }
      final trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeListResponses =
          await _repositories
              .getTrainingOfferResponseDynamicWithDistanceDataOfChosenActivityByTrainee(
                  event.traineeId, event.activityNameId, event.offset);
      trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeListResponses
                  .isEmpty ||
              trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeListResponses
                      .length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingOfferResponseDynamicWithDistanceList: List.of(
                  state.trainingOfferResponseDynamicWithDistanceList)
                ..addAll(
                    trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeListResponses),
              hasReachedMax: true))
          : emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingOfferResponseDynamicWithDistanceList: List.of(
                  state.trainingOfferResponseDynamicWithDistanceList)
                ..addAll(
                    trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeListResponses),
              hasReachedMax: false,
            ));
    } catch (e) {
      TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState(
          status: StatusWithoutLoading.failure, error: e.toString());
    }
  }

  void _onCleanTrainingOfferResponseDynamicWithDistanceOfChosenActivityByTrainee(
      CleanTrainingOfferResponseDynamicWithDistanceOfChosenActivityByTrainee
          event,
      Emitter<TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState>
          emit) {
    emit(state.copyWith(
        status: StatusWithoutLoading.initial,
        trainingOfferResponseDynamicWithDistanceList: List.of(
            state.trainingOfferResponseDynamicWithDistanceList..clear()),
        hasReachedMax: false));
  }
}


  // FutureOr<void> _onLoadTrainingOfferResponseDynamicWithDistanceOfChosenActivityByTrainee(
  //     event,
  //     Emitter<TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState>
  //         emit) async {
  //   emit(const TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState(
  //       status: Status.loading));

  //   try {
  //     final trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeListResponses =
  //         await _repositories
  //             .getTrainingOfferResponseDynamicWithDistanceDataOfChosenActivityByTrainee(
  //                 event.traineeId);
  //     emit(
  //       state.copyWith(
  //           status: Status.success,
  //           trainingOfferResponseDynamicWithDistanceByTrainingOfferList:
  //               trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeListResponses),
  //     );
  //   } catch (e) {
  //     TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState(
  //         status: Status.failure, error: e.toString());
  //   }
  // }