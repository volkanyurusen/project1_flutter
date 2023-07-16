// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'training_offer_conversation.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblTrainingOfferConversations = 'tblTrainingOfferConversations';

class TrainingOfferConversationFields {
  static final List<String> values = [
    /// Add all fields here
    trainingOfferConversationId, conversationTypeId, trainingOfferResponseId,
    dateOfParticipation, deactivatedAt, updatedAt, isActive,
  ];
  static const String trainingOfferConversationId =
      'training_offer_conversation_id';
  static const String conversationTypeId = 'conversation_type_id';
  static const String trainingOfferResponseId = 'training_offer_response_id';
  static const String dateOfParticipation = 'date_of_participation';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

/// This table contains the conversation participants which is approved by activity creator.
///
// @JsonSerializable()
class TrainingOfferConversation extends Equatable {
  final int? trainingOfferConversationId;
  final int conversationTypeId;
  final int trainingOfferResponseId;
  final DateTime dateOfParticipation;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  TrainingOfferConversation({
    this.trainingOfferConversationId,
    required this.conversationTypeId,
    required this.trainingOfferResponseId,
    DateTime? dateOfParticipation,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : dateOfParticipation = dateOfParticipation ?? DateTime.now();

  TrainingOfferConversation copy({
    int? trainingOfferConversationId,
    int? conversationTypeId,
    int? trainingOfferResponseId,
    DateTime? dateOfParticipation,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      TrainingOfferConversation(
        trainingOfferConversationId:
            trainingOfferConversationId ?? this.trainingOfferConversationId,
        conversationTypeId: conversationTypeId ?? this.conversationTypeId,
        trainingOfferResponseId:
            trainingOfferResponseId ?? this.trainingOfferResponseId,
        dateOfParticipation: dateOfParticipation ?? this.dateOfParticipation,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory TrainingOfferConversation.fromJson(Map<String, dynamic> json) =>
      _$TrainingOfferConversationFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingOfferConversationToJson(this);

  @override
  List<Object?> get props => [
        trainingOfferConversationId,
        conversationTypeId,
        trainingOfferResponseId,
        dateOfParticipation,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'TrainingOfferConversation(trainingOfferConversationId: $trainingOfferConversationId, conversationTypeId: $conversationTypeId, trainingOfferResponseId: $trainingOfferResponseId, dateOfParticipation: $dateOfParticipation, deactivatedAt: $deactivatedAt, updatedAt: $updatedAt, isActive: $isActive)';
  }
}

// TrainingOfferConversation fromMap(Map<String, dynamic> json) =>
//     TrainingOfferConversation(
//       trainingOfferConversationId:
//           json[TrainingOfferConversationFields.trainingOfferConversationId]
//               as int?,
//       conversationTypeId:
//           json[TrainingOfferConversationFields.conversationTypeId] as int,
//       trainingOfferResponseId:
//           json[TrainingOfferConversationFields.trainingOfferResponseId] as int,
//       dateOfParticipation: DateTime.parse(
//           json[TrainingOfferConversationFields.dateOfParticipation] as String),
//       deactivatedAt: DateTime.parse(
//           json[TrainingOfferConversationFields.deactivatedAt] as String),
//       updatedAt: DateTime.parse(
//           json[TrainingOfferConversationFields.updatedAt] as String),
//       isActive: json[TrainingOfferConversationFields.isActive] == 1,
//     );

// Map<String, dynamic> toMap() => {
//       TrainingOfferConversationFields.trainingOfferConversationId:
//           trainingOfferConversationId,
//       TrainingOfferConversationFields.conversationTypeId: conversationTypeId,
//       TrainingOfferConversationFields.trainingOfferResponseId:
//           trainingOfferResponseId,
//       TrainingOfferConversationFields.dateOfParticipation: dateOfParticipation.toIso8601String(),
//       TrainingOfferConversationFields.deactivatedAt:
//           deactivatedAt?.toIso8601String(),
//       TrainingOfferConversationFields.updatedAt: updatedAt?.toIso8601String(),
//       TrainingOfferConversationFields.isActive: isActive ? 1 : 0,
//     };
