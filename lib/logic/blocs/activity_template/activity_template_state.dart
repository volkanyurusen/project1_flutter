part of 'activity_template_bloc.dart';

class ActivityTemplateState extends Equatable {
  final List<DBStatus> dbStatusList;
  final String error;
  final Status status;

  const ActivityTemplateState({
    this.dbStatusList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  ActivityTemplateState copyWith({
    List<DBStatus>? dbStatusList,
    String? error,
    Status? status,
  }) {
    return ActivityTemplateState(
      dbStatusList:
          dbStatusList ?? this.dbStatusList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [dbStatusList, error, status];

  @override
  String toString() =>
      'ActivityTemplateState(dbStatusList: $dbStatusList, error: $error, status: $status)';
}
