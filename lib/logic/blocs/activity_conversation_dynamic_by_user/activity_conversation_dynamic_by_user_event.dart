part of 'activity_conversation_dynamic_by_user_bloc.dart';

abstract class ActivityConversationDynamicByUserEvent extends Equatable {
  const ActivityConversationDynamicByUserEvent();

  @override
  List<Object> get props => [];
}

class LoadActivityConversationDynamicByUserEvent
    extends ActivityConversationDynamicByUserEvent {
  final int uId;
  final int offset;

  const LoadActivityConversationDynamicByUserEvent({
    required this.uId,
    this.offset = 0,
  });

  @override
  List<Object> get props => [uId, offset];
}

class RecallActivityConversationDynamicByUserEvent
    extends ActivityConversationDynamicByUserEvent {}
