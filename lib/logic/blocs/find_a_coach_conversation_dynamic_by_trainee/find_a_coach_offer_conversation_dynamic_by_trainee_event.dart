part of 'find_a_coach_offer_conversation_dynamic_by_trainee_bloc.dart';

abstract class FindACoachConversationDynamicByTraineeEvent extends Equatable {
  const FindACoachConversationDynamicByTraineeEvent();

  @override
  List<Object> get props => [];
}

class LoadFindACoachConversationDynamicByTraineeEvent
    extends FindACoachConversationDynamicByTraineeEvent {
  final int traineeId;
  final int offset;

  const LoadFindACoachConversationDynamicByTraineeEvent({
    required this.traineeId,
    this.offset = 0,
  });

  @override
  List<Object> get props => [traineeId, offset];
}
