// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'coach_db.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblCoachDBs = 'tblCoachDBs';

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
class CoachDB extends Equatable {
  final int? coachId;
  final int userId;
  final int coachingTypeId;
  final int coachingExperienceId;
  final int perLessonPrice;
  final int minLesson;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  CoachDB({
    this.coachId,
    required this.userId,
    required this.coachingTypeId,
    required this.coachingExperienceId,
    required this.perLessonPrice,
    this.minLesson = 5,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : createdAt = createdAt ?? DateTime.now();

  CoachDB copy({
    int? coachId,
    int? userId,
    int? coachingTypeId,
    int? coachingExperienceId,
    int? perLessonPrice,
    int? minLesson,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deactivatedAt,
    bool? isActive,
  }) =>
      CoachDB(
        coachId: coachId ?? this.coachId,
        userId: userId ?? this.userId,
        coachingTypeId: coachingTypeId ?? this.coachingTypeId,
        coachingExperienceId: coachingExperienceId ?? this.coachingExperienceId,
        perLessonPrice: perLessonPrice ?? this.perLessonPrice,
        minLesson: minLesson ?? this.minLesson,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory CoachDB.fromJson(Map<String, dynamic> json) =>
      _$CoachDBFromJson(json);

  Map<String, dynamic> toJson() => _$CoachDBToJson(this);

  @override
  List<Object?> get props => [
        coachId,
        userId,
        coachingTypeId,
        coachingExperienceId,
        perLessonPrice,
        minLesson,
        createdAt,
        updatedAt,
        deactivatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblCoachDBs(coach_id: $coachId, user_id: $userId, coaching_type_id: $coachingTypeId, coaching_experience_id: $coachingExperienceId, per_lesson_price: $perLessonPrice, min_lesson: $minLesson, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}
