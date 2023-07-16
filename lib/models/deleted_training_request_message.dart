// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:my_project/models/models.dart';

part 'deleted_training_request_message.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblDeletedTrainingRequestMessages =
    'tblDeletedTrainingRequestMessages';

class DeletedTrainingRequestMessageFields {
  static final List<String> values = [
    /// Add all fields here
    deletedTrainingRequestMessageId, trainingRequestMessageId, deletedBy,
    deletedAt,
  ];

  static const String deletedTrainingRequestMessageId =
      'deleted_training_request_message_id';
  static const String trainingRequestMessageId = 'training_request_message_id';
  static const String deletedBy = 'deleted_by';
  static const String deletedAt = 'deleted_at';
}

/// This table contains the deleted messages between creators and .
///
// @JsonSerializable()
class DeletedTrainingRequestMessage extends Equatable {
  final int? deletedTrainingRequestMessageId;
  final TrainingRequestMessage trainingRequestMessage;
  final User deletedBy;
  final DateTime deletedAt;

  DeletedTrainingRequestMessage({
    this.deletedTrainingRequestMessageId,
    required this.trainingRequestMessage,
    required this.deletedBy,
    DateTime? deletedAt,
  }) : deletedAt = deletedAt ?? DateTime.now();

  DeletedTrainingRequestMessage copy({
    int? deletedTrainingRequestMessageId,
    TrainingRequestMessage? trainingRequestMessage,
    User? deletedBy,
    DateTime? deletedAt,
  }) =>
      DeletedTrainingRequestMessage(
        deletedTrainingRequestMessageId: deletedTrainingRequestMessageId ??
            this.deletedTrainingRequestMessageId,
        trainingRequestMessage:
            trainingRequestMessage ?? this.trainingRequestMessage,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory DeletedTrainingRequestMessage.fromJson(Map<String, dynamic> json) =>
      _$DeletedTrainingRequestMessageFromJson(json);

  Map<String, dynamic> toJson() => _$DeletedTrainingRequestMessageToJson(this);

  @override
  List<Object?> get props => [
        deletedTrainingRequestMessageId,
        trainingRequestMessage,
        deletedBy,
        deletedAt,
      ];

  @override
  String toString() {
    return 'tblDeletedTrainingRequestMessages(deleted_training_request_message_id: $deletedTrainingRequestMessageId, training_request_message_id: $trainingRequestMessage, deleted_by: $deletedBy, deleted_at: $deletedAt)';
  }
}
