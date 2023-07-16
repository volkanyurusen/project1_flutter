// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coaching_type_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoachingTypeDynamic _$CoachingTypeDynamicFromJson(Map<String, dynamic> json) =>
    CoachingTypeDynamic(
      coachingTypeId: json['coaching_type_id'] as int?,
      coachingTypeName: json['coaching_type_name'] as String,
      creatingTrainingLimitPerDay:
          json['creating_training_limit_per_day'] as int,
      locationCircularDiameter:
          double.parse(json['location_circular_diameter']),
    );

Map<String, dynamic> _$CoachingTypeDynamicToJson(
        CoachingTypeDynamic instance) =>
    <String, dynamic>{
      'coaching_type_id': instance.coachingTypeId,
      'coaching_type_name': instance.coachingTypeName,
      'creating_training_limit_per_day': instance.creatingTrainingLimitPerDay,
      'location_circular_diameter': instance.locationCircularDiameter,
    };
