// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingDetail _$TrainingDetailFromJson(Map<String, dynamic> json) =>
    TrainingDetail(
      trainingDetailId: json['training_detail_id'] as int?,
      activityName: ActivityName.fromJson(
          json['activity_name_id'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      deactivatedAt: json['deactivated_at'] == null
          ? null
          : DateTime.parse(json['deactivated_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      isActive: json['is_active'] as bool? ?? true,
    );

Map<String, dynamic> _$TrainingDetailToJson(TrainingDetail instance) =>
    <String, dynamic>{
      'training_detail_id': instance.trainingDetailId,
      'activity_name_id': instance.activityName,
      'created_at': instance.createdAt.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
    };
