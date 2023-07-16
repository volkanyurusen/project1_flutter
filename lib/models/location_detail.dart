// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'location_detail.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblLocationDetails = 'tblLocationDetails';

class LocationDetailFields {
  static final List<String> values = [
    /// Add all fields here
    locationDetailId, prefferedLocationCircularDiameter, membershipMaxDiameter,
    lat, lon, createdAt, deactivatedAt, updatedAt, isActive,
  ];

  static const String locationDetailId = 'location_detail_id';
  static const String prefferedLocationCircularDiameter =
      'preffered_location_circular_diameter';
  static const String membershipMaxDiameter = 'membership_max_diameter';
  static const String lat = 'lat';
  static const String lon = 'lon';
  static const String createdAt = 'created_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

/// This table holds the information of location (latitude/longitude, circularDiameter) etc.
/// When user or coach try to other user/coach this model will keep all details about
/// location.
///
/// prefferedLocationCircularDiameter: it is a variable which keeps the details of the circular
///             diameter (km) which users or coaches choose to find other users or coaches
/// membershipMaxDiameter: this variable keeps the membership's circularDiameter which is given
///             to all users in their membership type.
///
// @JsonSerializable()
class LocationDetail extends Equatable {
  final int? locationDetailId;
  final double prefferedLocationCircularDiameter;
  final double
      membershipMaxDiameter; //this can be convert to json from user's type of membership
  final double lat;
  final double lon;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  LocationDetail({
    this.locationDetailId,
    this.prefferedLocationCircularDiameter = 3.00,
    this.membershipMaxDiameter = 3.00,
    required this.lat,
    required this.lon,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : createdAt = createdAt ?? DateTime.now();

  LocationDetail copy({
    int? locationDetailId,
    double? prefferedLocationCircularDiameter,
    double? membershipMaxDiameter,
    double? lat,
    double? lon,
    DateTime? createdAt,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      LocationDetail(
        locationDetailId: locationDetailId ?? this.locationDetailId,
        prefferedLocationCircularDiameter: prefferedLocationCircularDiameter ??
            this.prefferedLocationCircularDiameter,
        membershipMaxDiameter:
            membershipMaxDiameter ?? this.membershipMaxDiameter,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory LocationDetail.fromJson(Map<String, dynamic> json) =>
      _$LocationDetailFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDetailToJson(this);

  @override
  List<Object?> get props => [
        locationDetailId,
        prefferedLocationCircularDiameter,
        membershipMaxDiameter,
        lat,
        lon,
        createdAt,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblLocationDetails(location_detail_id: $locationDetailId, preffered_location_circular_diameter: $prefferedLocationCircularDiameter, membership_max_diameter: $membershipMaxDiameter, lat: $lat, lon: $lon, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}
