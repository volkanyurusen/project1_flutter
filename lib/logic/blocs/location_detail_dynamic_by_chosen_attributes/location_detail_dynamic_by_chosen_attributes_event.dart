part of 'location_detail_dynamic_by_chosen_attributes_bloc.dart';

abstract class LocationDetailDynamicByChosenAttributesEvent extends Equatable {
  const LocationDetailDynamicByChosenAttributesEvent();

  @override
  List<Object> get props => [];
}

class LoadLocationDetailDynamicByChosenAttributesEvent
    extends LocationDetailDynamicByChosenAttributesEvent {
  final int? locationDetailId;
  final double prefferedLocationCircularDiameter;
  final double membershipMaxDiameter;
  final double lat;
  final double lon;

  const LoadLocationDetailDynamicByChosenAttributesEvent({
    this.locationDetailId,
    required this.prefferedLocationCircularDiameter,
    required this.membershipMaxDiameter,
    required this.lat,
    required this.lon,
  });

  @override
  List<Object> get props => [
        locationDetailId!,
        prefferedLocationCircularDiameter,
        membershipMaxDiameter,
        lat,
        lon,
      ];
}
