part of 'training_offer_message_dynamic_by_training_offer_conversation_bloc.dart';

abstract class TrainingOfferMessageDynamicByTrainingOfferConversationEvent
    extends Equatable {
  const TrainingOfferMessageDynamicByTrainingOfferConversationEvent();

  @override
  List<Object> get props => [];
}

class LoadTrainingOfferMessageDynamicByTrainingOfferConversationEvent
    extends TrainingOfferMessageDynamicByTrainingOfferConversationEvent {
  final int uId;
  final int trainingOfferConversationId;
  final int offset;

  const LoadTrainingOfferMessageDynamicByTrainingOfferConversationEvent({
    required this.uId,
    required this.trainingOfferConversationId,
    this.offset = 0,
  });

  @override
  List<Object> get props => [uId, trainingOfferConversationId, offset];
}

class CleanTrainingOfferMessageDynamicByTrainingOfferConversation
    extends TrainingOfferMessageDynamicByTrainingOfferConversationEvent {}
