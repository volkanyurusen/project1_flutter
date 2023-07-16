// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationType _$ConversationTypeFromJson(Map<String, dynamic> json) =>
    ConversationType(
      conversationTypeId: json['conversation_type_id'] as int?,
      conversationTypeName: json['conversation_type_name'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      deactivatedAt: json['deactivated_at'] == null
          ? null
          : DateTime.parse(json['deactivated_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      isActive: json['is_active'] as bool? ?? true,
    );

Map<String, dynamic> _$ConversationTypeToJson(ConversationType instance) =>
    <String, dynamic>{
      'conversation_type_id': instance.conversationTypeId,
      'conversation_type_name': instance.conversationTypeName,
      'created_at': instance.createdAt.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
    };
