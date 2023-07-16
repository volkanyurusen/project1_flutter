part of 'training_request_conversation_bloc.dart';

class TrainingRequestConversationState extends Equatable {
  final List<DBStatus> dbStatusList;
  final String error;
  final Status status;

  const TrainingRequestConversationState({
    this.dbStatusList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  TrainingRequestConversationState copyWith({
    List<DBStatus>? dbStatusList,
    String? error,
    Status? status,
  }) {
    return TrainingRequestConversationState(
      dbStatusList: dbStatusList ?? this.dbStatusList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [dbStatusList, error, status];

  @override
  String toString() =>
      'TrainingRequestConversationState(dbStatusList: $dbStatusList, error: $error, status: $status)';
}
