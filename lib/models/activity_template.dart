// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'activity_template.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblActivityTemplates = 'tblactivityTemplates';

class ActivityTemplateFields {
  static final List<String> values = [
    /// Add all fields here
    activityTemplateId, userId, activityNameId, templateName, createdAt,
    deactivatedAt, updatedAt, isActive,
  ];

  static const String activityTemplateId = 'activity_template_id';
  static const String userId = 'user_id';
  static const String activityNameId = 'activity_name_id';
  static const String templateName = 'template_name';
  static const String createdAt = 'created_at';
  static const String deactivatedAt = 'deactivate_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

/// activityTemplate demonstrates user templates that are aimed at being able to
/// be created an activity easily. This option will only exist for paid users.
///
// @JsonSerializable()
class ActivityTemplate extends Equatable {
  final int? activityTemplateId;
  final int userId;
  final int activityNameId;
  final String templateName;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  ActivityTemplate({
    this.activityTemplateId,
    required this.userId,
    required this.activityNameId,
    required this.templateName,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : createdAt = createdAt ?? DateTime.now();

  ActivityTemplate copy({
    int? activityTemplateId,
    int? userId,
    int? activityNameId,
    String? templateName,
    DateTime? createdAt,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      ActivityTemplate(
        activityTemplateId: activityTemplateId ?? this.activityTemplateId,
        userId: userId ?? this.userId,
        activityNameId: activityNameId ?? this.activityNameId,
        templateName: templateName ?? this.templateName,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory ActivityTemplate.fromJson(Map<String, dynamic> json) =>
      _$ActivityTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityTemplateToJson(this);

  @override
  List<Object?> get props => [
        activityTemplateId,
        userId,
        activityNameId,
        templateName,
        createdAt,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblActivityTemplates(activity_template_id: $activityTemplateId, user_id: $userId, activity_name_id: $activityNameId, template_name: $templateName, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}
