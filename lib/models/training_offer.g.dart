// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingOffer _$TrainingOfferFromJson(Map<String, dynamic> json) =>
    TrainingOffer(
      trainingOfferId: json['training_offer_id'] as int?,
      coachId: json['coach_id'] as int,
      trainingDetailId: json['training_detail_id'] as int,
      coachingLocationDetailId: json['coaching_location_detail_id'] as int,
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

Map<String, dynamic> _$TrainingOfferToJson(TrainingOffer instance) =>
    <String, dynamic>{
      'training_offer_id': instance.trainingOfferId,
      'coach_id': instance.coachId,
      'training_detail_id': instance.trainingDetailId,
      'coaching_location_detail_id': instance.coachingLocationDetailId,
      'created_at': instance.createdAt.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
    };
