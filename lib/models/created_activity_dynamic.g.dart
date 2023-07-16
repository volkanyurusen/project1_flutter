// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_activity_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatedActivityDynamic _$CreatedActivityDynamicFromJson(
        Map<String, dynamic> json) =>
    CreatedActivityDynamic(
      createdActivityId: json['created_activity_id'] as int?,
      host: UserDynamic.fromJson(json['host_id'] as Map<String, dynamic>),
      activityNameDynamic: ActivityNameDynamic.fromJson(
          json['activity_name_id'] as Map<String, dynamic>),
      locationDetailDynamic: LocationDetailDynamic.fromJson(
          json['location_detail_id'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      isActive: json['is_active'] as bool? ?? true,
    );

Map<String, dynamic> _$CreatedActivityDynamicToJson(
        CreatedActivityDynamic instance) =>
    <String, dynamic>{
      'created_activity_id': instance.createdActivityId,
      'host_id': instance.host,
      'activity_name_id': instance.activityNameDynamic,
      'location_detail_id': instance.locationDetailDynamic,
      'create_at': instance.createdAt,
      'is_active': instance.isActive,
    };
