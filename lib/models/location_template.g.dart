// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationTemplate _$LocationTemplateFromJson(Map<String, dynamic> json) =>
    LocationTemplate(
      locationTemplateId: json['location_template_id'] as int?,
      userId: json['user_id'] as int,
      locationDetailId: json['location_detail_id'] as int,
      locationTemplateName: json['location_template_name'] as String,
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

Map<String, dynamic> _$LocationTemplateToJson(LocationTemplate instance) =>
    <String, dynamic>{
      'location_template_id': instance.locationTemplateId,
      'user_id': instance.userId,
      'location_detail_id': instance.locationDetailId,
      'location_template_name': instance.locationTemplateName,
      'created_at': instance.createdAt.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
    };
