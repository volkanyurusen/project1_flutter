// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_request_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingRequestDynamic _$TrainingRequestDynamicFromJson(
        Map<String, dynamic> json) =>
    TrainingRequestDynamic(
      trainingRequestId: json['training_request_id'] as int?,
      trainingRequester: UserDynamic.fromJson(
          json['training_requester_id'] as Map<String, dynamic>),
      trainingDetailDynamic: TrainingDetailDynamic.fromJson(
          json['training_detail_id'] as Map<String, dynamic>),
      locationDetailDynamic: LocationDetailDynamic.fromJson(
          json['location_detail_id'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      isActive: json['is_active'] as bool? ?? true,
    );

Map<String, dynamic> _$TrainingRequestDynamicToJson(
        TrainingRequestDynamic instance) =>
    <String, dynamic>{
      'training_request_id': instance.trainingRequestId,
      'training_requester_id': instance.trainingRequester,
      'training_detail_id': instance.trainingDetailDynamic,
      'location_detail_id': instance.locationDetailDynamic,
      'created_at': instance.createdAt.toIso8601String(),
      'is_active': instance.isActive,
    };
