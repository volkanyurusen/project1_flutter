// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coaching_location_template_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoachingLocationTemplateDynamic _$CoachingLocationTemplateDynamicFromJson(
        Map<String, dynamic> json) =>
    CoachingLocationTemplateDynamic(
      coachingLocationTemplateId: json['coaching_location_template_id'] as int?,
      coachDynamic:
          CoachDynamic.fromJson(json['coach_id'] as Map<String, dynamic>),
      coachingLocationDetailDynamic: CoachingLocationDetailDynamic.fromJson(
          json['coaching_location_detail_id'] as Map<String, dynamic>),
      coachingLocationTemplateName:
          json['coaching_location_template_name'] as String,
    );

Map<String, dynamic> _$CoachingLocationTemplateDynamicToJson(
        CoachingLocationTemplateDynamic instance) =>
    <String, dynamic>{
      'coaching_location_template_id': instance.coachingLocationTemplateId,
      'coach_id': instance.coachDynamic,
      'coaching_location_detail_id': instance.coachingLocationDetailDynamic,
      'coaching_location_template_name': instance.coachingLocationTemplateName,
    };
