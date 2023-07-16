// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_request_conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingRequestConversation _$TrainingRequestConversationFromJson(
        Map<String, dynamic> json) =>
    TrainingRequestConversation(
      trainingRequestConversationId:
          json['training_request_conversation_id'] as int?,
      conversationTypeId: json['conversation_type_id'] as int,
      trainingRequestResponseId: json['training_request_response_id'] as int,
      dateOfParticipation: json['date_of_participation'] == null
          ? null
          : DateTime.parse(json['date_of_participation'] as String),
      deactivatedAt: json['deactivated_at'] == null
          ? null
          : DateTime.parse(json['deactivated_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      isActive: json['is_active'] as bool? ?? true,
    );

Map<String, dynamic> _$TrainingRequestConversationToJson(
        TrainingRequestConversation instance) =>
    <String, dynamic>{
      'training_request_conversation_id':
          instance.trainingRequestConversationId,
      'conversation_type_id': instance.conversationTypeId,
      'training_request_response_id': instance.trainingRequestResponseId,
      'date_of_participation': instance.dateOfParticipation.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
    };
