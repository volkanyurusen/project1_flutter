// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deleted_conversation_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeletedConversationDynamic _$DeletedConversationDynamicFromJson(
        Map<String, dynamic> json) =>
    DeletedConversationDynamic(
      deletedConversationId: json['deleted_conversation_id'] as int?,
      activityConversationDynamic: ActivityConversationDynamic.fromJson(
          json['activity_conversation_id'] as Map<String, dynamic>),
      deletedBy:
          UserDynamic.fromJson(json['deleted_by'] as Map<String, dynamic>),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$DeletedConversationDynamicToJson(
        DeletedConversationDynamic instance) =>
    <String, dynamic>{
      'deleted_conversation_id': instance.deletedConversationId,
      'activity_conversation_id': instance.activityConversationDynamic,
      'deleted_by': instance.deletedBy,
      'deleted_at': instance.deletedAt.toIso8601String(),
    };
