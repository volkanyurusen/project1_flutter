// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coaching_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoachingTemplate _$CoachingTemplateFromJson(Map<String, dynamic> json) =>
    CoachingTemplate(
      coachingTemplateId: json['coaching_template_id'] as int?,
      user: User.fromJson(json['user_id'] as Map<String, dynamic>),
      trainingDetail: TrainingDetail.fromJson(
          json['training_detail_id'] as Map<String, dynamic>),
      templateName: json['template_name'] as String,
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

Map<String, dynamic> _$CoachingTemplateToJson(CoachingTemplate instance) =>
    <String, dynamic>{
      'coaching_template_id': instance.coachingTemplateId,
      'user_id': instance.user,
      'training_detail_id': instance.trainingDetail,
      'template_name': instance.templateName,
      'created_at': instance.createdAt.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
    };
