part of 'training_request_bloc.dart';

class TrainingRequestState extends Equatable {
  final List<DBStatus> dbStatusList;
  final String error;
  final Status status;

  const TrainingRequestState({
    this.dbStatusList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  TrainingRequestState copyWith({
    List<DBStatus>? dbStatusList,
    String? error,
    Status? status,
  }) {
    return TrainingRequestState(
      dbStatusList: dbStatusList ?? this.dbStatusList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [dbStatusList, error, status];

  @override
  String toString() =>
      'TrainingRequestState(dbStatusList: $dbStatusList, error: $error, status: $status)';
}
