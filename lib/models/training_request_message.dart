// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:my_project/models/models.dart';

part 'training_request_message.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblTrainingRequestMessages = 'tblTrainingRequestMessages';

class TrainingRequestMessageFields {
  static final List<String> values = [
    /// Add all fields here
    trainingRequestMessageId, trainingRequestConversationId, sender,
    messageContent,
    sentAt, deactivatedAt, guid, isActive,
  ];

  static const String trainingRequestMessageId = 'training_request_message_id';
  static const String trainingRequestConversationId =
      'training_request_conversation_id';
  static const String sender = 'sender';
  static const String messageContent = 'message';
  static const String sentAt = 'send_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String guid = 'guid';
  static const String isActive = 'is_active';
}

/// This table contains the messages between creators and .
///
// @JsonSerializable()
class TrainingRequestMessage extends Equatable {
  final int? trainingRequestMessageId;
  final TrainingRequestConversation trainingRequestConversation;
  final User sender;
  final String messageContent;
  final DateTime sentAt;
  final DateTime? deactivatedAt;
  final String guid;
  final bool isActive;

  TrainingRequestMessage({
    this.trainingRequestMessageId,
    required this.trainingRequestConversation,
    required this.sender,
    required this.messageContent,
    DateTime? sentAt,
    this.deactivatedAt,
    required this.guid,
    this.isActive = false,
  }) : sentAt = sentAt ?? DateTime.now();

  TrainingRequestMessage copy({
    int? trainingRequestMessageId,
    TrainingRequestConversation? trainingRequestConversation,
    User? sender,
    String? messageContent,
    DateTime? sentAt,
    DateTime? deactivatedAt,
    String? guid,
    bool? isActive,
  }) =>
      TrainingRequestMessage(
        trainingRequestMessageId:
            trainingRequestMessageId ?? this.trainingRequestMessageId,
        trainingRequestConversation:
            trainingRequestConversation ?? this.trainingRequestConversation,
        sender: sender ?? this.sender,
        messageContent: messageContent ?? this.messageContent,
        sentAt: sentAt ?? this.sentAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        guid: guid ?? this.guid,
        isActive: isActive ?? this.isActive,
      );

  factory TrainingRequestMessage.fromJson(Map<String, dynamic> json) =>
      _$TrainingRequestMessageFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingRequestMessageToJson(this);

  @override
  List<Object?> get props => [
        trainingRequestMessageId,
        trainingRequestConversation,
        sender,
        messageContent,
        sentAt,
        deactivatedAt,
        guid,
        isActive,
      ];

  @override
  String toString() {
    return 'tblTrainingRequestMessages(training_request_message_id: $trainingRequestMessageId, training_request_conversation_id: $trainingRequestConversation, sender: $sender, message_content: $messageContent, sent_at: $sentAt, deactivated_at: $deactivatedAt, guid: $guid, is_active: $isActive)';
  }
}

// TrainingRequestMessage fromMap(Map<String, dynamic> json) =>
//     TrainingRequestMessage(
//       trainingRequestMessageId:
//           json[TrainingRequestMessageFields.trainingRequestMessageId] as int?,
//       trainingRequestConversationId:
//           json[TrainingRequestMessageFields.trainingRequestConversationId]
//               as int,
//       sender: json[TrainingRequestMessageFields.sender] as int,
//       message: json[TrainingRequestMessageFields.message] as String,
//       sentAt:
//           DateTime.parse(json[TrainingRequestMessageFields.sentAt] as String),
//       deactivatedAt: DateTime.parse(
//           json[TrainingRequestMessageFields.deactivatedAt] as String),
//       guid: json[TrainingRequestMessageFields.guid] as String,
//       isActive: json[TrainingRequestMessageFields.isActive] == 1,
//     );

// Map<String, dynamic> toMap() => {
//       TrainingRequestMessageFields.trainingRequestMessageId:
//           trainingRequestMessageId,
//       TrainingRequestMessageFields.trainingRequestConversationId:
//           trainingRequestConversationId,
//       TrainingRequestMessageFields.sender: sender,
//       TrainingRequestMessageFields.message: message,
//       TrainingRequestMessageFields.sentAt: sentAt.toIso8601String(),
//       TrainingRequestMessageFields.deactivatedAt:
//           deactivatedAt?.toIso8601String(),
//       TrainingRequestMessageFields.guid: guid,
//       TrainingRequestMessageFields.isActive: isActive ? 1 : 0,
//     };
