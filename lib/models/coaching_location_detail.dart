// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'coaching_location_detail.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblCoachingLocationDetails = 'tblCoachingLocationDetails';

class CoachingLocationDetailFields {
  static final List<String> values = [
    /// Add all fields here
    coachingLocationDetailId, prefferedLocationCircularDiameter,
    coachingMaxDiameter, lat, lon, createdAt, deactivatedAt, updatedAt,
    isActive,
  ];

  static const String coachingLocationDetailId = 'coaching_location_detail_id';
  static const String prefferedLocationCircularDiameter =
      'preffered_location_circular_diameter';
  static const String coachingMaxDiameter = 'coaching_max_diameter';
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
/// coachingMaxDiameter: this variable keeps the membership's circularDiameter which is given
///             to all users in their membership type.
// @JsonSerializable()
class CoachingLocationDetail extends Equatable {
  final int? coachingLocationDetailId;
  final double prefferedLocationCircularDiameter;
  final double
      coachingMaxDiameter; // This can change with Membership's max diameter
  final double lat;
  final double lon;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  CoachingLocationDetail({
    this.coachingLocationDetailId,
    this.prefferedLocationCircularDiameter = 3.00,
    this.coachingMaxDiameter = 3.00,
    required this.lat,
    required this.lon,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : createdAt = createdAt ?? DateTime.now();

  CoachingLocationDetail copy({
    int? coachingLocationDetailId,
    double? prefferedLocationCircularDiameter,
    double? coachingMaxDiameter,
    double? lat,
    double? lon,
    DateTime? createdAt,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      CoachingLocationDetail(
        coachingLocationDetailId:
            coachingLocationDetailId ?? this.coachingLocationDetailId,
        prefferedLocationCircularDiameter: prefferedLocationCircularDiameter ??
            this.prefferedLocationCircularDiameter,
        coachingMaxDiameter: coachingMaxDiameter ?? this.coachingMaxDiameter,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory CoachingLocationDetail.fromJson(Map<String, dynamic> json) =>
      _$CoachingLocationDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CoachingLocationDetailToJson(this);

  @override
  List<Object?> get props => [
        coachingLocationDetailId,
        prefferedLocationCircularDiameter,
        coachingMaxDiameter,
        lat,
        lon,
        createdAt,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblCoachingLocationDetails(coaching_location_detail_id: $coachingLocationDetailId, preffered_location_circular_diameter: $prefferedLocationCircularDiameter, coaching_max_diameter: $coachingMaxDiameter, lat: $lat, lon: $lon, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}
