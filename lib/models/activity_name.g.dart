// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityName _$ActivityNameFromJson(Map<String, dynamic> json) => ActivityName(
      activityNameId: json['activity_name_id'] as int?,
      activityTitle: json['activity_title'] as String,
      activityType: ActivityType.fromJson(
          json['activity_type_id'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      deactivatedAt: json['deactivated_at'] == null
          ? null
          : DateTime.parse(json['deactivated_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      isActive: json['is_active'] as bool? ?? true,
    );

Map<String, dynamic> _$ActivityNameToJson(ActivityName instance) =>
    <String, dynamic>{
      'activity_name_id': instance.activityNameId,
      'activity_title': instance.activityTitle,
      'activity_type': instance.activityType,
      'created_at': instance.createdAt.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
    };
