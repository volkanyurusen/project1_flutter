// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:my_project/models/models.dart';

part 'training_offer_message.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblTrainingOfferMessages = 'tblTrainingOfferMessages';

class TrainingOfferMessageFields {
  static final List<String> values = [
    /// Add all fields here
    trainingOfferMessageId, trainingOfferConversationId, sender, message,
    sentAt, deactivatedAt, guid, isActive,
  ];

  static const String trainingOfferMessageId = 'training_offer_message_id';
  static const String trainingOfferConversationId =
      'training_offer_conversation_id';
  static const String sender = 'sender';
  static const String message = 'message_content';
  static const String sentAt = 'send_at';
  static const String deactivatedAt = 'deactivatedat';
  static const String guid = 'guid';
  static const String isActive = 'is_active';
}

/// This table contains the messages between creators and.
///
// @JsonSerializable()
class TrainingOfferMessage extends Equatable {
  final int? trainingOfferMessageId;
  final TrainingOfferConversation trainingOfferConversation;
  final User sender;
  final String message;
  final DateTime sentAt;
  final DateTime? deactivatedAt;
  final String guid;
  final bool isActive;

  TrainingOfferMessage({
    this.trainingOfferMessageId,
    required this.trainingOfferConversation,
    required this.sender,
    required this.message,
    DateTime? sentAt,
    this.deactivatedAt,
    required this.guid,
    this.isActive = false,
  }) : sentAt = sentAt ?? DateTime.now();

  TrainingOfferMessage copy({
    int? trainingOfferMessageId,
    TrainingOfferConversation? trainingOfferConversation,
    User? sender,
    String? message,
    DateTime? sentAt,
    DateTime? deactivatedAt,
    String? guid,
    bool? isActive,
  }) =>
      TrainingOfferMessage(
        trainingOfferMessageId:
            trainingOfferMessageId ?? this.trainingOfferMessageId,
        trainingOfferConversation:
            trainingOfferConversation ?? this.trainingOfferConversation,
        sender: sender ?? this.sender,
        message: message ?? this.message,
        sentAt: sentAt ?? this.sentAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        guid: guid ?? this.guid,
        isActive: isActive ?? this.isActive,
      );

  factory TrainingOfferMessage.fromJson(Map<String, dynamic> json) =>
      _$TrainingOfferMessageFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingOfferMessageToJson(this);

  @override
  List<Object?> get props => [
        trainingOfferMessageId,
        trainingOfferConversation,
        sender,
        message,
        sentAt,
        deactivatedAt,
        guid,
        isActive,
      ];

  @override
  String toString() {
    return 'tblTrainingOfferMessages(training_offer_message_id: $trainingOfferMessageId, training_offer_conversation: $trainingOfferConversation, sender: $sender, message_content: $message, sent_at: $sentAt, deactivated_at: $deactivatedAt, guid: $guid, is_active: $isActive)';
  }
}
