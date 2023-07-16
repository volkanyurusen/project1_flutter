part of 'created_activity_bloc.dart';

class CreatedActivityState extends Equatable {
  final List<DBStatus> dbStatusList;
  final String error;
  final Status status;

  const CreatedActivityState({
    this.dbStatusList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  CreatedActivityState copyWith({
    List<DBStatus>? dbStatusList,
    String? error,
    Status? status,
  }) {
    return CreatedActivityState(
      dbStatusList: dbStatusList ?? this.dbStatusList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [dbStatusList, error, status];

  @override
  String toString() =>
      'CreatedActivityState(dbStatusList: $dbStatusList, error: $error, status: $status)';
}
