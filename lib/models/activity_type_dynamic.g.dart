// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_type_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityTypeDynamic _$ActivityTypeDynamicFromJson(Map<String, dynamic> json) =>
    ActivityTypeDynamic(
      activityTypeId: json['activity_type_id'] as int?,
      activityTypeDetail: json['activity_type_detail'] as String,
    );

Map<String, dynamic> _$ActivityTypeDynamicToJson(
        ActivityTypeDynamic instance) =>
    <String, dynamic>{
      'activity_type_id': instance.activityTypeId,
      'activity_type_detail': instance.activityTypeDetail,
    };
