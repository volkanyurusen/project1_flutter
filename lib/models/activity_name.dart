// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

import 'package:my_project/models/models.dart';

part 'activity_name.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblActivityNames = 'tblActivityNames';

class ActivityNameFields {
  static final List<String> values = [
    /// Add all fields here
    activityNameId, activityTypeId, activityTitle, activityTypeId, createdAt,
    deactivatedAt, updatedAt, isActive,
  ];

  static const String activityNameId = 'activity_name_id';
  static const String activityTitle = 'activity_title';
  static const String activityTypeId = 'activity_type_id';
  static const String createdAt = 'created_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

/// activityName is as its name suggests, it is name of activities.
///
// @JsonSerializable()
class ActivityName extends Equatable {
  final int? activityNameId;
  final String activityTitle;
  final ActivityType activityType;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  ActivityName({
    this.activityNameId,
    required this.activityTitle,
    required this.activityType,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : createdAt = createdAt ?? DateTime.now();

  ActivityName copy({
    int? activityNameId,
    String? activityTitle,
    ActivityType? activityType,
    DateTime? createdAt,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      ActivityName(
        activityNameId: activityNameId ?? this.activityNameId,
        activityTitle: activityTitle ?? this.activityTitle,
        activityType: activityType ?? this.activityType,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory ActivityName.fromJson(Map<String, dynamic> json) =>
      _$ActivityNameFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityNameToJson(this);

  @override
  List<Object?> get props => [
        activityNameId,
        activityTitle,
        activityType,
        createdAt,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblActivityNames(activity_name_id: $activityNameId, activity_title: $activityTitle, activity_type: $activityType, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}
