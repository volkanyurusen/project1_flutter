// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:my_project/models/models.dart';

part 'coaching_location_template.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblCoachingLocationTemplates = 'tblCoachingLocationTemplates';

class CoachingLocationTemplateFields {
  static final List<String> values = [
    /// Add all fields here
    coachingLocationTemplateId, coachId, coachingLocationDetailId,
    coachingLocationTemplateName, createdAt, deactivatedAt, updatedAt, isActive,
  ];

  static const String coachingLocationTemplateId =
      'coaching_location_template_id';
  static const String coachId = 'coach_id';
  static const String coachingLocationDetailId = 'coaching_location_detail_id';
  static const String coachingLocationTemplateName =
      'coaching_location_template_name';
  static const String createdAt = 'created_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

/// coachinglocationTemplate demonstrates user templates that are aimed at being able to be created
/// an activity easily by using this class. This option will only exist for paid users.
///
// @JsonSerializable()
class CoachingLocationTemplate extends Equatable {
  final int? coachingLocationTemplateId;
  final Coach coach;
  final CoachingLocationDetail coachingLocationDetail;
  final String coachingLocationTemplateName;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  CoachingLocationTemplate({
    this.coachingLocationTemplateId,
    required this.coach,
    required this.coachingLocationDetail,
    required this.coachingLocationTemplateName,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : createdAt = createdAt ?? DateTime.now();

  CoachingLocationTemplate copy({
    int? coachingLocationTemplateId,
    Coach? coach,
    CoachingLocationDetail? coachingLocationDetail,
    String? coachingLocationTemplateName,
    DateTime? createdAt,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      CoachingLocationTemplate(
        coachingLocationTemplateId:
            coachingLocationTemplateId ?? this.coachingLocationTemplateId,
        coach: coach ?? this.coach,
        coachingLocationDetail:
            coachingLocationDetail ?? this.coachingLocationDetail,
        coachingLocationTemplateName:
            coachingLocationTemplateName ?? this.coachingLocationTemplateName,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory CoachingLocationTemplate.fromJson(Map<String, dynamic> json) =>
      _$CoachingLocationTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$CoachingLocationTemplateToJson(this);

  @override
  List<Object?> get props => [
        coachingLocationTemplateId,
        coach,
        coachingLocationDetail,
        coachingLocationTemplateName,
        createdAt,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblCoachingLocationTemplates(coaching_location_template_id: $coachingLocationTemplateId, coach_id: $coach, coaching_location_detail_id: $coachingLocationDetail, coaching_location_template_name: $coachingLocationTemplateName, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}
