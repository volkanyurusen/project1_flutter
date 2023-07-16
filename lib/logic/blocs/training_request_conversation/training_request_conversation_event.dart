part of 'training_request_conversation_bloc.dart';

abstract class TrainingRequestConversationEvent extends Equatable {
  const TrainingRequestConversationEvent();

  @override
  List<Object> get props => [];
}

class AddTrainingRequestConversationEvent
    extends TrainingRequestConversationEvent {
  final TrainingRequestConversation trainingRequestConversation;

  const AddTrainingRequestConversationEvent({
    required this.trainingRequestConversation,
  });

  @override
  List<Object> get props => [trainingRequestConversation];
}

class UpdateTrainingRequestConversationEvent
    extends TrainingRequestConversationEvent {
  final TrainingRequestConversation trainingRequestConversation;

  const UpdateTrainingRequestConversationEvent({
    required this.trainingRequestConversation,
  });

  @override
  List<Object> get props => [trainingRequestConversation];
}

class DeleteTrainingRequestConversationEvent
    extends TrainingRequestConversationEvent {
  final int trainingRequestConversationId;

  const DeleteTrainingRequestConversationEvent({
    required this.trainingRequestConversationId,
  });

  @override
  List<Object> get props => [trainingRequestConversationId];
}
