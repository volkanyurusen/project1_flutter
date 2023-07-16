// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_activity_dynamic_with_distance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatedActivityDynamicWithDistance _$CreatedActivityDynamicWithDistanceFromJson(
        Map<String, dynamic> json) =>
    CreatedActivityDynamicWithDistance(
      createdActivityId: json['created_activity_id'] as int?,
      host: UserDynamic.fromJson(json['host_id'] as Map<String, dynamic>),
      activityNameDynamic: ActivityNameDynamic.fromJson(
          json['activity_name_id'] as Map<String, dynamic>),
      locationDetailDynamic: LocationDetailDynamic.fromJson(
          json['location_detail_id'] as Map<String, dynamic>),
      distanceBetween: double.parse(json['distance_between']),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$CreatedActivityDynamicWithDistanceToJson(
        CreatedActivityDynamicWithDistance instance) =>
    <String, dynamic>{
      'created_activity_id': instance.createdActivityId,
      'host_id': instance.host,
      'activity_name_id': instance.activityNameDynamic,
      'location_detail_id': instance.locationDetailDynamic,
      'distance_between': instance.distanceBetween,
      'create_at': instance.createdAt,
    };
