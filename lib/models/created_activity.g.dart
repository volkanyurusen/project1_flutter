// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatedActivity _$CreatedActivityFromJson(Map<String, dynamic> json) =>
    CreatedActivity(
      createdActivityId: json['created_activity_id'] as int?,
      hostId: json['host_id'] as int,
      activityNameId: json['activity_name_id'] as int,
      locationDetailId: json['location_detail_id'] as int,
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

Map<String, dynamic> _$CreatedActivityToJson(CreatedActivity instance) =>
    <String, dynamic>{
      'created_activity_id': instance.createdActivityId,
      'host_id': instance.hostId,
      'activity_name_id': instance.activityNameId,
      'location_detail_id': instance.locationDetailId,
      'created_at': instance.createdAt.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
    };
