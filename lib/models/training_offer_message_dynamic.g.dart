// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_offer_message_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingOfferMessageDynamic _$TrainingOfferMessageDynamicFromJson(
        Map<String, dynamic> json) =>
    TrainingOfferMessageDynamic(
      trainingOfferMessageId: json['training_offer_message_id'] as int?,
      trainingOfferConversationDynamic:
          TrainingOfferConversationDynamic.fromJson(
              json['training_offer_conversation_id'] as Map<String, dynamic>),
      sender: UserDynamic.fromJson(json['sender'] as Map<String, dynamic>),
      messageContent: json['message_content'] as String,
      sentAt: json['sent_at'] == null
          ? null
          : DateTime.parse(json['sent_at'] as String),
    );

Map<String, dynamic> _$TrainingOfferMessageDynamicToJson(
        TrainingOfferMessageDynamic instance) =>
    <String, dynamic>{
      'training_offer_message_id': instance.trainingOfferMessageId,
      'training_offer_conversation_id':
          instance.trainingOfferConversationDynamic,
      'sender': instance.sender,
      'message_content': instance.messageContent,
      'sent_at': instance.sentAt.toIso8601String(),
    };
