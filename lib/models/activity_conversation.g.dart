// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityConversation _$ActivityConversationFromJson(
        Map<String, dynamic> json) =>
    ActivityConversation(
      activityConversationId: json['activity_conversation_id'] as int?,
      conversationTypeId: json['conversation_type_id'] as int,
      consistedActivityId: json['consisted_activity_id'] as int,
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

Map<String, dynamic> _$ActivityConversationToJson(
        ActivityConversation instance) =>
    <String, dynamic>{
      'activity_conversation_id': instance.activityConversationId,
      'conversation_type_id': instance.conversationTypeId,
      'consisted_activity_id': instance.consistedActivityId,
      'date_of_participation': instance.dateOfParticipation.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
    };
