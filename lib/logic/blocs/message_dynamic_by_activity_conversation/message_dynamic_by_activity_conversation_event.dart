part of 'message_dynamic_by_activity_conversation_bloc.dart';

abstract class MessageDynamicByActivityConversationEvent extends Equatable {
  const MessageDynamicByActivityConversationEvent();

  @override
  List<Object> get props => [];
}

class LoadMessageDynamicByActivityConversationEvent
    extends MessageDynamicByActivityConversationEvent {
  final int createdActivityId;
  final int offset;

  const LoadMessageDynamicByActivityConversationEvent({
    required this.createdActivityId,
    this.offset = 0,
  });

  @override
  List<Object> get props => [createdActivityId, offset];
}

class CleanMessageDynamicByActivityConversation
    extends MessageDynamicByActivityConversationEvent {}
