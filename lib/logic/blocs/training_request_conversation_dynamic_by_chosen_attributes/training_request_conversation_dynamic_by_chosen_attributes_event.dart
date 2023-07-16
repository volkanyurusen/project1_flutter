part of 'training_request_conversation_dynamic_by_chosen_attributes_bloc.dart';

abstract class TrainingRequestConversationDynamicByChosenAttributesEvent
    extends Equatable {
  const TrainingRequestConversationDynamicByChosenAttributesEvent();

  @override
  List<Object> get props => [];
}

class LoadTrainingRequestConversationDynamicByChosenAttributesEvent
    extends TrainingRequestConversationDynamicByChosenAttributesEvent {
  final int trainingRequestResponseId;

  const LoadTrainingRequestConversationDynamicByChosenAttributesEvent({
    required this.trainingRequestResponseId,
  });

  @override
  List<Object> get props => [trainingRequestResponseId];
}
