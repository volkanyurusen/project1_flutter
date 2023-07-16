import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_offer_conversation_event.dart';
part 'training_offer_conversation_state.dart';

class TrainingOfferConversationBloc extends Bloc<TrainingOfferConversationEvent,
    TrainingOfferConversationState> {
  final Repositories _repositories = Repositories();

  TrainingOfferConversationBloc()
      : super(const TrainingOfferConversationState(status: Status.initial)) {
    on<AddTrainingOfferConversationEvent>(_onAddTrainingOfferConversationEvent);
    on<UpdateTrainingOfferConversationEvent>(
        _onUpdateTrainingOfferConversationEvent);
    on<DeleteTrainingOfferConversationEvent>(
        _onDeleteTrainingOfferConversationEvent);
  }

  FutureOr<void> _onAddTrainingOfferConversationEvent(
      event, Emitter<TrainingOfferConversationState> emit) async {
    emit(const TrainingOfferConversationState(status: Status.loading));

    try {
      final allTrainingOfferConversationResponses = await _repositories
          .postTrainingOfferConversation(event.trainingOfferConversation);

      emit(state.copyWith(
          status: Status.success,
          dbStatusList: allTrainingOfferConversationResponses));
    } catch (e) {
      TrainingOfferConversationState(
          status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onUpdateTrainingOfferConversationEvent(
      event, Emitter<TrainingOfferConversationState> emit) async {
    emit(const TrainingOfferConversationState(status: Status.loading));

    try {
      final allTrainingOfferConversationResponses = await _repositories
          .putTrainingOfferConversation(event.trainingOfferConversation);

      emit(state.copyWith(
          status: Status.success,
          dbStatusList: allTrainingOfferConversationResponses));
    } catch (e) {
      TrainingOfferConversationState(
          status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onDeleteTrainingOfferConversationEvent(
      event, Emitter<TrainingOfferConversationState> emit) async {
    emit(const TrainingOfferConversationState(status: Status.loading));

    try {
      final allTrainingOfferConversationResponses = await _repositories
          .deleteTrainingOfferConversation(event.trainingOfferConversationId);

      emit(state.copyWith(
          status: Status.success,
          dbStatusList: allTrainingOfferConversationResponses));
    } catch (e) {
      TrainingOfferConversationState(
          status: Status.failure, error: e.toString());
    }
  }
}
