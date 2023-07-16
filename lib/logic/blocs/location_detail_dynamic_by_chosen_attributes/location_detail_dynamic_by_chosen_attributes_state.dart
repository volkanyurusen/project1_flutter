part of 'location_detail_dynamic_by_chosen_attributes_bloc.dart';

class LocationDetailDynamicByChosenAttributesState extends Equatable {
  final List<LocationDetailDynamic> locationDetailDynamicList;
  final String error;
  final Status status;

  const LocationDetailDynamicByChosenAttributesState({
    this.locationDetailDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  LocationDetailDynamicByChosenAttributesState copyWith({
    List<LocationDetailDynamic>? locationDetailDynamicList,
    String? error,
    Status? status,
  }) {
    return LocationDetailDynamicByChosenAttributesState(
      locationDetailDynamicList:
          locationDetailDynamicList ?? this.locationDetailDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [locationDetailDynamicList, error, status];

  @override
  String toString() =>
      'LocationDetailDynamicByChosenAttributesState(locationDetailDynamicList: $locationDetailDynamicList, error: $error, status: $status)';
}
