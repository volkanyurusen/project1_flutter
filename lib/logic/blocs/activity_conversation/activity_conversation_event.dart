part of 'activity_conversation_bloc.dart';

abstract class ActivityConversationEvent extends Equatable {
  const ActivityConversationEvent();

  @override
  List<Object> get props => [];
}

class AddActivityConversationEvent extends ActivityConversationEvent {
  final ActivityConversation activityConversation;

  const AddActivityConversationEvent({
    required this.activityConversation,
  });

  @override
  List<Object> get props => [activityConversation];
}

class UpdateActivityConversationEvent extends ActivityConversationEvent {
  final ActivityConversation activityConversation;

  const UpdateActivityConversationEvent({
    required this.activityConversation,
  });

  @override
  List<Object> get props => [activityConversation];
}

class DeleteActivityConversationEvent extends ActivityConversationEvent {
  final int activityConversationId;

  const DeleteActivityConversationEvent({
    required this.activityConversationId,
  });

  @override
  List<Object> get props => [activityConversationId];
}
