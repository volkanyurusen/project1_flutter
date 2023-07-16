part of 'find_a_coach_message_dynamic_by_find_a_coach_conversation_bloc.dart';

abstract class FindACoachMessageDynamicByFindACoachConversationEvent
    extends Equatable {
  const FindACoachMessageDynamicByFindACoachConversationEvent();

  @override
  List<Object> get props => [];
}

class LoadFindACoachMessageDynamicByFindACoachConversationEvent
    extends FindACoachMessageDynamicByFindACoachConversationEvent {
  final int traineeId;
  final int findACoachConversationId;
  final int offset;

  const LoadFindACoachMessageDynamicByFindACoachConversationEvent({
    required this.traineeId,
    required this.findACoachConversationId,
    this.offset = 0,
  });

  @override
  List<Object> get props => [traineeId, findACoachConversationId, offset];
}

class CleanFindACoachMessageDynamicByFindACoachConversation
    extends FindACoachMessageDynamicByFindACoachConversationEvent {}
