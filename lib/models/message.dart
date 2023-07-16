// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:my_project/models/models.dart';

part 'message.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblMessages = 'tblMessages';

class MessageFields {
  static final List<String> values = [
    /// Add all fields here
    messageId, activityConversationId, sender, message,
    sentAt, deactivatedAt, guid, isActive,
  ];

  static const String messageId = 'message_id';
  static const String activityConversationId = 'activity_conversation_id';
  static const String sender = 'sender';
  static const String message = 'message_content';
  static const String sentAt = 'send_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String guid = 'guid';
  static const String isActive = 'is_active';
}

/// This table contains the messages between creators and .
///
// @JsonSerializable()
class Message extends Equatable {
  final int? messageId;
  final ActivityConversation activityConversation;
  final User sender;
  final String message;
  final DateTime sentAt;
  final DateTime? deactivatedAt;
  final String guid;
  final bool isActive;

  Message({
    this.messageId,
    required this.activityConversation,
    required this.sender,
    required this.message,
    DateTime? sentAt,
    this.deactivatedAt,
    required this.guid,
    this.isActive = true,
  }) : sentAt = sentAt ?? DateTime.now();

  Message copy({
    int? messageId,
    ActivityConversation? activityConversation,
    User? sender,
    String? message,
    DateTime? sentAt,
    DateTime? deactivatedAt,
    String? guid,
    bool? isActive,
  }) =>
      Message(
        messageId: messageId ?? this.messageId,
        activityConversation: activityConversation ?? this.activityConversation,
        sender: sender ?? this.sender,
        message: message ?? this.message,
        sentAt: sentAt ?? this.sentAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        guid: guid ?? this.guid,
        isActive: isActive ?? this.isActive,
      );

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);

  @override
  List<Object?> get props => [
        messageId,
        activityConversation,
        sender,
        message,
        sentAt,
        deactivatedAt,
        guid,
        isActive,
      ];

  @override
  String toString() {
    return 'tblMessages(message_id: $messageId, activity_conversation: $activityConversation, sender: $sender, message_content: $message, sent_at: $sentAt, deactivated_at: $deactivatedAt, guid: $guid, is_active: $isActive)';
  }
}
