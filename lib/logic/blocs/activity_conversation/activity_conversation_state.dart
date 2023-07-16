part of 'activity_conversation_bloc.dart';

class ActivityConversationState extends Equatable {
  final List<DBStatus> dbStatusList;
  final String error;
  final Status status;

  const ActivityConversationState({
    this.dbStatusList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  ActivityConversationState copyWith({
    List<DBStatus>? dbStatusList,
    String? error,
    Status? status,
  }) {
    return ActivityConversationState(
      dbStatusList: dbStatusList ?? this.dbStatusList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [dbStatusList, error, status];

  @override
  String toString() =>
      'ActivityConversationState(dbStatusList: $dbStatusList, error: $error, status: $status)';
}
