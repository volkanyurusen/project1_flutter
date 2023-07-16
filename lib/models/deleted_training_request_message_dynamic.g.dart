// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deleted_training_request_message_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeletedTrainingRequestMessageDynamic
    _$DeletedTrainingRequestMessageDynamicFromJson(Map<String, dynamic> json) =>
        DeletedTrainingRequestMessageDynamic(
          deletedTrainingRequestMessageId:
              json['deleted_training_request_message_id'] as int?,
          trainingRequestMessageDynamic: TrainingRequestMessageDynamic.fromJson(
              json['training_request_message_id'] as Map<String, dynamic>),
          deletedBy:
              UserDynamic.fromJson(json['deleted_by'] as Map<String, dynamic>),
          deletedAt: json['deleted_at'] == null
              ? null
              : DateTime.parse(json['deleted_at'] as String),
        );

Map<String, dynamic> _$DeletedTrainingRequestMessageDynamicToJson(
        DeletedTrainingRequestMessageDynamic instance) =>
    <String, dynamic>{
      'deleted_training_request_message_id':
          instance.deletedTrainingRequestMessageId,
      'training_request_message_id': instance.trainingRequestMessageDynamic,
      'deleted_by': instance.deletedBy,
      'deleted_at': instance.deletedAt.toIso8601String(),
    };
