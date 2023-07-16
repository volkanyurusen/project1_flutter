// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      messageId: json['message_id'] as int?,
      activityConversation: ActivityConversation.fromJson(
          json['activity_conversation_id'] as Map<String, dynamic>),
      sender: User.fromJson(json['sender'] as Map<String, dynamic>),
      message: json['message_content'] as String,
      sentAt: json['sent_at'] == null
          ? null
          : DateTime.parse(json['sent_at'] as String),
      deactivatedAt: json['deactivated_at'] == null
          ? null
          : DateTime.parse(json['deactivated_at'] as String),
      guid: json['guid'] as String,
      isActive: json['is_active'] as bool? ?? true,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'message_id': instance.messageId,
      'activity_conversation_id': instance.activityConversation,
      'sender': instance.sender,
      'message_content': instance.message,
      'sent_at': instance.sentAt.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'guid': instance.guid,
      'is_active': instance.isActive,
    };
