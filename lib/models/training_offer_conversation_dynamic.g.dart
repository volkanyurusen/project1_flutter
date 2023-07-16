// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_offer_conversation_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingOfferConversationDynamic _$TrainingOfferConversationDynamicFromJson(
        Map<String, dynamic> json) =>
    TrainingOfferConversationDynamic(
      trainingOfferConversationId: json['training_offer_conversation_id'] as int?,
      conversationTypeDynamic: ConversationTypeDynamic.fromJson(
          json['conversation_type_id'] as Map<String, dynamic>),
      trainingOfferResponseDynamic: TrainingOfferResponseDynamic.fromJson(
          json['training_offer_response_id'] as Map<String, dynamic>),
      dateOfParticipation: json['date_of_participation'] == null
          ? null
          : DateTime.parse(json['date_of_participation'] as String),
    );

Map<String, dynamic> _$TrainingOfferConversationDynamicToJson(
        TrainingOfferConversationDynamic instance) =>
    <String, dynamic>{
      'training_offer_conversation_id': instance.trainingOfferConversationId,
      'conversation_type_id': instance.conversationTypeDynamic,
      'training_offer_response_id': instance.trainingOfferResponseDynamic,
      'date_of_participation': instance.dateOfParticipation.toIso8601String(),
    };
