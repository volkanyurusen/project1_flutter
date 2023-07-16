part of 'training_request_conversation_dynamic_by_user_bloc.dart';

abstract class TrainingRequestConversationDynamicByUserEvent extends Equatable {
  const TrainingRequestConversationDynamicByUserEvent();

  @override
  List<Object> get props => [];
}

class LoadTrainingRequestConversationDynamicByUserEvent
    extends TrainingRequestConversationDynamicByUserEvent {
  final int uId;
  final int offset;

  const LoadTrainingRequestConversationDynamicByUserEvent({
    required this.uId,
    this.offset = 0,
  });

  @override
  List<Object> get props => [uId, offset];
}

class RecallTrainingRequestConversationDynamicByUserEvent
    extends TrainingRequestConversationDynamicByUserEvent {}
