// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'location_template.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblLocationTemplates = 'tblLocationTemplates';

class LocationTemplateFields {
  static final List<String> values = [
    /// Add all fields here
    locationTemplateId, userId, locationDetailId, locationTemplateName,
    createdAt, deactivatedAt, updatedAt, isActive,
  ];

  static const String locationTemplateId = 'location_template_id';
  static const String userId = 'user_id';
  static const String locationDetailId = 'location_detail_id';
  static const String locationTemplateName = 'location_template_name';
  static const String createdAt = 'created_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

/// locationTemplate demonstrates user templates that are aimed at being able to be created
/// an activity easily by using this class. This option will only exist for paid users.
///
// @JsonSerializable()
class LocationTemplate extends Equatable {
  final int? locationTemplateId;
  final int userId;
  final int locationDetailId;
  final String locationTemplateName;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  LocationTemplate({
    this.locationTemplateId,
    required this.userId,
    required this.locationDetailId,
    required this.locationTemplateName,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : createdAt = createdAt ?? DateTime.now();

  LocationTemplate copy({
    int? locationTemplateId,
    int? userId,
    int? locationDetailId,
    String? locationTemplateName,
    DateTime? createdAt,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      LocationTemplate(
        locationTemplateId: locationTemplateId ?? this.locationTemplateId,
        userId: userId ?? this.userId,
        locationDetailId: locationDetailId ?? this.locationDetailId,
        locationTemplateName: locationTemplateName ?? this.locationTemplateName,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory LocationTemplate.fromJson(Map<String, dynamic> json) =>
      _$LocationTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$LocationTemplateToJson(this);

  @override
  List<Object?> get props => [
        locationTemplateId,
        userId,
        locationDetailId,
        locationTemplateName,
        createdAt,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblLocationTemplates(location_template_id: $locationTemplateId, user_id: $userId, location_detail_id: $locationDetailId, location_template_name: $locationTemplateName, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}
