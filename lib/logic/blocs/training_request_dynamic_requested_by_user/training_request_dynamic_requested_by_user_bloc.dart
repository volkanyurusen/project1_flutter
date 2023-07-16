import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_request_dynamic_requested_by_user_event.dart';
part 'training_request_dynamic_requested_by_user_state.dart';

class TrainingRequestDynamicRequestedByUserBloc extends Bloc<
    TrainingRequestDynamicRequestedByUserEvent,
    TrainingRequestDynamicRequestedByUserState> {
  final Repositories _repositories = Repositories();

  TrainingRequestDynamicRequestedByUserBloc()
      : super(const TrainingRequestDynamicRequestedByUserState(
            status: StatusWithoutLoading.initial)) {
    on<LoadTrainingRequestDynamicRequestedByUserEvent>(
        _onLoadTrainingRequestDynamicRequestedByUser);
    on<RecallTrainingRequestDynamicRequestedByUserEvent>(
        _onRecallTrainingRequestDynamicRequestedByUser);
  }

  FutureOr<void> _onLoadTrainingRequestDynamicRequestedByUser(
      event, Emitter<TrainingRequestDynamicRequestedByUserState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final trainingRequestDynamicRequestedByUserListResponses =
            await _repositories.getTrainingRequestDynamicDataRequestedByUser(
                event.uId, event.offset);
        return trainingRequestDynamicRequestedByUserListResponses.isEmpty ||
                trainingRequestDynamicRequestedByUserListResponses.length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingRequestDynamicList:
                    trainingRequestDynamicRequestedByUserListResponses,
                hasReachedMax: true))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingRequestDynamicList:
                    trainingRequestDynamicRequestedByUserListResponses,
                hasReachedMax: false));
      }
      final trainingRequestDynamicRequestedByUserListResponses =
          await _repositories.getTrainingRequestDynamicDataRequestedByUser(
              event.uId, event.offset);
      trainingRequestDynamicRequestedByUserListResponses.isEmpty ||
              trainingRequestDynamicRequestedByUserListResponses.length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingRequestDynamicList: List.of(
                  state.trainingRequestDynamicList)
                ..addAll(trainingRequestDynamicRequestedByUserListResponses),
              hasReachedMax: true))
          : emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingRequestDynamicList: List.of(
                  state.trainingRequestDynamicList)
                ..addAll(trainingRequestDynamicRequestedByUserListResponses),
              hasReachedMax: false));
    } catch (e) {
      TrainingRequestDynamicRequestedByUserState(
          status: StatusWithoutLoading.failure, error: e.toString());
    }
  }

  FutureOr<void> _onRecallTrainingRequestDynamicRequestedByUser(
      RecallTrainingRequestDynamicRequestedByUserEvent event,
      Emitter<TrainingRequestDynamicRequestedByUserState> emit) {
    emit(state.copyWith(
        status: StatusWithoutLoading.success,
        trainingRequestDynamicList: List.of(state.trainingRequestDynamicList)
          ..clear(),
        hasReachedMax: false));
  }
}



  // FutureOr<void> _onLoadTrainingRequestDynamicRequestedByUser(
  //     event, Emitter<TrainingRequestDynamicRequestedByUserState> emit) async {

  //   try {
  //     final trainingRequestDynamicRequestedByUserListResponses =
  //         await _repositories
  //             .getTrainingRequestDynamicDataRequestedByUser(event.uId, event.offset);
  //     emit(
  //       state.copyWith(
  //           status: StatusWithoutLoading.success,
  //           trainingRequestDynamicList:
  //               trainingRequestDynamicRequestedByUserListResponses),
  //     );
  //   } catch (e) {
  //     TrainingRequestDynamicRequestedByUserState(
  //         status: StatusWithoutLoading.failure, error: e.toString());
  //   }