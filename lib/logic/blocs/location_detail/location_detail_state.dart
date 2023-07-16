part of 'location_detail_bloc.dart';

class LocationDetailState extends Equatable {
  final List<DBStatus> dbStatusList;
  final String error;
  final Status status;

  const LocationDetailState({
    this.dbStatusList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  LocationDetailState copyWith({
    List<DBStatus>? dbStatusList,
    String? error,
    Status? status,
  }) {
    return LocationDetailState(
      dbStatusList: dbStatusList ?? this.dbStatusList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [dbStatusList, error, status];

  @override
  String toString() =>
      'LocationDetailState(dbStatusList: $dbStatusList, error: $error, status: $status)';
}
