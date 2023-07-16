// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'activity_type.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblActivityTypes = 'tblactivityTypes';

class ActivityTypeFields {
  static final List<String> values = [
    /// Add all fields here
    activityTypeId, activityTypeDetail, createdAt, deactivatedAt, updatedAt,
    isActive,
  ];

  static const String activityTypeId = 'activity_type_id';
  static const String activityTypeDetail = 'activity_type_detail';
  static const String createdAt = 'created_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

/// activity Type is generated with being grouped all the current activities.
/// So both the creator can create an activity easily and an attendee can find
/// easily an activity he/she would like to attend.
///
// @JsonSerializable()
class ActivityType extends Equatable {
  final int? activityTypeId;
  final String activityTypeDetail;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  ActivityType({
    this.activityTypeId,
    required this.activityTypeDetail,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : createdAt = createdAt ?? DateTime.now();

  ActivityType copy({
    int? activityTypeId,
    String? activityTypeDetail,
    DateTime? createdAt,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      ActivityType(
        activityTypeId: activityTypeId ?? this.activityTypeId,
        activityTypeDetail: activityTypeDetail ?? this.activityTypeDetail,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory ActivityType.fromJson(Map<String, dynamic> json) =>
      _$ActivityTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityTypeToJson(this);

  @override
  List<Object?> get props => [
        activityTypeId,
        activityTypeDetail,
        createdAt,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblActivityTypes(activity_type_id: $activityTypeId, activity_type_detail: $activityTypeDetail, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}
