// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_offer_conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingOfferConversation _$TrainingOfferConversationFromJson(
        Map<String, dynamic> json) =>
    TrainingOfferConversation(
      trainingOfferConversationId:
          json['training_offer_conversation_id'] as int?,
      conversationTypeId: json['conversation_type_id'] as int,
      trainingOfferResponseId: json['training_offer_response_id'] as int,
      dateOfParticipation: json['created_at'] == null
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

Map<String, dynamic> _$TrainingOfferConversationToJson(
        TrainingOfferConversation instance) =>
    <String, dynamic>{
      'training_offer_conversation_id': instance.trainingOfferConversationId,
      'conversation_type_id': instance.conversationTypeId,
      'training_offer_response_id': instance.trainingOfferResponseId,
      'created_at': instance.dateOfParticipation.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
    };
