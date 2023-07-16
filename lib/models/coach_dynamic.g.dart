// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoachDynamic _$CoachDynamicFromJson(Map<String, dynamic> json) => CoachDynamic(
      coachId: json['coach_id'] as int?,
      userDynamic:
          UserDynamic.fromJson(json['user_id'] as Map<String, dynamic>),
      coachingTypeDynamic: CoachingTypeDynamic.fromJson(
          json['coaching_type_id'] as Map<String, dynamic>),
      coachingExperienceDynamic: CoachingExperienceDynamic.fromJson(
          json['coaching_experience_id'] as Map<String, dynamic>),
      perLessonPrice: json['per_lesson_price'] as int,
      minLesson: json['min_lesson'] as int? ?? 5,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$CoachDynamicToJson(CoachDynamic instance) =>
    <String, dynamic>{
      'coach_id': instance.coachId,
      'user_id': instance.userDynamic,
      'coaching_type_id': instance.coachingTypeDynamic,
      'coaching_experience_id': instance.coachingExperienceDynamic,
      'per_lesson_price': instance.perLessonPrice,
      'min_lesson': instance.minLesson,
      'created_at': instance.createdAt.toIso8601String(),
    };
