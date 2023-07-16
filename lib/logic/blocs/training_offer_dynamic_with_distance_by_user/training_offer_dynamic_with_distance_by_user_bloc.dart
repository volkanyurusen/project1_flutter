import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_offer_dynamic_with_distance_by_user_event.dart';
part 'training_offer_dynamic_with_distance_by_user_state.dart';

class TrainingOfferDynamicWithDistanceByUserBloc extends Bloc<
    TrainingOfferDynamicWithDistanceByUserEvent,
    TrainingOfferDynamicWithDistanceByUserState> {
  final Repositories _repositories = Repositories();

  TrainingOfferDynamicWithDistanceByUserBloc()
      : super(const TrainingOfferDynamicWithDistanceByUserState(
            status: StatusWithoutLoading.initial)) {
    on<LoadTrainingOfferDynamicWithDistanceByUserEvent>(
        _onLoadTrainingOfferDynamicWithDistanceByUser);
    on<CleanTrainingOfferDynamicWithDistanceByUser>(
        _onCleanTrainingOfferDynamicWithDistanceByUser);
  }

  FutureOr<void> _onLoadTrainingOfferDynamicWithDistanceByUser(
      event, Emitter<TrainingOfferDynamicWithDistanceByUserState> emit) async {
    if (kDebugMode) {
      print(state.hasReachedMax);
    }
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final trainingOfferDynamicWithDistanceByUserListResponses =
            await _repositories.getTrainingOfferDynamicWithDistanceDataByUser(
                event.userId, event.activityTitle, event.offset);
        return trainingOfferDynamicWithDistanceByUserListResponses.isEmpty ||
                trainingOfferDynamicWithDistanceByUserListResponses.length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingOfferDynamicWithDistanceList:
                    trainingOfferDynamicWithDistanceByUserListResponses,
                hasReachedMax: true))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingOfferDynamicWithDistanceList:
                    trainingOfferDynamicWithDistanceByUserListResponses,
                hasReachedMax: false));
      }
      final trainingOfferDynamicWithDistanceByUserListResponses =
          await _repositories.getTrainingOfferDynamicWithDistanceDataByUser(
              event.userId, event.activityTitle, event.offset);
      trainingOfferDynamicWithDistanceByUserListResponses.isEmpty ||
              trainingOfferDynamicWithDistanceByUserListResponses.length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingOfferDynamicWithDistanceList: List.of(
                  state.trainingOfferDynamicWithDistanceList)
                ..addAll(trainingOfferDynamicWithDistanceByUserListResponses),
              hasReachedMax: true))
          : emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingOfferDynamicWithDistanceList: List.of(
                  state.trainingOfferDynamicWithDistanceList)
                ..addAll(trainingOfferDynamicWithDistanceByUserListResponses),
              hasReachedMax: false));
    } catch (e) {
      TrainingOfferDynamicWithDistanceByUserState(
          status: StatusWithoutLoading.failure, error: e.toString());
    }
  }

  void _onCleanTrainingOfferDynamicWithDistanceByUser(
      CleanTrainingOfferDynamicWithDistanceByUser event,
      Emitter<TrainingOfferDynamicWithDistanceByUserState> emit) {
    emit(state.copyWith(
        status: StatusWithoutLoading.initial,
        trainingOfferDynamicWithDistanceList:
            List.of(state.trainingOfferDynamicWithDistanceList)..clear(),
        hasReachedMax: false));
  }
}




  // FutureOr<void> _onLoadTrainingOfferDynamicWithDistanceByUser(
  //     event, Emitter<TrainingOfferDynamicWithDistanceByUserState> emit) async {
  //   emit(const TrainingOfferDynamicWithDistanceByUserState(
  //       status: Status.loading));

  //   try {
  //     final trainingOfferDynamicWithDistanceByUserListResponses =
  //         await _repositories.getTrainingOfferDynamicWithDistanceDataByUser(
  //             event.userId, event.activityTitle);
  //     emit(
  //       state.copyWith(
  //           status: Status.success,
  //           trainingOfferDynamicWithDistanceList:
  //               trainingOfferDynamicWithDistanceByUserListResponses),
  //     );
  //   } catch (e) {
  //     TrainingOfferDynamicWithDistanceByUserState(
  //         status: Status.failure, error: e.toString());
  //   }
  // }