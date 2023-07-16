part of 'coach_db_bloc.dart';

class CoachDBState extends Equatable {
  final List<DBStatus> dbStatusList;
  final String error;
  final Status status;

  const CoachDBState({
    this.dbStatusList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  CoachDBState copyWith({
    List<DBStatus>? dbStatusList,
    String? error,
    Status? status,
  }) {
    return CoachDBState(
      dbStatusList: dbStatusList ?? this.dbStatusList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [dbStatusList, error, status];

  @override
  String toString() =>
      'CoachDBState(dbStatusList: $dbStatusList, error: $error, status: $status)';
}
