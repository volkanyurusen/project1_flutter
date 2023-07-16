// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_offer_dynamic_with_distance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingOfferDynamicWithDistance _$TrainingOfferDynamicWithDistanceFromJson(
        Map<String, dynamic> json) =>
    TrainingOfferDynamicWithDistance(
      trainingOfferId: json['training_offer_id'] as int?,
      coachDynamic:
          CoachDynamic.fromJson(json['coach_id'] as Map<String, dynamic>),
      trainingDetailDynamic: TrainingDetailDynamic.fromJson(
          json['training_detail_id'] as Map<String, dynamic>),
      coachingLocationDetailDynamic: CoachingLocationDetailDynamic.fromJson(
          json['coaching_location_detail_id'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      distanceBetween: double.parse(json['distance_between']),
    );

Map<String, dynamic> _$TrainingOfferDynamicWithDistanceToJson(
        TrainingOfferDynamicWithDistance instance) =>
    <String, dynamic>{
      'training_offer_id': instance.trainingOfferId,
      'coach_id': instance.coachDynamic,
      'training_detail_id': instance.trainingDetailDynamic,
      'coaching_location_detail_id': instance.coachingLocationDetailDynamic,
      'created_at': instance.createdAt.toIso8601String(),
      'distance_between': instance.distanceBetween,
    };
