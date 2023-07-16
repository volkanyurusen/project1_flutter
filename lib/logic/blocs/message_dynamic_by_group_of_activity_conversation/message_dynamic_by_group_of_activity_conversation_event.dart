part of 'message_dynamic_by_group_of_activity_conversation_bloc.dart';

abstract class MessageDynamicByGroupOfActivityConversationEvent
    extends Equatable {
  const MessageDynamicByGroupOfActivityConversationEvent();

  @override
  List<Object> get props => [];
}

class LoadMessageDynamicByGroupOfActivityConversationEvent
    extends MessageDynamicByGroupOfActivityConversationEvent {
  final int uId;
  final int offset;

  const LoadMessageDynamicByGroupOfActivityConversationEvent({
    required this.uId,
    this.offset = 0,
  });

  @override
  List<Object> get props => [uId, offset];
}

class RecallMessageDynamicByGroupOfActivityConversationEvent
    extends MessageDynamicByGroupOfActivityConversationEvent {}
