// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'training_request_conversation.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblTrainingRequestConversations =
    'tblTrainingRequestConversations';

class TrainingRequestConversationFields {
  static final List<String> values = [
    /// Add all fields here
    trainingRequestConversationId, conversationTypeId,
    trainingRequestResponseId, dateOfParticipation, deactivatedAt, updatedAt,
    isActive,
  ];

  static const String trainingRequestConversationId =
      'training_request_conversation_id';
  static const String conversationTypeId = 'conversation_type_id';
  static const String trainingRequestResponseId =
      'training_request_response_id';
  static const String dateOfParticipation = 'date_of_participation';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

/// This table contains the conversation participants which is approved by activity creator.
///
// @JsonSerializable()
class TrainingRequestConversation extends Equatable {
  final int? trainingRequestConversationId;
  final int conversationTypeId;
  final int trainingRequestResponseId;
  final DateTime dateOfParticipation;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  TrainingRequestConversation({
    this.trainingRequestConversationId,
    required this.conversationTypeId,
    required this.trainingRequestResponseId,
    DateTime? dateOfParticipation,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : dateOfParticipation = dateOfParticipation ?? DateTime.now();

  TrainingRequestConversation copy({
    int? trainingRequestConversationId,
    int? conversationTypeId,
    int? trainingRequestResponseId,
    DateTime? dateOfParticipation,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      TrainingRequestConversation(
        trainingRequestConversationId:
            trainingRequestConversationId ?? this.trainingRequestConversationId,
        conversationTypeId: conversationTypeId ?? this.conversationTypeId,
        trainingRequestResponseId:
            trainingRequestResponseId ?? this.trainingRequestResponseId,
        dateOfParticipation: dateOfParticipation ?? this.dateOfParticipation,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory TrainingRequestConversation.fromJson(Map<String, dynamic> json) =>
      _$TrainingRequestConversationFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingRequestConversationToJson(this);

  @override
  List<Object?> get props => [
        trainingRequestConversationId,
        conversationTypeId,
        trainingRequestResponseId,
        dateOfParticipation,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'TrainingRequestConversation(trainingRequestConversationId: $trainingRequestConversationId, conversationTypeId: $conversationTypeId, trainingRequestResponseId: $trainingRequestResponseId, dateOfParticipation: $dateOfParticipation, deactivatedAt: $deactivatedAt, updatedAt: $updatedAt, isActive: $isActive)';
  }
}
