// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_request_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingRequestMessage _$TrainingRequestMessageFromJson(
        Map<String, dynamic> json) =>
    TrainingRequestMessage(
      trainingRequestMessageId: json['training_request_message_id'] as int?,
      trainingRequestConversation: TrainingRequestConversation.fromJson(
          json['training_request_conversation_id'] as Map<String, dynamic>),
      sender: User.fromJson(json['sender'] as Map<String, dynamic>),
      messageContent: json['message_content'] as String,
      sentAt: json['sent_at'] == null
          ? null
          : DateTime.parse(json['sent_at'] as String),
      deactivatedAt: json['deactivated_at'] == null
          ? null
          : DateTime.parse(json['deactivated_at'] as String),
      guid: json['guid'] as String,
      isActive: json['is_active'] as bool? ?? false,
    );

Map<String, dynamic> _$TrainingRequestMessageToJson(
        TrainingRequestMessage instance) =>
    <String, dynamic>{
      'training_request_message_id': instance.trainingRequestMessageId,
      'training_request_conversation_id': instance.trainingRequestConversation,
      'sender': instance.sender,
      'message_content': instance.messageContent,
      'sent_at': instance.sentAt.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'guid': instance.guid,
      'is_active': instance.isActive,
    };
