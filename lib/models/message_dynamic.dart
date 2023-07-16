// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'message_dynamic.g.dart';

const String tblMessages = 'tblMessages';

class MessageDynamicFields {
  static final List<String> values = [
    messageId,
    activityConversationId,
    sender,
    message,
    sentAt,
  ];
  static const String messageId = 'message_id';
  static const String activityConversationId = 'activity_conversation_id';
  static const String sender = 'sender';
  static const String message = 'message_content';
  static const String sentAt = 'send_at';
}

@JsonSerializable()
class MessageDynamic extends Equatable {
  final int? messageId;
  final ActivityConversationDynamic activityConversationDynamic;
  final UserDynamic sender;
  final String message;
  final DateTime sentAt;

  MessageDynamic({
    this.messageId,
    required this.activityConversationDynamic,
    required this.sender,
    required this.message,
    DateTime? sentAt,
  }) : sentAt = sentAt ?? DateTime.now();

  MessageDynamic copy({
    int? messageId,
    ActivityConversationDynamic? activityConversationDynamic,
    UserDynamic? sender,
    String? message,
    DateTime? sentAt,
  }) =>
      MessageDynamic(
        messageId: messageId ?? this.messageId,
        activityConversationDynamic:
            activityConversationDynamic ?? this.activityConversationDynamic,
        sender: sender ?? this.sender,
        message: message ?? this.message,
        sentAt: sentAt ?? this.sentAt,
      );

  factory MessageDynamic.fromJson(Map<String, dynamic> json) =>
      _$MessageDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$MessageDynamicToJson(this);

  @override
  List<Object?> get props => [
        messageId,
        activityConversationDynamic,
        sender,
        message,
        sentAt,
      ];

  @override
  String toString() {
    return 'tblMessages(message_id: $messageId, activity_conversation: $activityConversationDynamic, sender: $sender, message_content: $message, sent_at: $sentAt)';
  }
}
