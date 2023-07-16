import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_request_response_dynamic_with_distance_by_training_request_event.dart';
part 'training_request_response_dynamic_with_distance_by_training_request_state.dart';

class TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc
    extends Bloc<
        TrainingRequestResponseDynamicWithDistanceByTrainingRequestEvent,
        TrainingRequestResponseDynamicWithDistanceByTrainingRequestState> {
  final Repositories _repositories = Repositories();

  TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc()
      : super(
            const TrainingRequestResponseDynamicWithDistanceByTrainingRequestState(
                status: StatusWithoutLoading.initial)) {
    on<LoadTrainingRequestResponseDynamicWithDistanceByTrainingRequestEvent>(
        _onLoadTrainingRequestResponseDynamicWithDistanceByTrainingRequest);
    on<CleanTrainingRequestResponseDynamicWithDistanceByTrainingRequest>(
        _onCleanTrainingRequestResponseDynamicWithDistanceByTrainingRequest);
  }

  FutureOr<void>
      _onLoadTrainingRequestResponseDynamicWithDistanceByTrainingRequest(
          event,
          Emitter<TrainingRequestResponseDynamicWithDistanceByTrainingRequestState>
              emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final trainingRequestResponseDynamicWithDistanceByTrainingRequestListResponses =
            await _repositories
                .getTrainingRequestResponseDynamicWithDistanceDataByTrainingRequest(
                    event.trainingRequestId, event.offset);
        return trainingRequestResponseDynamicWithDistanceByTrainingRequestListResponses
                    .isEmpty ||
                trainingRequestResponseDynamicWithDistanceByTrainingRequestListResponses
                        .length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingRequestResponseDynamicWithDistanceList:
                    trainingRequestResponseDynamicWithDistanceByTrainingRequestListResponses,
                hasReachedMax: true))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingRequestResponseDynamicWithDistanceList:
                    trainingRequestResponseDynamicWithDistanceByTrainingRequestListResponses,
                hasReachedMax: false));
      }
      final trainingRequestResponseDynamicWithDistanceByTrainingRequestListResponses =
          await _repositories
              .getTrainingRequestResponseDynamicWithDistanceDataByTrainingRequest(
                  event.trainingRequestId, event.offset);
      trainingRequestResponseDynamicWithDistanceByTrainingRequestListResponses
                  .isEmpty ||
              trainingRequestResponseDynamicWithDistanceByTrainingRequestListResponses
                      .length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingRequestResponseDynamicWithDistanceList: List
                  .of(state.trainingRequestResponseDynamicWithDistanceList)
                ..addAll(
                    trainingRequestResponseDynamicWithDistanceByTrainingRequestListResponses),
              hasReachedMax: true))
          : emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingRequestResponseDynamicWithDistanceList: List.of(
                  state.trainingRequestResponseDynamicWithDistanceList)
                ..addAll(
                    trainingRequestResponseDynamicWithDistanceByTrainingRequestListResponses),
              hasReachedMax: false));
    } catch (e) {
      TrainingRequestResponseDynamicWithDistanceByTrainingRequestState(
          status: StatusWithoutLoading.failure, error: e.toString());
    }
  }

  void _onCleanTrainingRequestResponseDynamicWithDistanceByTrainingRequest(
      CleanTrainingRequestResponseDynamicWithDistanceByTrainingRequest event,
      Emitter<TrainingRequestResponseDynamicWithDistanceByTrainingRequestState>
          emit) {
    emit(state.copyWith(
        status: StatusWithoutLoading.initial,
        trainingRequestResponseDynamicWithDistanceList: List.of(
            state.trainingRequestResponseDynamicWithDistanceList..clear()),
        hasReachedMax: false));
  }
}


  // FutureOr<void>
  //     _onLoadTrainingRequestResponseDynamicWithDistanceByTrainingRequest(
  //         event,
  //         Emitter<TrainingRequestResponseDynamicWithDistanceByTrainingRequestState>
  //             emit) async {
  //   emit(const TrainingRequestResponseDynamicWithDistanceByTrainingRequestState(
  //       status: Status.loading));

  //   try {
  //     final trainingRequestResponseDynamicWithDistanceByTrainingRequestListResponses =
  //         await _repositories
  //             .getTrainingRequestResponseDynamicWithDistanceDataByTrainingRequest(
  //                 event.trainingRequestId);
  //     emit(
  //       state.copyWith(
  //           status: Status.success,
  //           trainingRequestResponseDynamicWithDistanceList:
  //               trainingRequestResponseDynamicWithDistanceByTrainingRequestListResponses),
  //     );
  //   } catch (e) {
  //     TrainingRequestResponseDynamicWithDistanceByTrainingRequestState(
  //         status: Status.failure, error: e.toString());
  //   }
  // }