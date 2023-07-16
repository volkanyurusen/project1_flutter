// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:my_project/models/models.dart';

part 'deleted_training_offer_conversation.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblDeletedTrainingOfferConversations =
    'tblDeletedTrainingOfferConversations';

class DeletedTrainingOfferConversationFields {
  static final List<String> values = [
    /// Add all fields here
    deletedTrainingOfferConversationId, trainingOfferConversationId, deletedBy,
    deletedAt,
  ];

  static const String deletedTrainingOfferConversationId =
      'deleted_training_offer_conversation_id';
  static const String trainingOfferConversationId =
      'training_offer_conversation_id';
  static const String deletedBy = 'deleted_by';
  static const String deletedAt = 'deleted_at';
}

/// This table contains the deleted conversation details.
///
// @JsonSerializable()
class DeletedTrainingOfferConversation extends Equatable {
  final int? deletedTrainingOfferConversationId;
  final TrainingOfferConversation trainingOfferConversation;
  final User deletedBy;
  final DateTime deletedAt;

  DeletedTrainingOfferConversation({
    this.deletedTrainingOfferConversationId,
    required this.trainingOfferConversation,
    required this.deletedBy,
    DateTime? deletedAt,
  }) : deletedAt = deletedAt ?? DateTime.now();

  DeletedTrainingOfferConversation copy({
    int? deletedTrainingOfferConversationId,
    TrainingOfferConversation? trainingOfferConversation,
    User? deletedBy,
    DateTime? deletedAt,
  }) =>
      DeletedTrainingOfferConversation(
        deletedTrainingOfferConversationId:
            deletedTrainingOfferConversationId ??
                this.deletedTrainingOfferConversationId,
        trainingOfferConversation:
            trainingOfferConversation ?? this.trainingOfferConversation,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory DeletedTrainingOfferConversation.fromJson(
          Map<String, dynamic> json) =>
      _$DeletedTrainingOfferConversationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DeletedTrainingOfferConversationToJson(this);

  @override
  List<Object?> get props => [
        deletedTrainingOfferConversationId,
        trainingOfferConversation,
        deletedBy,
        deletedAt,
      ];

  @override
  String toString() {
    return 'tblDeletedTrainingOfferConversations(deleted_training_offer_conversation_id: $deletedTrainingOfferConversationId, training_offer_conversation_id: $trainingOfferConversation, deleted_by: $deletedBy, deleted_at: $deletedAt)';
  }
}
