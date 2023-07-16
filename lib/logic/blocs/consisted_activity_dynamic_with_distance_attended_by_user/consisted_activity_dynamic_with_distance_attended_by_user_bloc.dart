import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'consisted_activity_dynamic_with_distance_attended_by_user_event.dart';
part 'consisted_activity_dynamic_with_distance_attended_by_user_state.dart';

class ConsistedActivityDynamicWithDistanceAttendedByUserBloc extends Bloc<
    ConsistedActivityDynamicWithDistanceAttendedByUserEvent,
    ConsistedActivityDynamicWithDistanceAttendedByUserState> {
  final Repositories _repositories = Repositories();

  ConsistedActivityDynamicWithDistanceAttendedByUserBloc()
      : super(const ConsistedActivityDynamicWithDistanceAttendedByUserState(
            status: StatusWithoutLoading.initial)) {
    on<LoadConsistedActivityDynamicWithDistanceAttendedByUserEvent>(
        _onLoadConsistedActivityDynamicWithDistanceAttendedByUser);
    on<RecallConsistedActivityDynamicWithDistanceAttendedByUserEvent>(
        _onRecallConsistedActivityDynamicWithDistanceAttendedByUser);
  }

  FutureOr<void> _onLoadConsistedActivityDynamicWithDistanceAttendedByUser(
      event,
      Emitter<ConsistedActivityDynamicWithDistanceAttendedByUserState>
          emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final consistedActivityDynamicWithDistanceAttendedByUserListResponses =
            await _repositories
                .getConsistedActivityDynamicWithDistanceDataAttendedByUser(
                    event.uId, event.offset);
        return consistedActivityDynamicWithDistanceAttendedByUserListResponses
                    .isEmpty ||
                consistedActivityDynamicWithDistanceAttendedByUserListResponses
                        .length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                consistedActivityDynamicWithDistanceList:
                    consistedActivityDynamicWithDistanceAttendedByUserListResponses,
                hasReachedMax: true))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                consistedActivityDynamicWithDistanceList:
                    consistedActivityDynamicWithDistanceAttendedByUserListResponses,
                hasReachedMax: false));
      }
      final consistedActivityDynamicWithDistanceAttendedByUserListResponses =
          await _repositories
              .getConsistedActivityDynamicWithDistanceDataAttendedByUser(
                  event.uId, event.offset);
      consistedActivityDynamicWithDistanceAttendedByUserListResponses.isEmpty ||
              consistedActivityDynamicWithDistanceAttendedByUserListResponses
                      .length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              consistedActivityDynamicWithDistanceList: List.of(
                  state.consistedActivityDynamicWithDistanceList)
                ..addAll(
                    consistedActivityDynamicWithDistanceAttendedByUserListResponses),
              hasReachedMax: true))
          : emit(state.copyWith(
              status: StatusWithoutLoading.success,
              consistedActivityDynamicWithDistanceList: List.of(
                  state.consistedActivityDynamicWithDistanceList)
                ..addAll(
                    consistedActivityDynamicWithDistanceAttendedByUserListResponses),
              hasReachedMax: false));
    } catch (e) {
      ConsistedActivityDynamicWithDistanceAttendedByUserState(
          status: StatusWithoutLoading.failure, error: e.toString());
    }
  }

  FutureOr<void> _onRecallConsistedActivityDynamicWithDistanceAttendedByUser(
      RecallConsistedActivityDynamicWithDistanceAttendedByUserEvent event,
      Emitter<ConsistedActivityDynamicWithDistanceAttendedByUserState> emit) {
    emit(state.copyWith(
        status: StatusWithoutLoading.success,
        consistedActivityDynamicWithDistanceList:
            List.of(state.consistedActivityDynamicWithDistanceList)..clear(),
        hasReachedMax: false));
  }
}
