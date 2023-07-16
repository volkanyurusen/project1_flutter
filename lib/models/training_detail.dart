// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:my_project/models/models.dart';

part 'training_detail.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblTrainingDetails = 'tblTrainingDetails';

class TrainingDetailFields {
  static final List<String> values = [
    trainingDetailId,
    activityNameId,
    createdAt,
    deactivatedAt,
    updatedAt,
    isActive,
  ];

  static const String trainingDetailId = 'training_detail_id';
  static const String activityNameId = 'activity_name_id';
  static const String createdAt = 'created_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

/// This table contains the coach details. Despite every coach being a user, every user is not a
/// coach.
///
/// prefferedTrainingLevelId = activityLevelId
///
// @JsonSerializable()
class TrainingDetail extends Equatable {
  final int? trainingDetailId;
  final ActivityName activityName;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  TrainingDetail({
    this.trainingDetailId,
    required this.activityName,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : createdAt = createdAt ?? DateTime.now();

  TrainingDetail copy({
    int? trainingDetailId,
    ActivityName? activityName,
    DateTime? createdAt,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      TrainingDetail(
        trainingDetailId: trainingDetailId ?? this.trainingDetailId,
        activityName: activityName ?? this.activityName,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory TrainingDetail.fromJson(Map<String, dynamic> json) =>
      _$TrainingDetailFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingDetailToJson(this);

  @override
  List<Object?> get props => [
        trainingDetailId,
        activityName,
        createdAt,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblTrainingDetails(training_detail_id: $trainingDetailId, activity_name: $activityName, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}

// TrainingDetail fromMap(Map<String, dynamic> json) => TrainingDetail(
//       trainingDetailId: json[TrainingDetailFields.trainingDetailId] as int?,
//       activityNameId: json[TrainingDetailFields.activityNameId] as int,
//       prefferedTrainingLevelId:
//           json[TrainingDetailFields.prefferedTrainingLevelId] as int,
//       coachingExperienceId:
//           json[TrainingDetailFields.coachingExperienceId] as int,
//       perLessonPrice: json[TrainingDetailFields.perLessonPrice] as double,
//       minLesson: json[TrainingDetailFields.minLesson] as int,
//       createdAt: DateTime.parse(json[TrainingDetailFields.createdAt] as String),
//       deactivatedAt:
//           DateTime.parse(json[TrainingDetailFields.deactivatedAt] as String),
//       updatedAt: DateTime.parse(json[TrainingDetailFields.updatedAt] as String),
//       isActive: json[TrainingDetailFields.isActive] == 1,
//     );

// Map<String, dynamic> toMap() => {
//       TrainingDetailFields.trainingDetailId: trainingDetailId,
//       TrainingDetailFields.activityNameId: activityNameId,
//       TrainingDetailFields.prefferedTrainingLevelId: prefferedTrainingLevelId,
//       TrainingDetailFields.coachingExperienceId: coachingExperienceId,
//       TrainingDetailFields.perLessonPrice: perLessonPrice,
//       TrainingDetailFields.minLesson: minLesson,
//       TrainingDetailFields.createdAt: createdAt.toIso8601String(),
//       TrainingDetailFields.deactivatedAt: deactivatedAt?.toIso8601String(),
//       TrainingDetailFields.updatedAt: updatedAt?.toIso8601String(),
//       TrainingDetailFields.isActive: isActive ? 1 : 0,
//     };
