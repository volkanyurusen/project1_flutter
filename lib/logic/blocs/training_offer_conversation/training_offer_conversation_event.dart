part of 'training_offer_conversation_bloc.dart';

abstract class TrainingOfferConversationEvent extends Equatable {
  const TrainingOfferConversationEvent();

  @override
  List<Object> get props => [];
}

class AddTrainingOfferConversationEvent extends TrainingOfferConversationEvent {
  final TrainingOfferConversation trainingOfferConversation;

  const AddTrainingOfferConversationEvent({
    required this.trainingOfferConversation,
  });

  @override
  List<Object> get props => [trainingOfferConversation];
}

class UpdateTrainingOfferConversationEvent
    extends TrainingOfferConversationEvent {
  final TrainingOfferConversation trainingOfferConversation;

  const UpdateTrainingOfferConversationEvent({
    required this.trainingOfferConversation,
  });

  @override
  List<Object> get props => [trainingOfferConversation];
}

class DeleteTrainingOfferConversationEvent
    extends TrainingOfferConversationEvent {
  final int trainingOfferConversationId;

  const DeleteTrainingOfferConversationEvent({
    required this.trainingOfferConversationId,
  });

  @override
  List<Object> get props => [trainingOfferConversationId];
}
