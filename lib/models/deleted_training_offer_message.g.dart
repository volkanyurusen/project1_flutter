// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deleted_training_offer_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeletedTrainingOfferMessage _$DeletedTrainingOfferMessageFromJson(
        Map<String, dynamic> json) =>
    DeletedTrainingOfferMessage(
      deletedTrainingOfferMessageId:
          json['deleted_training_offer_message_id'] as int?,
      trainingOfferMessage: TrainingOfferMessage.fromJson(
          json['training_offer_message_id'] as Map<String, dynamic>),
      deletedBy: User.fromJson(json['deleted_by'] as Map<String, dynamic>),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$DeletedTrainingOfferMessageToJson(
        DeletedTrainingOfferMessage instance) =>
    <String, dynamic>{
      'deleted_training_offer_message_id':
          instance.deletedTrainingOfferMessageId,
      'training_offer_message_id': instance.trainingOfferMessage,
      'deleted_by': instance.deletedBy,
      'deleted_at': instance.deletedAt.toIso8601String(),
    };
