// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deleted_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeletedMessage _$DeletedMessageFromJson(Map<String, dynamic> json) =>
    DeletedMessage(
      deletedMessageId: json['deleted_message_id'] as int?,
      message: Message.fromJson(json['message_id'] as Map<String, dynamic>),
      deletedBy: User.fromJson(json['deleted_by'] as Map<String, dynamic>),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$DeletedMessageToJson(DeletedMessage instance) =>
    <String, dynamic>{
      'deleted_message_id': instance.deletedMessageId,
      'message_id': instance.message,
      'deleted_by': instance.deletedBy,
      'deleted_at': instance.deletedAt.toIso8601String(),
    };
