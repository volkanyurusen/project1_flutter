// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_offer_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingOfferMessage _$TrainingOfferMessageFromJson(
        Map<String, dynamic> json) =>
    TrainingOfferMessage(
      trainingOfferMessageId: json['training_offer_message_id'] as int?,
      trainingOfferConversation: TrainingOfferConversation.fromJson(
          json['training_offer_conversation_id'] as Map<String, dynamic>),
      sender: User.fromJson(json['sender'] as Map<String, dynamic>),
      message: json['message_content'] as String,
      sentAt: json['sent_at'] == null
          ? null
          : DateTime.parse(json['sent_at'] as String),
      deactivatedAt: json['deactivated_at'] == null
          ? null
          : DateTime.parse(json['deactivated_at'] as String),
      guid: json['guid'] as String,
      isActive: json['is_active'] as bool? ?? false,
    );

Map<String, dynamic> _$TrainingOfferMessageToJson(
        TrainingOfferMessage instance) =>
    <String, dynamic>{
      'training_offer_message_id': instance.trainingOfferMessageId,
      'training_offer_conversation_id': instance.trainingOfferConversation,
      'sender': instance.sender,
      'message_content': instance.message,
      'sent_at': instance.sentAt.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'guid': instance.guid,
      'is_active': instance.isActive,
    };
