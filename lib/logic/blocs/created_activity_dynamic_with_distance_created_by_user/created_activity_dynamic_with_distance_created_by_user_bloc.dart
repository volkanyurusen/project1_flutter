import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'created_activity_dynamic_with_distance_created_by_user_event.dart';
part 'created_activity_dynamic_with_distance_created_by_user_state.dart';

class CreatedActivityDynamicWithDistanceCreatedByUserBloc extends Bloc<
    CreatedActivityDynamicWithDistanceCreatedByUserEvent,
    CreatedActivityDynamicWithDistanceCreatedByUserState> {
  final Repositories _repositories = Repositories();

  CreatedActivityDynamicWithDistanceCreatedByUserBloc()
      : super(const CreatedActivityDynamicWithDistanceCreatedByUserState(
            status: StatusWithoutLoading.initial)) {
    on<LoadCreatedActivityDynamicWithDistanceCreatedByUserEvent>(
        _onLoadCreatedActivityDynamicWithDistanceCreatedByUser);
    on<RecallCreatedActivityDynamicWithDistanceCreatedByUserEvent>(
        _onRecallCreatedActivityDynamicWithDistanceCreatedByUser);
  }

  FutureOr<void> _onLoadCreatedActivityDynamicWithDistanceCreatedByUser(
      LoadCreatedActivityDynamicWithDistanceCreatedByUserEvent event,
      Emitter<CreatedActivityDynamicWithDistanceCreatedByUserState>
          emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final createdActivityDynamicWithDistanceCreatedByUserListResponses =
            await _repositories
                .getCreatedActivityDynamicWithDistanceDataCreatedByUser(
                    event.uId, event.offset);
        return createdActivityDynamicWithDistanceCreatedByUserListResponses
                    .isEmpty ||
                createdActivityDynamicWithDistanceCreatedByUserListResponses
                        .length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                createdActivityDynamicWithDistanceList:
                    createdActivityDynamicWithDistanceCreatedByUserListResponses,
                hasReachedMax: true))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                createdActivityDynamicWithDistanceList:
                    createdActivityDynamicWithDistanceCreatedByUserListResponses,
                hasReachedMax: false));
      }
      final createdActivityDynamicWithDistanceCreatedByUserListResponses =
          await _repositories
              .getCreatedActivityDynamicWithDistanceDataCreatedByUser(
                  event.uId, event.offset);
      createdActivityDynamicWithDistanceCreatedByUserListResponses.isEmpty ||
              createdActivityDynamicWithDistanceCreatedByUserListResponses
                      .length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              createdActivityDynamicWithDistanceList: List.of(
                  state.createdActivityDynamicWithDistanceList)
                ..addAll(
                    createdActivityDynamicWithDistanceCreatedByUserListResponses),
              hasReachedMax: true,
            ))
          : emit(
              state.copyWith(
                status: StatusWithoutLoading.success,
                createdActivityDynamicWithDistanceList: List.of(
                    state.createdActivityDynamicWithDistanceList)
                  ..addAll(
                      createdActivityDynamicWithDistanceCreatedByUserListResponses),
                hasReachedMax: false,
              ),
            );
    } catch (e) {
      CreatedActivityDynamicWithDistanceCreatedByUserState(
          status: StatusWithoutLoading.failure, error: e.toString());
    }
  }

  FutureOr<void> _onRecallCreatedActivityDynamicWithDistanceCreatedByUser(
      RecallCreatedActivityDynamicWithDistanceCreatedByUserEvent event,
      Emitter<CreatedActivityDynamicWithDistanceCreatedByUserState> emit) {
    emit(
      state.copyWith(
          status: StatusWithoutLoading.success,
          createdActivityDynamicWithDistanceList:
              List.of(state.createdActivityDynamicWithDistanceList)..clear(),
          hasReachedMax: false)
    );
  }
}
