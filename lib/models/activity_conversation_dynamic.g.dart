// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_conversation_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityConversationDynamic _$ActivityConversationDynamicFromJson(
        Map<String, dynamic> json) =>
    ActivityConversationDynamic(
      activityConversationId: json['activity_conversation_id'] as int?,
      conversationTypeDynamic: ConversationTypeDynamic.fromJson(
          json['conversation_type_id'] as Map<String, dynamic>),
      consistedActivityDynamic: ConsistedActivityDynamic.fromJson(
          json['consisted_activity_id'] as Map<String, dynamic>),
      dateOfParticipation:
          DateTime.parse(json['date_of_participation'] as String),
      deactivatedAt: json['deactivated_at'] == null
          ? null
          : DateTime.parse(json['deactivated_at'] as String),
    );

Map<String, dynamic> _$ActivityConversationDynamicToJson(
        ActivityConversationDynamic instance) =>
    <String, dynamic>{
      'activity_conversation_id': instance.activityConversationId,
      'conversation_type_id': instance.conversationTypeDynamic,
      'consisted_activity_id': instance.consistedActivityDynamic,
      'date_of_participation': instance.dateOfParticipation.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
    };
