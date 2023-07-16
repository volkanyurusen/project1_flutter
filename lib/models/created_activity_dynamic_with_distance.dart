// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'created_activity_dynamic_with_distance.g.dart';

const String tblCreatedActivityDynamicWithDistance =
    'tblCreatedActivityDynamicWithDistance';

class CreatedActivityDynamicWithDistanceFields {
  static final List<String> values = [
    createdActivityId,
    hostId,
    activityNameId,
    locationDetailId,
    distanceBetween,
    createdAt,
  ];
  static const String createdActivityId = 'created_activity_id';
  static const String hostId = 'host_id';
  static const String activityNameId = 'activity_name_id';
  static const String locationDetailId = 'location_detail_id';
  static const String distanceBetween = 'distance_between';
  static const String createdAt = 'created_at';
}

@JsonSerializable()
class CreatedActivityDynamicWithDistance extends Equatable {
  final int? createdActivityId;
  final UserDynamic host;
  final ActivityNameDynamic activityNameDynamic;
  final LocationDetailDynamic locationDetailDynamic;
  final double distanceBetween;
  final DateTime createdAt;

  const CreatedActivityDynamicWithDistance({
    this.createdActivityId,
    required this.host,
    required this.activityNameDynamic,
    required this.locationDetailDynamic,
    required this.distanceBetween,
    required this.createdAt,
  });

  CreatedActivityDynamicWithDistance copy({
    int? createdActivityId,
    UserDynamic? host,
    ActivityNameDynamic? activityNameDynamic,
    LocationDetailDynamic? locationDetailDynamic,
    double? distanceBetween,
    DateTime? createdAt,
  }) =>
      CreatedActivityDynamicWithDistance(
        createdActivityId: createdActivityId ?? this.createdActivityId,
        host: host ?? this.host,
        activityNameDynamic:
            activityNameDynamic ?? this.activityNameDynamic,
        locationDetailDynamic:
            locationDetailDynamic ?? this.locationDetailDynamic,
        distanceBetween: distanceBetween ?? this.distanceBetween,
        createdAt: createdAt ?? this.createdAt,
      );

  factory CreatedActivityDynamicWithDistance.fromJson(
          Map<String, dynamic> json) =>
      _$CreatedActivityDynamicWithDistanceFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CreatedActivityDynamicWithDistanceToJson(this);

  @override
  List<Object?> get props => [
        createdActivityId,
        host,
        activityNameDynamic,
        locationDetailDynamic,
        distanceBetween,
        createdAt,
      ];

  @override
  String toString() {
    return 'tblCreatedActivyDynamicWithDistance(created_activity_id: $createdActivityId, host_id: $host, activity_detail_id: $activityNameDynamic, location_detail_id: $locationDetailDynamic, distance_between: $distanceBetween, createdAt: $createdAt)';
  }
}
