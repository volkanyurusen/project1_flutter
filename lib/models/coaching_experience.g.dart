// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coaching_experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoachingExperience _$CoachingExperienceFromJson(Map<String, dynamic> json) =>
    CoachingExperience(
      coachingExperienceId: json['coaching_experience_id'] as int?,
      experienceYear: json['experience_year'] as String,
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

Map<String, dynamic> _$CoachingExperienceToJson(CoachingExperience instance) =>
    <String, dynamic>{
      'coaching_experience_id': instance.coachingExperienceId,
      'experience_year': instance.experienceYear,
      'created_at': instance.createdAt.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
    };
