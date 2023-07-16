// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_request_conversation_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingRequestConversationDynamic _$TrainingRequestConversationDynamicFromJson(
        Map<String, dynamic> json) =>
    TrainingRequestConversationDynamic(
      trainingRequestConversationId:
          json['training_request_conversation_id'] as int?,
      conversationTypeDynamic: ConversationTypeDynamic.fromJson(
          json['conversation_type_id'] as Map<String, dynamic>),
      trainingRequestResponseDynamic: TrainingRequestResponseDynamic.fromJson(
          json['training_request_response_id'] as Map<String, dynamic>),
      dateOfParticipation:
          DateTime.parse(json['date_of_participation'] as String),
      deactivatedAt: json['deactivated_at'] == null
          ? null
          : DateTime.parse(json['deactivated_at'] as String),
    );

Map<String, dynamic> _$TrainingRequestConversationDynamicToJson(
        TrainingRequestConversationDynamic instance) =>
    <String, dynamic>{
      'training_request_conversation_id':
          instance.trainingRequestConversationId,
      'conversation_type_id': instance.conversationTypeDynamic,
      'training_request_response_id': instance.trainingRequestResponseDynamic,
      'date_of_participation': instance.dateOfParticipation.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
    };
