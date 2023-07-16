import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_request_conversation_dynamic_by_chosen_attributes_event.dart';
part 'training_request_conversation_dynamic_by_chosen_attributes_state.dart';

class TrainingRequestConversationDynamicByChosenAttributesBloc extends Bloc<
    TrainingRequestConversationDynamicByChosenAttributesEvent,
    TrainingRequestConversationDynamicByChosenAttributesState> {
  final Repositories _repositories = Repositories();

  TrainingRequestConversationDynamicByChosenAttributesBloc()
      : super(const TrainingRequestConversationDynamicByChosenAttributesState(
            status: Status.initial)) {
    on<LoadTrainingRequestConversationDynamicByChosenAttributesEvent>(
        _onLoadTrainingRequestConversationDynamicByChosenAttributes);
  }

  FutureOr<void> _onLoadTrainingRequestConversationDynamicByChosenAttributes(
      event,
      Emitter<TrainingRequestConversationDynamicByChosenAttributesState>
          emit) async {
    emit(const TrainingRequestConversationDynamicByChosenAttributesState(
        status: Status.loading));

    try {
      final trainingRequestConversationDynamicByChosenAttributesListResponses =
          await _repositories
              .getTrainingRequestConversationDynamicDataByChosenAttributes(
                  event.trainingRequestResponseId);
      emit(
        state.copyWith(
            status: Status.success,
            trainingRequestConversationDynamicList:
                trainingRequestConversationDynamicByChosenAttributesListResponses),
      );
    } catch (e) {
      TrainingRequestConversationDynamicByChosenAttributesState(
          status: Status.failure, error: e.toString());
    }
  }
}
