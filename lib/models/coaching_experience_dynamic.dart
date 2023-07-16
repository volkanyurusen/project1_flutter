// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coaching_experience_dynamic.g.dart';

const String tblCoachingExperiences = 'tblCoachingExperiences';

class CoachingExperienceDynamicFields {
  static final List<String> values = [
    coachingExperienceId,
    experienceYear,
  ];
  static const String coachingExperienceId = 'coaching_experience_id';
  static const String experienceYear = 'experience_year';
}

@JsonSerializable()
class CoachingExperienceDynamic extends Equatable {
  final int? coachingExperienceId;
  final String experienceYear;

  const CoachingExperienceDynamic({
    this.coachingExperienceId,
    required this.experienceYear,
  });

  CoachingExperienceDynamic copy({
    int? coachingExperienceId,
    String? experienceYear,
  }) =>
      CoachingExperienceDynamic(
        coachingExperienceId: coachingExperienceId ?? this.coachingExperienceId,
        experienceYear: experienceYear ?? this.experienceYear,
      );

  factory CoachingExperienceDynamic.fromJson(Map<String, dynamic> json) =>
      _$CoachingExperienceDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$CoachingExperienceDynamicToJson(this);

  @override
  List<Object?> get props => [
        coachingExperienceId,
        experienceYear,
      ];

  @override
  String toString() {
    return 'tblCoachingExperiences(coaching_experience_id: $coachingExperienceId, experience_year: $experienceYear)';
  }
}
