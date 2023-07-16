// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingRequest _$TrainingRequestFromJson(Map<String, dynamic> json) =>
    TrainingRequest(
      trainingRequestId: json['training_request_id'] as int?,
      trainingRequesterId: json['training_requester_id'] as int,
      trainingDetailId: json['training_detail_id'] as int,
      locationDetailId: json['location_detail_id'] as int,
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

Map<String, dynamic> _$TrainingRequestToJson(TrainingRequest instance) =>
    <String, dynamic>{
      'training_request_id': instance.trainingRequestId,
      'training_requester_id': instance.trainingRequesterId,
      'training_detail_id': instance.trainingDetailId,
      'location_detail_id': instance.locationDetailId,
      'created_at': instance.createdAt.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
    };
