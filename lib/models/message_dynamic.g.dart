// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageDynamic _$MessageDynamicFromJson(Map<String, dynamic> json) =>
    MessageDynamic(
      messageId: json['message_id'] as int?,
      activityConversationDynamic: ActivityConversationDynamic.fromJson(
          json['activity_conversation_id'] as Map<String, dynamic>),
      sender: UserDynamic.fromJson(json['sender'] as Map<String, dynamic>),
      message: json['message_content'] as String,
      sentAt: json['sent_at'] == null
          ? null
          : DateTime.parse(json['sent_at'] as String),
    );

Map<String, dynamic> _$MessageDynamicToJson(MessageDynamic instance) =>
    <String, dynamic>{
      'message_id': instance.messageId,
      'activity_conversation_id': instance.activityConversationDynamic,
      'sender': instance.sender,
      'message_content': instance.message,
      'sent_at': instance.sentAt.toIso8601String(),
    };
