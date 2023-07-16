// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_type_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationTypeDynamic _$ConversationTypeDynamicFromJson(
        Map<String, dynamic> json) =>
    ConversationTypeDynamic(
      conversationTypeId: json['conversation_type_id'] as int?,
      conversationTypeName: json['conversation_type_name'] as String,
    );

Map<String, dynamic> _$ConversationTypeDynamicToJson(
        ConversationTypeDynamic instance) =>
    <String, dynamic>{
      'conversation_type_id': instance.conversationTypeId,
      'conversation_type_name': instance.conversationTypeName,
    };
