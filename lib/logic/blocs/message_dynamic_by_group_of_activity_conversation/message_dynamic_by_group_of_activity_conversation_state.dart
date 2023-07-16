part of 'message_dynamic_by_group_of_activity_conversation_bloc.dart';

class MessageDynamicByGroupOfActivityConversationState extends Equatable {
  final List<MessageDynamic> messageDynamicList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;

  const MessageDynamicByGroupOfActivityConversationState({
    this.messageDynamicList = const [],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
  });

  MessageDynamicByGroupOfActivityConversationState copyWith({
    List<MessageDynamic>? messageDynamicList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
  }) {
    return MessageDynamicByGroupOfActivityConversationState(
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
      'MessageDynamicByGroupOfActivityConversationState(tmessageDynamicList: $messageDynamicList, error: $error, status: $status, hasReachedMax: $hasReachedMax)';
}
