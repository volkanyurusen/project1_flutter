// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deleted_message_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeletedMessageDynamic _$DeletedMessageDynamicFromJson(
        Map<String, dynamic> json) =>
    DeletedMessageDynamic(
      deletedMessageId: json['deleted_message_id'] as int?,
      messageDynamic:
          MessageDynamic.fromJson(json['message_id'] as Map<String, dynamic>),
      deletedBy:
          UserDynamic.fromJson(json['deleted_by'] as Map<String, dynamic>),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$DeletedMessageDynamicToJson(
        DeletedMessageDynamic instance) =>
    <String, dynamic>{
      'deleted_message_id': instance.deletedMessageId,
      'message_id': instance.messageDynamic,
      'deleted_by': instance.deletedBy,
      'deleted_at': instance.deletedAt.toIso8601String(),
    };
