import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_offer_conversation_dynamic_by_chosen_attributes_event.dart';
part 'training_offer_conversation_dynamic_by_chosen_attributes_state.dart';

class TrainingOfferConversationDynamicByChosenAttributesBloc extends Bloc<
    TrainingOfferConversationDynamicByChosenAttributesEvent,
    TrainingOfferConversationDynamicByChosenAttributesState> {
  final Repositories _repositories = Repositories();

  TrainingOfferConversationDynamicByChosenAttributesBloc()
      : super(const TrainingOfferConversationDynamicByChosenAttributesState(
            status: Status.initial)) {
    on<LoadTrainingOfferConversationDynamicByChosenAttributesEvent>(
        _onLoadTrainingOfferConversationDynamicByChosenAttributes);
  }

  FutureOr<void> _onLoadTrainingOfferConversationDynamicByChosenAttributes(
      event,
      Emitter<TrainingOfferConversationDynamicByChosenAttributesState>
          emit) async {
    emit(const TrainingOfferConversationDynamicByChosenAttributesState(
        status: Status.loading));

    try {
      final trainingOfferConversationDynamicByChosenAttributesListResponses =
          await _repositories
              .getTrainingOfferConversationDynamicDataByChosenAttributes(
                  event.trainingOfferResponseId);
      emit(
        state.copyWith(
            status: Status.success,
            trainingOfferConversationDynamicList:
                trainingOfferConversationDynamicByChosenAttributesListResponses),
      );
    } catch (e) {
      TrainingOfferConversationDynamicByChosenAttributesState(
          status: Status.failure, error: e.toString());
    }
  }
}
