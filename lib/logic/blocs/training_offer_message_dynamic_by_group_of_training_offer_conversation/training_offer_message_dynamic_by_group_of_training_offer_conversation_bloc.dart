import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_offer_message_dynamic_by_group_of_training_offer_conversation_event.dart';
part 'training_offer_message_dynamic_by_group_of_training_offer_conversation_state.dart';

class TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationBloc extends Bloc<
    TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationEvent,
    TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationState> {
  final Repositories _repositories = Repositories();

  TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationBloc()
      : super(const TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationState(
            status: Status.initial)) {
    on<LoadTrainingOfferMessageDynamicByGroupOfTrainingOfferConversationEvent>(
        _onLoadTrainingOfferMessageDynamicByGroupOfTrainingOfferConversation);
  }

  FutureOr<void> _onLoadTrainingOfferMessageDynamicByGroupOfTrainingOfferConversation(
      event, Emitter<TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationState> emit) async {
    emit(
        const TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationState(status: Status.loading));

    try {
      final trainingOfferMessageDynamicByGroupOfTrainingOfferConversationListResponses =
          await _repositories
              .getTrainingOfferMessageDynamicDataByGroupOfTrainingOfferConversation(event.uId, event.trainingOfferConversationList);
      //
      // if (kDebugMode) {
      //   print(
      //       'trainingOfferMessageDynamicByGroupOfTrainingOfferConversationListResponses: $trainingOfferMessageDynamicByGroupOfTrainingOfferConversationListResponses');
      // }
      emit(
        state.copyWith(
            status: Status.success,
            trainingOfferMessageDynamicList:
                trainingOfferMessageDynamicByGroupOfTrainingOfferConversationListResponses),
      );
    } catch (e) {
      TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationState(
          status: Status.failure, error: e.toString());
    }
  }
}
