import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'created_activity_dynamic_by_host_event.dart';
part 'created_activity_dynamic_by_host_state.dart';

class CreatedActivityDynamicByHostBloc extends Bloc<
    CreatedActivityDynamicByHostEvent, CreatedActivityDynamicByHostState> {
  final Repositories _repositories = Repositories();

  CreatedActivityDynamicByHostBloc()
      : super(const CreatedActivityDynamicByHostState(
            status: StatusWithoutLoading.initial)) {
    on<LoadCreatedActivityDynamicByHostEvent>(
        _onLoadActivityConversationDynamicByUser);
    on<RecallCreatedActivityDynamicByHostEvent>(
        _onRecallActivityConversationDynamicByUser);
  }

  FutureOr<void> _onLoadActivityConversationDynamicByUser(
      event, Emitter<CreatedActivityDynamicByHostState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final createdActivityDynamicByHostListResponses = await _repositories
            .getCreatedActivityDynamicDataByHost(event.hostId, event.offset);
        return createdActivityDynamicByHostListResponses.isEmpty ||
                createdActivityDynamicByHostListResponses.length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                createdActivityDynamicList:
                    createdActivityDynamicByHostListResponses,
                hasReachedMax: true))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                createdActivityDynamicList:
                    createdActivityDynamicByHostListResponses,
                hasReachedMax: false));
      }
      final createdActivityDynamicByHostListResponses = await _repositories
          .getCreatedActivityDynamicDataByHost(event.hostId, event.offset);
      createdActivityDynamicByHostListResponses.isEmpty ||
              createdActivityDynamicByHostListResponses.length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              createdActivityDynamicList:
                  List.of(state.createdActivityDynamicList)
                    ..addAll(createdActivityDynamicByHostListResponses),
              hasReachedMax: true))
          : emit(state.copyWith(
              status: StatusWithoutLoading.success,
              createdActivityDynamicList:
                  List.of(state.createdActivityDynamicList)
                    ..addAll(createdActivityDynamicByHostListResponses),
              hasReachedMax: false));
    } catch (e) {
      CreatedActivityDynamicByHostState(
          status: StatusWithoutLoading.failure, error: e.toString());
    }
  }

  FutureOr<void> _onRecallActivityConversationDynamicByUser(
      RecallCreatedActivityDynamicByHostEvent event,
      Emitter<CreatedActivityDynamicByHostState> emit) {
    emit(state.copyWith(
        status: StatusWithoutLoading.success,
        createdActivityDynamicList: List.of(state.createdActivityDynamicList)
          ..clear(),
        hasReachedMax: false));
  }
}
