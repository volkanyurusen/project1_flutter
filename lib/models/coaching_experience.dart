// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'coaching_experience.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblCoachingExperiences = 'tblCoachingExperiences';

class CoachingExperienceFields {
  static final List<String> values = [
    /// Add all fields here
    coachingExperienceId, experienceYear, createdAt,
    deactivatedAt, updatedAt, isActive,
  ];

  static const String coachingExperienceId = 'coaching_experience_id';
  static const String experienceYear = 'experience_year';
  static const String createdAt = 'created_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

/// This table demostrate at how many year a coach has an experience.
///
/// less than 1 year
/// between 1-2 years
/// between 2-3 years
/// betweem 3-5 years
/// between 5-8 years
/// between 8-12 years
/// more than 12 years
///
// @JsonSerializable()
class CoachingExperience extends Equatable {
  final int? coachingExperienceId;
  final String experienceYear;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  CoachingExperience({
    this.coachingExperienceId,
    required this.experienceYear,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : createdAt = createdAt ?? DateTime.now();

  CoachingExperience copy({
    int? coachingExperienceId,
    String? experienceYear,
    DateTime? createdAt,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      CoachingExperience(
        coachingExperienceId: coachingExperienceId ?? this.coachingExperienceId,
        experienceYear: experienceYear ?? this.experienceYear,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory CoachingExperience.fromJson(Map<String, dynamic> json) =>
      _$CoachingExperienceFromJson(json);

  Map<String, dynamic> toJson() => _$CoachingExperienceToJson(this);

  @override
  List<Object?> get props => [
        coachingExperienceId,
        experienceYear,
        createdAt,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblCoachingExperiences(coaching_experience_id: $coachingExperienceId, experience_year: $experienceYear, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}
