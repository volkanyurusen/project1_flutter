// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deleted_training_request_conversation_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeletedTrainingRequestConversationDynamic
    _$DeletedTrainingRequestConversationDynamicFromJson(
            Map<String, dynamic> json) =>
        DeletedTrainingRequestConversationDynamic(
          deletedTrainingRequestConversationId:
              json['deleted_training_request_conversation_id'] as int?,
          trainingRequestConversationDynamic:
              TrainingRequestConversationDynamic.fromJson(
                  json['training_request_conversation_id']
                      as Map<String, dynamic>),
          deletedBy:
              UserDynamic.fromJson(json['deleted_by'] as Map<String, dynamic>),
          deletedAt: json['deleted_at'] == null
              ? null
              : DateTime.parse(json['deleted_at'] as String),
        );

Map<String, dynamic> _$DeletedTrainingRequestConversationDynamicToJson(
        DeletedTrainingRequestConversationDynamic instance) =>
    <String, dynamic>{
      'deleted_training_request_conversation_id':
          instance.deletedTrainingRequestConversationId,
      'training_request_conversation_id':
          instance.trainingRequestConversationDynamic,
      'deleted_by': instance.deletedBy,
      'deleted_at': instance.deletedAt.toIso8601String(),
    };
