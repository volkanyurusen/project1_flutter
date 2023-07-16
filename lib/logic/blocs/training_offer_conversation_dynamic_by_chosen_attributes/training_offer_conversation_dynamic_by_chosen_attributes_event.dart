part of 'training_offer_conversation_dynamic_by_chosen_attributes_bloc.dart';

abstract class TrainingOfferConversationDynamicByChosenAttributesEvent
    extends Equatable {
  const TrainingOfferConversationDynamicByChosenAttributesEvent();

  @override
  List<Object> get props => [];
}

class LoadTrainingOfferConversationDynamicByChosenAttributesEvent
    extends TrainingOfferConversationDynamicByChosenAttributesEvent {
  final int trainingOfferResponseId;

  const LoadTrainingOfferConversationDynamicByChosenAttributesEvent({
    required this.trainingOfferResponseId,
  });

  @override
  List<Object> get props => [trainingOfferResponseId];
}
