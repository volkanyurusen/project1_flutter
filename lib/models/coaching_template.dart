// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:my_project/models/models.dart';

part 'coaching_template.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblCoachingTemplates = 'tblCoachingTemplates';

class CoachingTemplateFields {
  static final List<String> values = [
    /// Add all fields here
    coachingTemplateId, userId, trainingDetailId, templateName, createdAt,
    deactivatedAt, updatedAt, isActive,
  ];

  static const String coachingTemplateId = 'coaching_template_id';
  static const String userId = 'user_id';
  static const String trainingDetailId = 'training_detail_id';
  static const String templateName = 'template_name';
  static const String createdAt = 'created_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

/// This table demostrate at how many year a coach has an experience.
///
// @JsonSerializable()
class CoachingTemplate extends Equatable {
  final int? coachingTemplateId;
  final User user;
  final TrainingDetail trainingDetail;
  final String templateName;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  CoachingTemplate({
    this.coachingTemplateId,
    required this.user,
    required this.trainingDetail,
    required this.templateName,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : createdAt = createdAt ?? DateTime.now();

  CoachingTemplate copy({
    int? coachingTemplateId,
    User? user,
    TrainingDetail? trainingDetail,
    String? templateName,
    DateTime? createdAt,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      CoachingTemplate(
        coachingTemplateId: coachingTemplateId ?? this.coachingTemplateId,
        user: user ?? this.user,
        trainingDetail: trainingDetail ?? this.trainingDetail,
        templateName: templateName ?? this.templateName,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory CoachingTemplate.fromJson(Map<String, dynamic> json) =>
      _$CoachingTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$CoachingTemplateToJson(this);

  @override
  List<Object?> get props => [
        coachingTemplateId,
        user,
        trainingDetail,
        templateName,
        createdAt,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblCoachingTemplates(coaching_template_id: $coachingTemplateId, user_id: $user, training_detail_id: $trainingDetail, template_name: $templateName, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}
