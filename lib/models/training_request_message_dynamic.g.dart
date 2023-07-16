// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_request_message_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingRequestMessageDynamic _$TrainingRequestMessageDynamicFromJson(
        Map<String, dynamic> json) =>
    TrainingRequestMessageDynamic(
      trainingRequestMessageId: json['training_request_message_id'] as int?,
      trainingRequestConversationDynamic:
          TrainingRequestConversationDynamic.fromJson(
              json['training_request_conversation_id'] as Map<String, dynamic>),
      sender: UserDynamic.fromJson(json['sender'] as Map<String, dynamic>),
      messageContent: json['message_content'] as String,
      sentAt: json['sent_at'] == null
          ? null
          : DateTime.parse(json['sent_at'] as String),
    );

Map<String, dynamic> _$TrainingRequestMessageDynamicToJson(
        TrainingRequestMessageDynamic instance) =>
    <String, dynamic>{
      'training_request_message_id': instance.trainingRequestMessageId,
      'training_request_conversation_id':
          instance.trainingRequestConversationDynamic,
      'sender': instance.sender,
      'message_content': instance.messageContent,
      'sent_at': instance.sentAt.toIso8601String(),
    };
