// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:my_project/models/models.dart';

part 'deleted_training_request_conversation.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblDeletedTrainingRequestConversations =
    'tblDeletedTrainingRequestConversations';

class DeletedTrainingRequestConversationFields {
  static final List<String> values = [
    /// Add all fields here
    deletedTrainingRequestConversationId, trainingRequestConversationId,
    deletedBy, deletedAt,
  ];

  static const String deletedTrainingRequestConversationId =
      'deleted_training_request_conversation_id';
  static const String trainingRequestConversationId =
      'training_request_conversation_id';
  static const String deletedBy = 'deleted_by';
  static const String deletedAt = 'deleted_at';
}

/// This table contains the deleted conversation details.
///
// @JsonSerializable()
class DeletedTrainingRequestConversation extends Equatable {
  final int? deletedTrainingRequestConversationId;
  final TrainingRequestConversation trainingRequestConversation;
  final User deletedBy;
  final DateTime deletedAt;

  DeletedTrainingRequestConversation({
    this.deletedTrainingRequestConversationId,
    required this.trainingRequestConversation,
    required this.deletedBy,
    DateTime? deletedAt,
  }) : deletedAt = deletedAt ?? DateTime.now();

  DeletedTrainingRequestConversation copy({
    int? deletedTrainingRequestConversationId,
    TrainingRequestConversation? trainingRequestConversation,
    User? deletedBy,
    DateTime? deletedAt,
  }) =>
      DeletedTrainingRequestConversation(
        deletedTrainingRequestConversationId:
            deletedTrainingRequestConversationId ??
                this.deletedTrainingRequestConversationId,
        trainingRequestConversation:
            trainingRequestConversation ?? this.trainingRequestConversation,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory DeletedTrainingRequestConversation.fromJson(
          Map<String, dynamic> json) =>
      _$DeletedTrainingRequestConversationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DeletedTrainingRequestConversationToJson(this);

  @override
  List<Object?> get props => [
        deletedTrainingRequestConversationId,
        trainingRequestConversation,
        deletedBy,
        deletedAt,
      ];

  @override
  String toString() {
    return 'tblDeletedTrainingRequestConversations(deleted_training_request_conversation_id: $deletedTrainingRequestConversationId, training_request_conversation_id: $trainingRequestConversation, deleted_by: $deletedBy, deleted_at: $deletedAt)';
  }
}
