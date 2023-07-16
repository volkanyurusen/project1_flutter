// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_detail_dynamic.g.dart';

const String tblLocationDetails = 'tblLocationDetails';

class LocationDetailDynamicFields {
  static final List<String> values = [
    locationDetailId,
    prefferedLocationCircularDiameter,
    membershipMaxDiameter,
    lat,
    lon,
  ];
  static const String locationDetailId = 'location_detail_id';
  static const String prefferedLocationCircularDiameter =
      'preffered_location_circular_diameter';
  static const String membershipMaxDiameter = 'membership_max_diameter';
  static const String lat = 'lat';
  static const String lon = 'lon';
}

@JsonSerializable()
class LocationDetailDynamic extends Equatable {
  final int? locationDetailId;
  final double prefferedLocationCircularDiameter;
  final double
      membershipMaxDiameter; //this can be convert to json from user's type of membership
  final double lat;
  final double lon;

  const LocationDetailDynamic({
    this.locationDetailId,
    this.prefferedLocationCircularDiameter = 3.00,
    this.membershipMaxDiameter = 3.00,
    required this.lat,
    required this.lon,
  });

  LocationDetailDynamic copy({
    int? locationDetailId,
    double? prefferedLocationCircularDiameter,
    double? membershipMaxDiameter,
    double? lat,
    double? lon,
  }) =>
      LocationDetailDynamic(
        locationDetailId: locationDetailId ?? this.locationDetailId,
        prefferedLocationCircularDiameter: prefferedLocationCircularDiameter ??
            this.prefferedLocationCircularDiameter,
        membershipMaxDiameter:
            membershipMaxDiameter ?? this.membershipMaxDiameter,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
      );

  factory LocationDetailDynamic.fromJson(Map<String, dynamic> json) =>
      _$LocationDetailDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDetailDynamicToJson(this);

  @override
  List<Object?> get props => [
        locationDetailId,
        prefferedLocationCircularDiameter,
        membershipMaxDiameter,
        lat,
        lon,
      ];

  @override
  String toString() {
    return 'tblLocationDetails(location_detail_id: $locationDetailId, preffered_location_circular_diameter: $prefferedLocationCircularDiameter, membership_max_diameter: $membershipMaxDiameter, lat: $lat, lon: $lon)';
  }
}
