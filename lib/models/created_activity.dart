// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'created_activity.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblCreatedActivities = 'tblCreatedActivities';

class CreatedActivityFields {
  static final List<String> values = [
    /// Add all fields here
    createdActivityId, hostId, activityNameId, locationDetailId, 
    createdAt, deactivatedAt, updatedAt, isActive,
  ];

  static const String createdActivityId = 'created_activity_id';
  static const String hostId = 'host_id';
  static const String activityNameId = 'activity_level_id';
  static const String locationDetailId = 'location_detail_id';
  static const String createdAt = 'created_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

/// When User click the button "Create Activity" this model is created. All created activity details
/// are stored in this table.
///
// @JsonSerializable()
class CreatedActivity extends Equatable {
  final int? createdActivityId;
  final int hostId;
  final int activityNameId;
  final int locationDetailId;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  CreatedActivity({
    this.createdActivityId,
    required this.hostId,
    required this.activityNameId,
    required this.locationDetailId,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : createdAt = createdAt ?? DateTime.now();

  CreatedActivity copy({
    int? createdActivityId,
    int? hostId,
    int? activityNameId,
    int? locationDetailId,
    DateTime? createdAt,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      CreatedActivity(
        createdActivityId: createdActivityId ?? this.createdActivityId,
        hostId: hostId ?? this.hostId,
        activityNameId: activityNameId ?? this.activityNameId,
        locationDetailId: locationDetailId ?? this.locationDetailId,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory CreatedActivity.fromJson(Map<String, dynamic> json) =>
      _$CreatedActivityFromJson(json);

  Map<String, dynamic> toJson() => _$CreatedActivityToJson(this);

  @override
  List<Object?> get props => [
        createdActivityId,
        hostId,
        activityNameId,
        locationDetailId,
        createdAt,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblCreatedActivities(created_activity_id: $createdActivityId, host_id: $hostId, activity_detail_id: $activityNameId, location_detail_id: $locationDetailId, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}
