// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deleted_training_request_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeletedTrainingRequestMessage _$DeletedTrainingRequestMessageFromJson(
        Map<String, dynamic> json) =>
    DeletedTrainingRequestMessage(
      deletedTrainingRequestMessageId:
          json['deleted_training_request_message_id'] as int?,
      trainingRequestMessage: TrainingRequestMessage.fromJson(
          json['training_request_message_id'] as Map<String, dynamic>),
      deletedBy: User.fromJson(json['deleted_by'] as Map<String, dynamic>),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$DeletedTrainingRequestMessageToJson(
        DeletedTrainingRequestMessage instance) =>
    <String, dynamic>{
      'deleted_training_request_message_id':
          instance.deletedTrainingRequestMessageId,
      'training_request_message_id': instance.trainingRequestMessage,
      'deleted_by': instance.deletedBy,
      'deleted_at': instance.deletedAt.toIso8601String(),
    };
