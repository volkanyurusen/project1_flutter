// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deleted_conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeletedConversation _$DeletedConversationFromJson(Map<String, dynamic> json) =>
    DeletedConversation(
      deletedConversationId: json['deleted_conversation_id'] as int?,
      activityConversation: ActivityConversation.fromJson(
          json['activity_conversation_id'] as Map<String, dynamic>),
      deletedBy: User.fromJson(json['deleted_by'] as Map<String, dynamic>),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$DeletedConversationToJson(
        DeletedConversation instance) =>
    <String, dynamic>{
      'deleted_conversation_id': instance.deletedConversationId,
      'activity_conversation_id': instance.activityConversation,
      'deleted_by': instance.deletedBy,
      'deleted_at': instance.deletedAt.toIso8601String(),
    };
