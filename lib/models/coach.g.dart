// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coach _$CoachFromJson(Map<String, dynamic> json) => Coach(
      coachId: json['coach_id'] as int?,
      user: User.fromJson(json['user_id'] as Map<String, dynamic>),
      coachingType: CoachingType.fromJson(
          json['coaching_type_id'] as Map<String, dynamic>),
      coachingExperience: CoachingExperience.fromJson(
          json['coaching_experience_id'] as Map<String, dynamic>),
      perLessonPrice: json['per_lesson_price'] as int,
      minLesson: json['min_lesson'] as int? ?? 5,
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

Map<String, dynamic> _$CoachToJson(Coach instance) => <String, dynamic>{
      'coach_id': instance.coachId,
      'user_id': instance.user,
      'coaching_type_id': instance.coachingType,
      'coaching_experience_id': instance.coachingExperience,
      'per_lesson_price': instance.perLessonPrice,
      'min_lesson': instance.minLesson,
      'created_at': instance.createdAt.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
    };
