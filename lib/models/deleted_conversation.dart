// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:my_project/models/models.dart';

part 'deleted_conversation.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblDeletedConversations = 'tblDeletedConversations';

class DeletedConversationFields {
  static final List<String> values = [
    /// Add all fields here
    deletedConversationId, activityConversationId, deletedBy, deletedAt,
  ];

  static const String deletedConversationId = 'deleted_conversation_id';
  static const String activityConversationId = 'activity_conversation_id';
  static const String deletedBy = 'deleted_by';
  static const String deletedAt = 'deleted_at';
}

/// This table contains the deleted conversation details.
///
// @JsonSerializable()
class DeletedConversation extends Equatable {
  final int? deletedConversationId;
  final ActivityConversation activityConversation;
  final User deletedBy;
  final DateTime deletedAt;

  DeletedConversation({
    this.deletedConversationId,
    required this.activityConversation,
    required this.deletedBy,
    DateTime? deletedAt,
  }) : deletedAt = deletedAt ?? DateTime.now();

  DeletedConversation copy({
    int? deletedConversationId,
    ActivityConversation? activityConversation,
    User? deletedBy,
    DateTime? deletedAt,
  }) =>
      DeletedConversation(
        deletedConversationId:
            deletedConversationId ?? this.deletedConversationId,
        activityConversation: activityConversation ?? this.activityConversation,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory DeletedConversation.fromJson(Map<String, dynamic> json) =>
      _$DeletedConversationFromJson(json);

  Map<String, dynamic> toJson() => _$DeletedConversationToJson(this);

  @override
  List<Object?> get props => [
        deletedConversationId,
        activityConversation,
        deletedBy,
        deletedAt,
      ];

  @override
  String toString() {
    return 'tblDeletedConversations(deleted_conversation_id: $deletedConversationId, activity_conversation_id: $activityConversation, deleted_by: $deletedBy, deleted_at: $deletedAt)';
  }
}
