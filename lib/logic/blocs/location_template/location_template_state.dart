part of 'location_template_bloc.dart';

class LocationTemplateState extends Equatable {
  final List<DBStatus> dbStatusList;
  final String error;
  final Status status;

  const LocationTemplateState({
    this.dbStatusList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  LocationTemplateState copyWith({
    List<DBStatus>? dbStatusList,
    String? error,
    Status? status,
  }) {
    return LocationTemplateState(
      dbStatusList: dbStatusList ?? this.dbStatusList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [dbStatusList, error, status];

  @override
  String toString() =>
      'LocationTemplateState(dbStatusList: $dbStatusList, error: $error, status: $status)';
}
