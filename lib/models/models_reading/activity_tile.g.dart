// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_tile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityTile _$ActivityTileFromJson(Map<String, dynamic> json) => ActivityTile(
      createdActivityId: json['created_activity_id'] as int?,
      hostId: json['host_id'] as int,
      username: json['username'] as String,
      picUrl: json['pic_url'] as String,
      activityTitle: json['activity_title'] as String,
      distanceBetween: double.parse(json['distance_between']),
    );

Map<String, dynamic> _$ActivityTileToJson(ActivityTile instance) =>
    <String, dynamic>{
      'created_activity_id': instance.createdActivityId,
      'host_id': instance.hostId,
      'username': instance.username,
      'pic_url': instance.picUrl,
      'activity_title': instance.activityTitle,
      'distance_between': instance.distanceBetween,
    };
