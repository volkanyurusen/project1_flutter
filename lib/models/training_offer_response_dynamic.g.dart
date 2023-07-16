// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_offer_response_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingOfferResponseDynamic _$TrainingOfferResponseDynamicFromJson(
        Map<String, dynamic> json) =>
    TrainingOfferResponseDynamic(
      trainingOfferResponseId: json['training_offer_response_id'] as int?,
      trainingOfferDynamic: TrainingOfferDynamic.fromJson(
          json['training_offer_id'] as Map<String, dynamic>),
      trainee: UserDynamic.fromJson(json['trainee_id'] as Map<String, dynamic>),
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
    );

Map<String, dynamic> _$TrainingOfferResponseDynamicToJson(
        TrainingOfferResponseDynamic instance) =>
    <String, dynamic>{
      'training_offer_response_id': instance.trainingOfferResponseId,
      'training_offer_id': instance.trainingOfferDynamic,
      'trainee_id': instance.trainee,
      'process_detail_id': instance.processDetailDynamic,
      'request_date': instance.requestDate.toIso8601String(),
      'approved_date': instance.approvedDate?.toIso8601String(),
      'denied_date': instance.deniedDate?.toIso8601String(),
      'recalled_date': instance.recalledDate?.toIso8601String(),
      'updated_date': instance.updatedDate?.toIso8601String(),
      'is_denied': instance.isDenied,
      'is_approved': instance.isApproved,
    };
