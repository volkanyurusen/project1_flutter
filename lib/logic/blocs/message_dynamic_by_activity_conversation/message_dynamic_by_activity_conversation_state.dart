part of 'message_dynamic_by_activity_conversation_bloc.dart';

class MessageDynamicByActivityConversationState extends Equatable {
  final List<MessageDynamic> messageDynamicList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;

  const MessageDynamicByActivityConversationState({
    this.messageDynamicList = const [],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
  });

  MessageDynamicByActivityConversationState copyWith({
    List<MessageDynamic>? messageDynamicList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
  }) {
    return MessageDynamicByActivityConversationState(
      messageDynamicList: messageDynamicList ?? this.messageDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [messageDynamicList, error, status, hasReachedMax];

  @override
  String toString() =>
      'MessageDynamicByActivityConversationState(tmessageDynamicList: $messageDynamicList, error: $error, status: $status, hasReachedMax: $hasReachedMax)';
}
