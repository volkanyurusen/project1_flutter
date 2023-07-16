import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'consisted_activity_dynamic_with_distance_by_created_activity_with_offset_and_process_event.dart';
part 'consisted_activity_dynamic_with_distance_by_created_activity_with_offset_and_process_state.dart';

class ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessBloc
    extends Bloc<
        ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessEvent,
        ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState> {
  final Repositories _repositories = Repositories();

  ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessBloc()
      : super(
            const ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState(
                status: StatusWithoutLoading.initial)) {
    on<LoadConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcess>(
        _onLoadConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcess);
    on<CleanConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcess>(
        _onCleanConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcess);
  }

  FutureOr<void>
      _onLoadConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcess(
          event,
          Emitter<ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState>
              emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final consistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessListResponses =
            await _repositories
                .getConsistedActivityDynamicWithDistanceDataByCreatedActivityWithOffsetAndProcess(
                    event.createdActivityId, event.offset);
        return consistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessListResponses
                    .isEmpty ||
                consistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessListResponses
                        .length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                consistedActivityDynamicWithDistanceList:
                    consistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessListResponses,
                hasReachedMax: true))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                consistedActivityDynamicWithDistanceList:
                    consistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessListResponses,
                hasReachedMax: false));
      }
      final consistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessListResponses =
          await _repositories
              .getConsistedActivityDynamicWithDistanceDataByCreatedActivityWithOffsetAndProcess(
                  event.createdActivityId, event.offset);
      consistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessListResponses
                  .isEmpty ||
              consistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessListResponses
                      .length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              consistedActivityDynamicWithDistanceList: List.of(
                  state.consistedActivityDynamicWithDistanceList)
                ..addAll(
                    consistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessListResponses),
              hasReachedMax: true,
            ))
          : emit(
              state.copyWith(
                status: StatusWithoutLoading.success,
                consistedActivityDynamicWithDistanceList: List.of(
                    state.consistedActivityDynamicWithDistanceList)
                  ..addAll(
                      consistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessListResponses),
                hasReachedMax: false,
              ),
            );
    } catch (e) {
      ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState(
          status: StatusWithoutLoading.failure, error: e.toString());
    }
  }

  void _onCleanConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcess(
      CleanConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcess
          event,
      Emitter<ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState>
          emit) {
    emit(state.copyWith(
        status: StatusWithoutLoading.initial,
        consistedActivityDynamicWithDistanceList:
            List.of(state.consistedActivityDynamicWithDistanceList..clear()),
        hasReachedMax: false));
  }
}
