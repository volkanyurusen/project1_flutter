part of 'find_a_coach_message_dynamic_by_group_of_find_a_coach_conversation_bloc.dart';

abstract class FindACoachMessageDynamicByGroupOfFindACoachConversationEvent
    extends Equatable {
  const FindACoachMessageDynamicByGroupOfFindACoachConversationEvent();

  @override
  List<Object> get props => [];
}

class LoadFindACoachMessageDynamicByGroupOfFindACoachConversationEvent
    extends FindACoachMessageDynamicByGroupOfFindACoachConversationEvent {
  final int traineeId;
  final List<int?> findACoachConversationList;

  const LoadFindACoachMessageDynamicByGroupOfFindACoachConversationEvent({
    required this.traineeId,
    required this.findACoachConversationList,
  });

  @override
  List<Object> get props => [traineeId, findACoachConversationList];
}
