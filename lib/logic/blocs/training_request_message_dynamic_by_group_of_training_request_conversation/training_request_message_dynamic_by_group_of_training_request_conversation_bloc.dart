import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_request_message_dynamic_by_group_of_training_request_conversation_event.dart';
part 'training_request_message_dynamic_by_group_of_training_request_conversation_state.dart';

class TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationBloc
    extends Bloc<
        TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationEvent,
        TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationState> {
  final Repositories _repositories = Repositories();

  TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationBloc()
      : super(
            const TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationState(
                status: Status.initial)) {
    on<LoadTrainingRequestMessageDynamicByGroupOfTrainingRequestConversationEvent>(
        _onLoadTrainingRequestMessageDynamicByGroupOfTrainingRequestConversation);
    on<RecallTrainingRequestMessageDynamicByGroupOfTrainingRequestConversationEvent>(
        _onRecallTrainingRequestMessageDynamicByGroupOfTrainingRequestConversation);
  }

  FutureOr<void>
      _onLoadTrainingRequestMessageDynamicByGroupOfTrainingRequestConversation(
          event,
          Emitter<TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationState>
              emit) async {
    emit(
        const TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationState(
            status: Status.loading));

    try {
      final trainingRequestMessageDynamicByGroupOfTrainingRequestConversationListResponses =
          await _repositories
              .getTrainingRequestMessageDynamicDataByGroupOfTrainingRequestConversation(
                  event.uId, event.trainingRequestConversationList);

      emit(
        state.copyWith(
            status: Status.success,
            trainingRequestMessageDynamicList:
                trainingRequestMessageDynamicByGroupOfTrainingRequestConversationListResponses),
      );
    } catch (e) {
      TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationState(
          status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void>
      _onRecallTrainingRequestMessageDynamicByGroupOfTrainingRequestConversation(
          RecallTrainingRequestMessageDynamicByGroupOfTrainingRequestConversationEvent
              event,
          Emitter<TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationState>
              emit) {
    emit(state.copyWith(
      status: Status.success,
      trainingRequestMessageDynamicList:
          List.of(state.trainingRequestMessageDynamicList)..clear(),
    ));
  }
}
