// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deleted_training_request_conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeletedTrainingRequestConversation _$DeletedTrainingRequestConversationFromJson(
        Map<String, dynamic> json) =>
    DeletedTrainingRequestConversation(
      deletedTrainingRequestConversationId:
          json['deleted_training_request_conversation_id'] as int?,
      trainingRequestConversation: TrainingRequestConversation.fromJson(
          json['training_request_conversation_id'] as Map<String, dynamic>),
      deletedBy: User.fromJson(json['deleted_by'] as Map<String, dynamic>),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$DeletedTrainingRequestConversationToJson(
        DeletedTrainingRequestConversation instance) =>
    <String, dynamic>{
      'deleted_training_request_conversation_id':
          instance.deletedTrainingRequestConversationId,
      'training_request_conversation_id': instance.trainingRequestConversation,
      'deleted_by': instance.deletedBy,
      'deleted_at': instance.deletedAt.toIso8601String(),
    };
