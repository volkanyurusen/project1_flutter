// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:my_project/models/models.dart';

part 'deleted_training_offer_message.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblDeletedTrainingOfferMessages =
    'tblDeletedTrainingOfferMessages';

class DeletedTrainingOfferMessageFields {
  static final List<String> values = [
    /// Add all fields here
    deletedTrainingOfferMessageId, trainingOfferMessageId, deletedBy,
    deletedAt,
  ];

  static const String deletedTrainingOfferMessageId =
      'deleted_training_offer_message_id';
  static const String trainingOfferMessageId = 'training_offer_message_id';
  static const String deletedBy = 'deleted_by';
  static const String deletedAt = 'deleted_at';
}

/// This table contains the deleted messages between creators and .
///
// @JsonSerializable()
class DeletedTrainingOfferMessage extends Equatable {
  final int? deletedTrainingOfferMessageId;
  final TrainingOfferMessage trainingOfferMessage;
  final User deletedBy;
  final DateTime deletedAt;

  DeletedTrainingOfferMessage({
    this.deletedTrainingOfferMessageId,
    required this.trainingOfferMessage,
    required this.deletedBy,
    DateTime? deletedAt,
  }) : deletedAt = deletedAt ?? DateTime.now();

  DeletedTrainingOfferMessage copy({
    int? deletedTrainingOfferMessageId,
    TrainingOfferMessage? trainingOfferMessage,
    User? deletedBy,
    DateTime? deletedAt,
  }) =>
      DeletedTrainingOfferMessage(
        deletedTrainingOfferMessageId:
            deletedTrainingOfferMessageId ?? this.deletedTrainingOfferMessageId,
        trainingOfferMessage: trainingOfferMessage ?? this.trainingOfferMessage,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory DeletedTrainingOfferMessage.fromJson(Map<String, dynamic> json) =>
      _$DeletedTrainingOfferMessageFromJson(json);

  Map<String, dynamic> toJson() => _$DeletedTrainingOfferMessageToJson(this);

  @override
  List<Object?> get props => [
        deletedTrainingOfferMessageId,
        trainingOfferMessage,
        deletedBy,
        deletedAt,
      ];

  @override
  String toString() {
    return 'tblDeletedTrainingOfferMessages(deleted_training_offer_message_id: $deletedTrainingOfferMessageId, training_offer_message_id: $trainingOfferMessage, deleted_by: $deletedBy, deleted_at: $deletedAt)';
  }
}
