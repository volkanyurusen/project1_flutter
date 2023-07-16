// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_request_dynamic_with_distance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingRequestDynamicWithDistance _$TrainingRequestDynamicWithDistanceFromJson(
        Map<String, dynamic> json) =>
    TrainingRequestDynamicWithDistance(
      trainingRequestId: json['training_request_id'] as int?,
      trainingRequester: UserDynamic.fromJson(
          json['training_requester_id'] as Map<String, dynamic>),
      trainingDetailDynamic: TrainingDetailDynamic.fromJson(
          json['training_detail_id'] as Map<String, dynamic>),
      locationDetailDynamic: LocationDetailDynamic.fromJson(
          json['location_detail_id'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      distanceBetween: double.parse(json['distance_between']),
    );

Map<String, dynamic> _$TrainingRequestDynamicWithDistanceToJson(
        TrainingRequestDynamicWithDistance instance) =>
    <String, dynamic>{
      'training_request_id': instance.trainingRequestId,
      'training_requester_id': instance.trainingRequester,
      'training_detail_id': instance.trainingDetailDynamic,
      'location_detail_id': instance.locationDetailDynamic,
      'created_at': instance.createdAt.toIso8601String(),
      'distance_between': instance.distanceBetween,
    };
