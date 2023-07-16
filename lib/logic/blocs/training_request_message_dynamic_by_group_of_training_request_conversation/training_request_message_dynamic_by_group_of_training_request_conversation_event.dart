part of 'training_request_message_dynamic_by_group_of_training_request_conversation_bloc.dart';

abstract class TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationEvent
    extends Equatable {
  const TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationEvent();

  @override
  List<Object> get props => [];
}

class LoadTrainingRequestMessageDynamicByGroupOfTrainingRequestConversationEvent
    extends TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationEvent {
  final int uId;
  final List<int?> trainingRequestConversationList;

  const LoadTrainingRequestMessageDynamicByGroupOfTrainingRequestConversationEvent({
    required this.uId,
    required this.trainingRequestConversationList,
  });

  @override
  List<Object> get props => [uId, trainingRequestConversationList];
}

class RecallTrainingRequestMessageDynamicByGroupOfTrainingRequestConversationEvent
    extends TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationEvent {}
