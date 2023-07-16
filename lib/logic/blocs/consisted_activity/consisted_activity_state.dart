part of 'consisted_activity_bloc.dart';

class ConsistedActivityState extends Equatable {
  final List<DBStatus> dbStatusList;
  final String error;
  final Status status;

  const ConsistedActivityState({
    this.dbStatusList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  ConsistedActivityState copyWith({
    List<DBStatus>? dbStatusList,
    String? error,
    Status? status,
  }) {
    return ConsistedActivityState(
      dbStatusList: dbStatusList ?? this.dbStatusList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [dbStatusList, error, status];

  @override
  String toString() =>
      'ConsistedActivityState(dbStatusList: $dbStatusList, error: $error, status: $status)';
}
