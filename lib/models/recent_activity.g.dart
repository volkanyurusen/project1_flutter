// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentActivity _$RecentActivityFromJson(Map<String, dynamic> json) =>
    RecentActivity(
      recentActivityId: json['consisted_activity_id'] as int?,
      activityTitle: json["created_activity_id"]["activity_detail_id"]
          ["activity_name_id"]["activity_title"] as String,
      activityDurationName: json["created_activity_id"]["activity_detail_id"]
          ["activity_duration_id"]["activity_duration_name"] as String,
      activityLevelDetail: json["created_activity_id"]["activity_detail_id"]
          ["activity_level_id"]["activity_level_detail"] as String,
      ageClassificationName: json["created_activity_id"]["activity_detail_id"]
          ["age_classification_id"]["age_classification_name"] as String,
      activityDate: DateTime.parse(
          json['created_activity_id']['activity_date'] as String),
      timePeriodName: json['created_activity_id']['activity_detail_id']
          ['time_period_id']['time_period_name'] as String,
    );

Map<String, dynamic> _$RecentActivityToJson(RecentActivity instance) =>
    <String, dynamic>{
      'consisted_activity_id': instance.recentActivityId,
      'activity_title': instance.activityTitle,
      'activity_duration_name': instance.activityDurationName,
      'activity_level_detail': instance.activityLevelDetail,
      'age_classification_name': instance.ageClassificationName,
      'activity_date': instance.activityDate.toIso8601String(),
      'time_period_name': instance.timePeriodName,
    };
