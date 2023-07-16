// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deleted_training_offer_conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeletedTrainingOfferConversation _$DeletedTrainingOfferConversationFromJson(
        Map<String, dynamic> json) =>
    DeletedTrainingOfferConversation(
      deletedTrainingOfferConversationId:
          json['deleted_training_offer_conversation_id'] as int?,
      trainingOfferConversation: TrainingOfferConversation.fromJson(
          json['training_offer_conversation_id'] as Map<String, dynamic>),
      deletedBy: User.fromJson(json['deleted_by'] as Map<String, dynamic>),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$DeletedTrainingOfferConversationToJson(
        DeletedTrainingOfferConversation instance) =>
    <String, dynamic>{
      'deleted_training_offer_conversation_id':
          instance.deletedTrainingOfferConversationId,
      'training_offer_conversation_id': instance.trainingOfferConversation,
      'deleted_by': instance.deletedBy,
      'deleted_at': instance.deletedAt.toIso8601String(),
    };
