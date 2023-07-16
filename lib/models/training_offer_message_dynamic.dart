// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'training_offer_message_dynamic.g.dart';

const String tblTrainingOfferMessageDynamics =
    'tblTrainingOfferMessageDynamics';

class TrainingOfferMessageDynamicFields {
  static final List<String> values = [
    trainingOfferMessageId,
    trainingOfferConversationId,
    sender,
    messageContent,
    sentAt,
  ];

  static const String trainingOfferMessageId = 'training_offer_message_id';
  static const String trainingOfferConversationId =
      'training_offer_conversation_id';
  static const String sender = 'sender';
  static const String messageContent = 'message_content';
  static const String sentAt = 'send_at';
}

@JsonSerializable()
class TrainingOfferMessageDynamic extends Equatable {
  final int? trainingOfferMessageId;
  final TrainingOfferConversationDynamic trainingOfferConversationDynamic;
  final UserDynamic sender;
  final String messageContent;
  final DateTime sentAt;

  TrainingOfferMessageDynamic({
    this.trainingOfferMessageId,
    required this.trainingOfferConversationDynamic,
    required this.sender,
    required this.messageContent,
    DateTime? sentAt,
  }) : sentAt = sentAt ?? DateTime.now();

  TrainingOfferMessageDynamic copy({
    int? trainingOfferMessageId,
    TrainingOfferConversationDynamic? trainingOfferConversationDynamic,
    UserDynamic? sender,
    String? messageContent,
    DateTime? sentAt,
  }) =>
      TrainingOfferMessageDynamic(
        trainingOfferMessageId:
            trainingOfferMessageId ?? this.trainingOfferMessageId,
        trainingOfferConversationDynamic: trainingOfferConversationDynamic ??
            this.trainingOfferConversationDynamic,
        sender: sender ?? this.sender,
        messageContent: messageContent ?? this.messageContent,
        sentAt: sentAt ?? this.sentAt,
      );

  factory TrainingOfferMessageDynamic.fromJson(Map<String, dynamic> json) =>
      _$TrainingOfferMessageDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingOfferMessageDynamicToJson(this);

  @override
  List<Object?> get props => [
        trainingOfferMessageId,
        trainingOfferConversationDynamic,
        sender,
        messageContent,
        sentAt,
      ];

  @override
  String toString() {
    return 'tblTrainingOfferMessages(training_offer_message_id: $trainingOfferMessageId, training_offer_conversation: $trainingOfferConversationDynamic, sender: $sender, message_content: $messageContent, sent_at: $sentAt';
  }
}
