// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_name_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityNameDynamic _$ActivityNameDynamicFromJson(Map<String, dynamic> json) =>
    ActivityNameDynamic(
      activityNameId: json['activity_name_id'] as int?,
      activityTitle: json['activity_title'] as String,
      activityTypeDynamic: ActivityTypeDynamic.fromJson(
          json['activity_type_id'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ActivityNameDynamicToJson(
        ActivityNameDynamic instance) =>
    <String, dynamic>{
      'activity_name_id': instance.activityNameId,
      'activity_title': instance.activityTitle,
      'activity_type_id': instance.activityTypeDynamic,
    };
