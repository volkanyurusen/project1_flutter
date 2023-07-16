// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'coach_dynamic.g.dart';

const String tblCoaches = 'tblCoaches';

class CoachDynamicFields {
  static final List<String> values = [
    coachId,
    userId,
    coachingTypeId,
    coachingExperienceId,
    perLessonPrice,
    minLesson,
    createdAt,
  ];
  static const String coachId = 'coach_id';
  static const String userId = 'user_id';
  static const String coachingTypeId = 'coaching_type_id';
  static const String coachingExperienceId = 'coaching_experience_id';
  static const String perLessonPrice = 'per_lesson_price';
  static const String minLesson = 'min_lesson';
  static const String createdAt = 'created_at';
}

@JsonSerializable()
class CoachDynamic extends Equatable {
  final int? coachId;
  final UserDynamic userDynamic;
  final CoachingTypeDynamic coachingTypeDynamic;
  final CoachingExperienceDynamic coachingExperienceDynamic;
  final int perLessonPrice;
  final int minLesson;
  final DateTime createdAt;

  CoachDynamic({
    this.coachId,
    required this.userDynamic,
    required this.coachingTypeDynamic,
    required this.coachingExperienceDynamic,
    required this.perLessonPrice,
    this.minLesson = 5,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  CoachDynamic copy({
    int? coachId,
    UserDynamic? userDynamic,
    CoachingTypeDynamic? coachingTypeDynamic,
    CoachingExperienceDynamic? coachingExperienceDynamic,
    int? perLessonPrice,
    int? minLesson,
    DateTime? createdAt,
  }) =>
      CoachDynamic(
        coachId: coachId ?? this.coachId,
        userDynamic: userDynamic ?? this.userDynamic,
        coachingTypeDynamic: coachingTypeDynamic ?? this.coachingTypeDynamic,
        coachingExperienceDynamic:
            coachingExperienceDynamic ?? this.coachingExperienceDynamic,
        perLessonPrice: perLessonPrice ?? this.perLessonPrice,
        minLesson: minLesson ?? this.minLesson,
        createdAt: createdAt ?? this.createdAt,
      );

  factory CoachDynamic.fromJson(Map<String, dynamic> json) =>
      _$CoachDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$CoachDynamicToJson(this);

  @override
  List<Object?> get props => [
        coachId,
        userDynamic,
        coachingTypeDynamic,
        coachingExperienceDynamic,
        perLessonPrice,
        minLesson,
        createdAt,
      ];

  @override
  String toString() {
    return 'tblCoaches(coach_id: $coachId, user_id: $userDynamic, coaching_type_id: $coachingTypeDynamic, coaching_experience_id: $coachingExperienceDynamic, per_lesson_price: $perLessonPrice, min_lesson: $minLesson, created_at: $createdAt)';
  }
}
