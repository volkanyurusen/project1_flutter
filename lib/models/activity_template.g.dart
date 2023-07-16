// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityTemplate _$ActivityTemplateFromJson(Map<String, dynamic> json) =>
    ActivityTemplate(
      activityTemplateId: json['activity_template_id'] as int?,
      userId: json['user_id'] as int,
      activityNameId: json['activity_name_id'] as int,
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

Map<String, dynamic> _$ActivityTemplateToJson(ActivityTemplate instance) =>
    <String, dynamic>{
      'activity_template_id': instance.activityTemplateId,
      'user_id': instance.userId,
      'activity_name_id': instance.activityNameId,
      'template_name': instance.templateName,
      'created_at': instance.createdAt.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
    };
