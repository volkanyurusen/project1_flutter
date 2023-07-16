// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deleted_training_offer_message_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeletedTrainingOfferMessageDynamic _$DeletedTrainingOfferMessageDynamicFromJson(
        Map<String, dynamic> json) =>
    DeletedTrainingOfferMessageDynamic(
      deletedTrainingOfferMessageId:
          json['deleted_training_offer_message_id'] as int?,
      trainingOfferMessageDynamic: TrainingOfferMessageDynamic.fromJson(
          json['training_offer_message_id'] as Map<String, dynamic>),
      deletedBy:
          UserDynamic.fromJson(json['deleted_by'] as Map<String, dynamic>),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$DeletedTrainingOfferMessageDynamicToJson(
        DeletedTrainingOfferMessageDynamic instance) =>
    <String, dynamic>{
      'deleted_training_offer_message_id':
          instance.deletedTrainingOfferMessageId,
      'training_offer_message_id': instance.trainingOfferMessageDynamic,
      'deleted_by': instance.deletedBy,
      'deleted_at': instance.deletedAt.toIso8601String(),
    };
