part of 'training_request_message_dynamic_by_training_request_conversation_bloc.dart';

abstract class TrainingRequestMessageDynamicByTrainingRequestConversationEvent
    extends Equatable {
  const TrainingRequestMessageDynamicByTrainingRequestConversationEvent();

  @override
  List<Object> get props => [];
}

class LoadTrainingRequestMessageDynamicByTrainingRequestConversationEvent
    extends TrainingRequestMessageDynamicByTrainingRequestConversationEvent {
  final int uId;
  final int trainingRequestConversationId;
  final int offset;

  const LoadTrainingRequestMessageDynamicByTrainingRequestConversationEvent({
    required this.uId,
    required this.trainingRequestConversationId,
    this.offset = 0,
  });

  @override
  List<Object> get props => [uId, trainingRequestConversationId, offset];
}

class CleanTrainingRequestMessageDynamicByTrainingRequestConversation
    extends TrainingRequestMessageDynamicByTrainingRequestConversationEvent {}
