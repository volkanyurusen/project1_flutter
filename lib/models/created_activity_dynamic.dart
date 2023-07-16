// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'created_activity_dynamic.g.dart';

const String tblCreatedActivityDynamic = 'tblCreatedActivityDynamic';

class CreatedActivityDynamicFields {
  static final List<String> values = [
    createdActivityId,
    hostId,
    activityNameId,
    locationDetailId,
    createdAt,
    isActive,
  ];
  static const String createdActivityId = 'created_activity_id';
  static const String hostId = 'host_id';
  static const String activityNameId = 'activity_name_id';
  static const String locationDetailId = 'location_detail_id';
  static const String createdAt = 'created_at';
  static const String isActive = 'is_active';
}

@JsonSerializable()
class CreatedActivityDynamic extends Equatable {
  final int? createdActivityId;
  final UserDynamic host;
  final ActivityNameDynamic activityNameDynamic;
  final LocationDetailDynamic locationDetailDynamic;
  final DateTime createdAt;
  final bool isActive;

  const CreatedActivityDynamic({
    this.createdActivityId,
    required this.host,
    required this.activityNameDynamic,
    required this.locationDetailDynamic,
    required this.createdAt,
    this.isActive = true,
  });

  CreatedActivityDynamic copy({
    int? createdActivityId,
    UserDynamic? host,
    ActivityNameDynamic? activityNameDynamic,
    LocationDetailDynamic? locationDetailDynamic,
    DateTime? createdAt,
    bool? isActive,
  }) =>
      CreatedActivityDynamic(
        createdActivityId: createdActivityId ?? this.createdActivityId,
        host: host ?? this.host,
        activityNameDynamic:
            activityNameDynamic ?? this.activityNameDynamic,
        locationDetailDynamic:
            locationDetailDynamic ?? this.locationDetailDynamic,
        createdAt: createdAt ?? this.createdAt,
        isActive: isActive ?? this.isActive,
      );

  factory CreatedActivityDynamic.fromJson(Map<String, dynamic> json) =>
      _$CreatedActivityDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$CreatedActivityDynamicToJson(this);

  @override
  List<Object?> get props => [
        createdActivityId,
        host,
        activityNameDynamic,
        locationDetailDynamic,
        createdAt,
        isActive,
      ];

  @override
  String toString() {
    return 'CreatedActivityDynamic(createdActivityId: $createdActivityId, host: $host, activityNameDynamic: $activityNameDynamic, locationDetailDynamic: $locationDetailDynamic, createdAt: $createdAt, is_active: $isActive)';
  }
}
