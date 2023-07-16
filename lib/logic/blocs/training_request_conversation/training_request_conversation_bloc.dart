import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_request_conversation_event.dart';
part 'training_request_conversation_state.dart';

class TrainingRequestConversationBloc extends Bloc<
    TrainingRequestConversationEvent, TrainingRequestConversationState> {
  final Repositories _repositories = Repositories();

  TrainingRequestConversationBloc()
      : super(const TrainingRequestConversationState(status: Status.initial)) {
    on<AddTrainingRequestConversationEvent>(
        _onAddTrainingRequestConversationEvent);
    on<UpdateTrainingRequestConversationEvent>(
        _onUpdateTrainingRequestConversationEvent);
    on<DeleteTrainingRequestConversationEvent>(
        _onDeleteTrainingRequestConversationEvent);
  }

  FutureOr<void> _onAddTrainingRequestConversationEvent(
      event, Emitter<TrainingRequestConversationState> emit) async {
    emit(const TrainingRequestConversationState(status: Status.loading));

    try {
      final allTrainingRequestConversationResponses = await _repositories
          .postTrainingRequestConversation(event.trainingRequestConversation);

      emit(state.copyWith(
          status: Status.success,
          dbStatusList: allTrainingRequestConversationResponses));
    } catch (e) {
      TrainingRequestConversationState(
          status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onUpdateTrainingRequestConversationEvent(
      event, Emitter<TrainingRequestConversationState> emit) async {
    emit(const TrainingRequestConversationState(status: Status.loading));

    try {
      final allTrainingRequestConversationResponses = await _repositories
          .putTrainingRequestConversation(event.trainingRequestConversation);

      emit(state.copyWith(
          status: Status.success,
          dbStatusList: allTrainingRequestConversationResponses));
    } catch (e) {
      TrainingRequestConversationState(
          status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onDeleteTrainingRequestConversationEvent(
      event, Emitter<TrainingRequestConversationState> emit) async {
    emit(const TrainingRequestConversationState(status: Status.loading));

    try {
      final allTrainingRequestConversationResponses =
          await _repositories.deleteTrainingRequestConversation(
              event.trainingRequestConversationId);

      emit(state.copyWith(
          status: Status.success,
          dbStatusList: allTrainingRequestConversationResponses));
    } catch (e) {
      TrainingRequestConversationState(
          status: Status.failure, error: e.toString());
    }
  }
}
