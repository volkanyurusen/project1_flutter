// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_offer_response_dynamic_with_distance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingOfferResponseDynamicWithDistance
    _$TrainingOfferResponseDynamicWithDistanceFromJson(
            Map<String, dynamic> json) =>
        TrainingOfferResponseDynamicWithDistance(
          trainingOfferResponseId: json['training_offer_response_id'] as int?,
          trainingOfferDynamic: TrainingOfferDynamic.fromJson(
              json['training_offer_id'] as Map<String, dynamic>),
          traineeDynamic:
              UserDynamic.fromJson(json['trainee_id'] as Map<String, dynamic>),
          processDetailDynamic: ProcessDetailDynamic.fromJson(
              json['process_detail_id'] as Map<String, dynamic>),
          requestDate: json['request_date'] == null
              ? null
              : DateTime.parse(json['request_date'] as String),
          approvedDate: json['approved_date'] == null
              ? null
              : DateTime.parse(json['approved_date'] as String),
          deniedDate: json['denied_date'] == null
              ? null
              : DateTime.parse(json['denied_date'] as String),
          recalledDate: json['recalled_date'] == null
              ? null
              : DateTime.parse(json['recalled_date'] as String),
          updatedDate: json['updated_date'] == null
              ? null
              : DateTime.parse(json['updated_date'] as String),
          isDenied: json['is_denied'] as bool? ?? false,
          isApproved: json['is_approved'] as bool? ?? false,
          distanceBetween: double.parse(json['distance_between']),
        );

Map<String, dynamic> _$TrainingOfferResponseDynamicWithDistanceToJson(
        TrainingOfferResponseDynamicWithDistance instance) =>
    <String, dynamic>{
      'training_offer_response_id': instance.trainingOfferResponseId,
      'training_offer_id': instance.trainingOfferDynamic,
      'trainee_id': instance.traineeDynamic,
      'process_detail_id': instance.processDetailDynamic,
      'request_date': instance.requestDate.toIso8601String(),
      'approved_date': instance.approvedDate?.toIso8601String(),
      'denied_date': instance.deniedDate?.toIso8601String(),
      'recalled_date': instance.recalledDate?.toIso8601String(),
      'updated_date': instance.updatedDate?.toIso8601String(),
      'is_denied': instance.isDenied,
      'is_approved': instance.isApproved,
      'distance_between': instance.distanceBetween,
    };
