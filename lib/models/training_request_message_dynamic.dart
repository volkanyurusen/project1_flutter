// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'training_request_message_dynamic.g.dart';

const String tblTrainingRequestMessages = 'tblTrainingRequestMessages';

class TrainingRequestMessageDynamicFields {
  static final List<String> values = [
    trainingRequestMessageId,
    trainingRequestConversationId,
    sender,
    messageContent,
    sentAt,
  ];
  static const String trainingRequestMessageId = 'training_request_message_id';
  static const String trainingRequestConversationId =
      'training_request_conversation_id';
  static const String sender = 'sender';
  static const String messageContent = 'message';
  static const String sentAt = 'send_at';
}

@JsonSerializable()
class TrainingRequestMessageDynamic extends Equatable {
  final int? trainingRequestMessageId;
  final TrainingRequestConversationDynamic trainingRequestConversationDynamic;
  final UserDynamic sender;
  final String messageContent;
  final DateTime sentAt;

  TrainingRequestMessageDynamic({
    this.trainingRequestMessageId,
    required this.trainingRequestConversationDynamic,
    required this.sender,
    required this.messageContent,
    DateTime? sentAt,
  }) : sentAt = sentAt ?? DateTime.now();

  TrainingRequestMessageDynamic copy({
    int? trainingRequestMessageId,
    TrainingRequestConversationDynamic? trainingRequestConversationDynamic,
    UserDynamic? sender,
    String? messageContent,
    DateTime? sentAt,
    DateTime? deactivatedAt,
    String? guid,
    bool? isActive,
  }) =>
      TrainingRequestMessageDynamic(
        trainingRequestMessageId:
            trainingRequestMessageId ?? this.trainingRequestMessageId,
        trainingRequestConversationDynamic:
            trainingRequestConversationDynamic ??
                this.trainingRequestConversationDynamic,
        sender: sender ?? this.sender,
        messageContent: messageContent ?? this.messageContent,
        sentAt: sentAt ?? this.sentAt,
      );

  factory TrainingRequestMessageDynamic.fromJson(Map<String, dynamic> json) =>
      _$TrainingRequestMessageDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingRequestMessageDynamicToJson(this);

  @override
  List<Object?> get props => [
        trainingRequestMessageId,
        trainingRequestConversationDynamic,
        sender,
        messageContent,
        sentAt,
      ];

  @override
  String toString() {
    return 'tblTrainingRequestMessages(training_request_message_id: $trainingRequestMessageId, training_request_conversation_id: $trainingRequestConversationDynamic, sender: $sender, message_content: $messageContent, sent_at: $sentAt)';
  }
}
