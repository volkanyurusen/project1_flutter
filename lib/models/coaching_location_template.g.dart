// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coaching_location_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoachingLocationTemplate _$CoachingLocationTemplateFromJson(
        Map<String, dynamic> json) =>
    CoachingLocationTemplate(
      coachingLocationTemplateId: json['coaching_location_template_id'] as int?,
      coach: Coach.fromJson(json['coach_id'] as Map<String, dynamic>),
      coachingLocationDetail: CoachingLocationDetail.fromJson(
          json['coaching_location_detail_id'] as Map<String, dynamic>),
      coachingLocationTemplateName:
          json['coaching_location_template_name'] as String,
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

Map<String, dynamic> _$CoachingLocationTemplateToJson(
        CoachingLocationTemplate instance) =>
    <String, dynamic>{
      'coaching_location_template_id': instance.coachingLocationTemplateId,
      'coach_id': instance.coach,
      'coaching_location_detail_id': instance.coachingLocationDetail,
      'coaching_location_template_name': instance.coachingLocationTemplateName,
      'created_at': instance.createdAt.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
    };
