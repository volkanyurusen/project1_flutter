import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_request_conversation_dynamic_by_user_event.dart';
part 'training_request_conversation_dynamic_by_user_state.dart';

class TrainingRequestConversationDynamicByUserBloc extends Bloc<
    TrainingRequestConversationDynamicByUserEvent,
    TrainingRequestConversationDynamicByUserState> {
  final Repositories _repositories = Repositories();

  TrainingRequestConversationDynamicByUserBloc()
      : super(const TrainingRequestConversationDynamicByUserState(
            status: StatusWithoutLoading.initial)) {
    on<LoadTrainingRequestConversationDynamicByUserEvent>(
        _onLoadTrainingRequestConversationDynamicByUser);
    on<RecallTrainingRequestConversationDynamicByUserEvent>(
        _onRecallTrainingRequestConversationDynamicByUser);
  }

  FutureOr<void> _onLoadTrainingRequestConversationDynamicByUser(event,
      Emitter<TrainingRequestConversationDynamicByUserState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final trainingRequestConversationDynamicByUserListResponses =
            await _repositories.getTrainingRequestConversationDynamicDataByUser(
                event.uId, event.offset);
        return trainingRequestConversationDynamicByUserListResponses.isEmpty ||
                trainingRequestConversationDynamicByUserListResponses.length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingRequestConversationDynamicList:
                    trainingRequestConversationDynamicByUserListResponses,
                hasReachedMax: true))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingRequestConversationDynamicList:
                    trainingRequestConversationDynamicByUserListResponses,
                hasReachedMax: false));
      }
      final trainingRequestConversationDynamicByUserListResponses =
          await _repositories.getTrainingRequestConversationDynamicDataByUser(
              event.uId, event.offset);
      trainingRequestConversationDynamicByUserListResponses.isEmpty ||
              trainingRequestConversationDynamicByUserListResponses.length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingRequestConversationDynamicList: List.of(
                  state.trainingRequestConversationDynamicList)
                ..addAll(trainingRequestConversationDynamicByUserListResponses),
              hasReachedMax: true))
          : emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingRequestConversationDynamicList: List.of(
                  state.trainingRequestConversationDynamicList)
                ..addAll(trainingRequestConversationDynamicByUserListResponses),
              hasReachedMax: false));
    } catch (e) {
      TrainingRequestConversationDynamicByUserState(
          status: StatusWithoutLoading.failure, error: e.toString());
    }
  }

  FutureOr<void> _onRecallTrainingRequestConversationDynamicByUser(
      RecallTrainingRequestConversationDynamicByUserEvent event,
      Emitter<TrainingRequestConversationDynamicByUserState> emit) {
    emit(state.copyWith(
        status: StatusWithoutLoading.success,
        trainingRequestConversationDynamicList:
            List.of(state.trainingRequestConversationDynamicList)..clear(),
        hasReachedMax: false));
  }
}
