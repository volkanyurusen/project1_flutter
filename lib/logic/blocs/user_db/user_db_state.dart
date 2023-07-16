part of 'user_db_bloc.dart';

class UserDBState extends Equatable {
  final List<DBStatus> dbStatusList;
  final String error;
  final Status status;

  const UserDBState({
    this.dbStatusList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  UserDBState copyWith({
    List<DBStatus>? dbStatusList,
    String? error,
    Status? status,
  }) {
    return UserDBState(
      dbStatusList: dbStatusList ?? this.dbStatusList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [dbStatusList, error, status];

  @override
  String toString() =>
      'UserDBState(dbStatusList: $dbStatusList, error: $error, status: $status)';
}
