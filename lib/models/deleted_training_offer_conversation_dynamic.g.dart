// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deleted_training_offer_conversation_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeletedTrainingOfferConversationDynamic
    _$DeletedTrainingOfferConversationDynamicFromJson(
            Map<String, dynamic> json) =>
        DeletedTrainingOfferConversationDynamic(
          deletedTrainingOfferConversationId:
              json['deleted_training_offer_conversation_id'] as int?,
          trainingOfferConversationDynamic:
              TrainingOfferConversationDynamic.fromJson(
                  json['training_offer_conversation_id']
                      as Map<String, dynamic>),
          deletedBy:
              UserDynamic.fromJson(json['deleted_by'] as Map<String, dynamic>),
          deletedAt: json['deleted_at'] == null
              ? null
              : DateTime.parse(json['deleted_at'] as String),
        );

Map<String, dynamic> _$DeletedTrainingOfferConversationDynamicToJson(
        DeletedTrainingOfferConversationDynamic instance) =>
    <String, dynamic>{
      'deleted_training_offer_conversation_id':
          instance.deletedTrainingOfferConversationId,
      'training_offer_conversation_id':
          instance.trainingOfferConversationDynamic,
      'deleted_by': instance.deletedBy,
      'deleted_at': instance.deletedAt.toIso8601String(),
    };
