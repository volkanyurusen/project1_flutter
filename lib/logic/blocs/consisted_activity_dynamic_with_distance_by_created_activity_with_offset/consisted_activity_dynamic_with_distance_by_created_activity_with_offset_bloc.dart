import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'consisted_activity_dynamic_with_distance_by_created_activity_with_offset_event.dart';
part 'consisted_activity_dynamic_with_distance_by_created_activity_with_offset_state.dart';

class ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetBloc
    extends Bloc<
        ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetEvent,
        ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState> {
  final Repositories _repositories = Repositories();

  ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetBloc()
      : super(
            const ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState(
                status: StatusWithoutLoading.initial)) {
    on<LoadConsistedActivityDynamicWithDistanceByCreatedActivityWithOffset>(
        _onLoadConsistedActivityDynamicWithDistanceByCreatedActivityWithOffset);
    on<CleanConsistedActivityDynamicWithDistanceByCreatedActivityWithOffset>(
        _onCleanConsistedActivityDynamicWithDistanceByCreatedActivityWithOffset);
  }

  FutureOr<void>
      _onLoadConsistedActivityDynamicWithDistanceByCreatedActivityWithOffset(
          event,
          Emitter<ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState>
              emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final consistedActivityDynamicWithDistanceByCreatedActivityWithOffsetListResponses =
            await _repositories
                .getConsistedActivityDynamicWithDistanceDataByCreatedActivityWithOffset(
                    event.createdActivityId, event.offset);
        return consistedActivityDynamicWithDistanceByCreatedActivityWithOffsetListResponses
                    .isEmpty ||
                consistedActivityDynamicWithDistanceByCreatedActivityWithOffsetListResponses
                        .length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                consistedActivityDynamicWithDistanceList:
                    consistedActivityDynamicWithDistanceByCreatedActivityWithOffsetListResponses,
                hasReachedMax: true))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                consistedActivityDynamicWithDistanceList:
                    consistedActivityDynamicWithDistanceByCreatedActivityWithOffsetListResponses,
                hasReachedMax: false));
      }
      final consistedActivityDynamicWithDistanceByCreatedActivityWithOffsetListResponses =
          await _repositories
              .getConsistedActivityDynamicWithDistanceDataByCreatedActivityWithOffset(
                  event.createdActivityId, event.offset);
      consistedActivityDynamicWithDistanceByCreatedActivityWithOffsetListResponses
                  .isEmpty ||
              consistedActivityDynamicWithDistanceByCreatedActivityWithOffsetListResponses
                      .length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              consistedActivityDynamicWithDistanceList: List.of(
                  state.consistedActivityDynamicWithDistanceList)
                ..addAll(
                    consistedActivityDynamicWithDistanceByCreatedActivityWithOffsetListResponses),
              hasReachedMax: true,
            ))
          : emit(
              state.copyWith(
                status: StatusWithoutLoading.success,
                consistedActivityDynamicWithDistanceList: List.of(
                    state.consistedActivityDynamicWithDistanceList)
                  ..addAll(
                      consistedActivityDynamicWithDistanceByCreatedActivityWithOffsetListResponses),
                hasReachedMax: false,
              ),
            );
    } catch (e) {
      ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState(
          status: StatusWithoutLoading.failure, error: e.toString());
    }
  }

  void _onCleanConsistedActivityDynamicWithDistanceByCreatedActivityWithOffset(
      CleanConsistedActivityDynamicWithDistanceByCreatedActivityWithOffset
          event,
      Emitter<ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState>
          emit) {
    emit(state.copyWith(
        status: StatusWithoutLoading.initial,
        consistedActivityDynamicWithDistanceList:
            List.of(state.consistedActivityDynamicWithDistanceList..clear()),
        hasReachedMax: false));
  }
}
