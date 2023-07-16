// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:my_project/models/models.dart';

part 'deleted_message.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblDeletedMessages = 'tblDeletedMessages';

class DeletedMessageFields {
  static final List<String> values = [
    /// Add all fields here
    deletedMessageId, messageId, deletedBy, deletedAt,
  ];

  static const String deletedMessageId = 'deleted_message_id';
  static const String messageId = 'message_id';
  static const String deletedBy = 'deleted_by';
  static const String deletedAt = 'deleted_at';
}

/// This table contains the deleted messages between creators and.
///
// @JsonSerializable()
class DeletedMessage extends Equatable {
  final int? deletedMessageId;
  final Message message;
  final User deletedBy;
  final DateTime deletedAt;

  DeletedMessage({
    this.deletedMessageId,
    required this.message,
    required this.deletedBy,
    DateTime? deletedAt,
  }) : deletedAt = deletedAt ?? DateTime.now();

  DeletedMessage copy({
    int? deletedMessageId,
    Message? message,
    User? deletedBy,
    DateTime? deletedAt,
  }) =>
      DeletedMessage(
        deletedMessageId: deletedMessageId ?? this.deletedMessageId,
        message: message ?? this.message,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory DeletedMessage.fromJson(Map<String, dynamic> json) =>
      _$DeletedMessageFromJson(json);

  Map<String, dynamic> toJson() => _$DeletedMessageToJson(this);

  @override
  List<Object?> get props => [
        deletedMessageId,
        message,
        deletedBy,
        deletedAt,
      ];

  @override
  String toString() {
    return 'tblDeletedMessages(deleted_message_id: $deletedMessageId, message_id: $message, deleted_by: $deletedBy, deleted_at: $deletedAt)';
  }
}
