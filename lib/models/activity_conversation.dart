// import 'package:equatable/equatable.dart';
import 'package:equatable/equatable.dart';

part 'activity_conversation.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblActivityConversations =
    'tblActivityConversations'; // Everything the same in DjangoAPI

class ActivityConversationFields {
  static final List<String> values = [
    /// Add all fields here
    activityConversationId, conversationTypeId, consistedActivityId,
    dateOfParticipation, deactivatedAt, updatedAt, isActive
  ];

  static const String activityConversationId = 'activity_conversation_id';
  static const String conversationTypeId = 'conversation_type_id';
  static const String consistedActivityId = 'consisted_activity_id';
  static const String dateOfParticipation = 'date_of_participation';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

/// This table contains the conversation participants which is approved by activity creator.
///
// @JsonSerializable()
class ActivityConversation extends Equatable {
  final int? activityConversationId;
  final int conversationTypeId;
  final int consistedActivityId;
  final DateTime dateOfParticipation;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  ActivityConversation({
    this.activityConversationId,
    required this.conversationTypeId,
    required this.consistedActivityId,
    DateTime? dateOfParticipation,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : dateOfParticipation = dateOfParticipation ?? DateTime.now();

  ActivityConversation copy({
    int? activityConversationId,
    int? conversationTypeId,
    int? consistedActivityId,
    DateTime? dateOfParticipation,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      ActivityConversation(
        activityConversationId:
            activityConversationId ?? this.activityConversationId,
        conversationTypeId: conversationTypeId ?? this.conversationTypeId,
        consistedActivityId: consistedActivityId ?? this.consistedActivityId,
        dateOfParticipation: dateOfParticipation ?? this.dateOfParticipation,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory ActivityConversation.fromJson(Map<String, dynamic> json) =>
      _$ActivityConversationFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityConversationToJson(this);

  @override
  List<Object?> get props => [
        activityConversationId,
        conversationTypeId,
        consistedActivityId,
        dateOfParticipation,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblActivityConversations(activity_conversation_id: $activityConversationId, conversation_type_id: $conversationTypeId, consisted_activity_id: $consistedActivityId, date_of_participation: $dateOfParticipation, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}
