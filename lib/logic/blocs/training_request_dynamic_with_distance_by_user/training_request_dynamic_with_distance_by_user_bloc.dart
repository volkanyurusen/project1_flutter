import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_request_dynamic_with_distance_by_user_event.dart';
part 'training_request_dynamic_with_distance_by_user_state.dart';

class TrainingRequestDynamicWithDistanceByUserBloc extends Bloc<
    TrainingRequestDynamicWithDistanceByUserEvent,
    TrainingRequestDynamicWithDistanceByUserState> {
  final Repositories _repositories = Repositories();

  TrainingRequestDynamicWithDistanceByUserBloc()
      : super(const TrainingRequestDynamicWithDistanceByUserState(
            status: StatusWithoutLoading.initial)) {
    on<LoadTrainingRequestDynamicWithDistanceByUserEvent>(
        _onLoadTrainingRequestDynamicWithDistanceByUser);
    on<CleanTrainingRequestDynamicWithDistanceByUser>(
        _onCleanTrainingRequestDynamicWithDistanceByUser);
  }

  FutureOr<void> _onLoadTrainingRequestDynamicWithDistanceByUser(event,
      Emitter<TrainingRequestDynamicWithDistanceByUserState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final trainingRequestDynamicWithDistanceByUserListResponses =
            await _repositories.getTrainingRequestDynamicWithDistanceDataByUser(
                event.userId, event.activityTitle, event.offset);
        return trainingRequestDynamicWithDistanceByUserListResponses.isEmpty ||
                trainingRequestDynamicWithDistanceByUserListResponses.length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingRequestDynamicWithDistanceList:
                    trainingRequestDynamicWithDistanceByUserListResponses,
                hasReachedMax: true))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingRequestDynamicWithDistanceList:
                    trainingRequestDynamicWithDistanceByUserListResponses,
                hasReachedMax: false));
      }
      final trainingRequestDynamicWithDistanceByUserListResponses =
          await _repositories.getTrainingRequestDynamicWithDistanceDataByUser(
              event.userId, event.activityTitle, event.offset);
      trainingRequestDynamicWithDistanceByUserListResponses.isEmpty ||
              trainingRequestDynamicWithDistanceByUserListResponses.length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingRequestDynamicWithDistanceList: List.of(
                  state.trainingRequestDynamicWithDistanceList)
                ..addAll(trainingRequestDynamicWithDistanceByUserListResponses),
              hasReachedMax: true))
          : emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingRequestDynamicWithDistanceList: List.of(
                  state.trainingRequestDynamicWithDistanceList)
                ..addAll(trainingRequestDynamicWithDistanceByUserListResponses),
              hasReachedMax: false));
    } catch (e) {
      TrainingRequestDynamicWithDistanceByUserState(
          status: StatusWithoutLoading.failure, error: e.toString());
    }
  }

  void _onCleanTrainingRequestDynamicWithDistanceByUser(
      CleanTrainingRequestDynamicWithDistanceByUser event,
      Emitter<TrainingRequestDynamicWithDistanceByUserState> emit) {
    emit(state.copyWith(
        status: StatusWithoutLoading.initial,
        trainingRequestDynamicWithDistanceList:
            List.of(state.trainingRequestDynamicWithDistanceList)..clear(),
        hasReachedMax: false));
  }
}


  // FutureOr<void> _onLoadTrainingRequestDynamicWithDistanceByUser(event,
  //     Emitter<TrainingRequestDynamicWithDistanceByUserState> emit) async {
  //   emit(const TrainingRequestDynamicWithDistanceByUserState(
  //       status: Status.loading));

  //   try {
  //     final trainingRequestDynamicWithDistanceByUserListResponses =
  //         await _repositories
  //             .getTrainingRequestDynamicWithDistanceDataByUser(
  //                 event.userId, event.activityTitle);
  //     //
  //     // if (kDebugMode) {
  //     //   print(
  //     //       'trainingRequestDynamicWithDistanceByUserListResponses: $trainingRequestDynamicWithDistanceByUserListResponses');
  //     // }
  //     emit(
  //       state.copyWith(
  //           status: Status.success,
  //           trainingRequestDynamicWithDistanceList:
  //               trainingRequestDynamicWithDistanceByUserListResponses),
  //     );
  //   } catch (e) {
  //     TrainingRequestDynamicWithDistanceByUserState(
  //         status: Status.failure, error: e.toString());
  //   }
  // }