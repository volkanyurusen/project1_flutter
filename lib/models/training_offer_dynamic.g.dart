// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_offer_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingOfferDynamic _$TrainingOfferDynamicFromJson(
        Map<String, dynamic> json) =>
    TrainingOfferDynamic(
      trainingOfferId: json['training_offer_id'] as int?,
      coachDynamic:
          CoachDynamic.fromJson(json['coach_id'] as Map<String, dynamic>),
      trainingDetailDynamic: TrainingDetailDynamic.fromJson(
          json['training_detail_id'] as Map<String, dynamic>),
      coachingLocationDetailDynamic: CoachingLocationDetailDynamic.fromJson(
          json['coaching_location_detail_id'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      isActive: json['is_active'] as bool? ?? true,
    );

Map<String, dynamic> _$TrainingOfferDynamicToJson(
        TrainingOfferDynamic instance) =>
    <String, dynamic>{
      'training_offer_id': instance.trainingOfferId,
      'coach_id': instance.coachDynamic,
      'training_detail_id': instance.trainingDetailDynamic,
      'coaching_location_detail_id': instance.coachingLocationDetailDynamic,
      'created_at': instance.createdAt.toIso8601String(),
      'is_active': instance.isActive,
    };
