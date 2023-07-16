// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:my_project/models/models.dart';

part 'coach.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblCoaches = 'tblCoaches';

class CoachFields {
  static final List<String> values = [
    coachId,
    userId,
    coachingTypeId,
    coachingExperienceId,
    perLessonPrice,
    minLesson,
    createdAt,
    deactivatedAt,
    updatedAt,
    isActive,
  ];

  static const String coachId = 'coach_id';
  static const String userId = 'user_id';
  static const String coachingTypeId = 'coaching_type_id';
  static const String coachingExperienceId = 'coaching_experience_id';
  static const String perLessonPrice = 'per_lesson_price';
  static const String minLesson = 'min_lesson';
  static const String createdAt = 'created_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

///  Coach -second variable- demonstrates userId of coach.
///
// @JsonSerializable()
class Coach extends Equatable {
  final int? coachId;
  final User user;
  final CoachingType coachingType;
  final CoachingExperience coachingExperience;
  final int perLessonPrice;
  final int minLesson;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  Coach({
    this.coachId,
    required this.user,
    required this.coachingType,
    required this.coachingExperience,
    required this.perLessonPrice,
    this.minLesson = 5,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : createdAt = createdAt ?? DateTime.now();

  Coach copy({
    int? coachId,
    User? user,
    CoachingType? coachingType,
    CoachingExperience? coachingExperience,
    int? perLessonPrice,
    int? minLesson,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deactivatedAt,
    bool? isActive,
  }) =>
      Coach(
        coachId: coachId ?? this.coachId,
        user: user ?? this.user,
        coachingType: coachingType ?? this.coachingType,
        coachingExperience: coachingExperience ?? this.coachingExperience,
        perLessonPrice: perLessonPrice ?? this.perLessonPrice,
        minLesson: minLesson ?? this.minLesson,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory Coach.fromJson(Map<String, dynamic> json) => _$CoachFromJson(json);

  Map<String, dynamic> toJson() => _$CoachToJson(this);

  @override
  List<Object?> get props => [
        coachId,
        user,
        coachingType,
        coachingExperience,
        perLessonPrice,
        minLesson,
        createdAt,
        updatedAt,
        deactivatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblCoaches(coach_id: $coachId, user_id: $user, coaching_type_id: $coachingType, coaching_experience_id: $coachingExperience, per_lesson_price: $perLessonPrice, min_lesson: $minLesson, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}
