// import 'package:equatable/equatable.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'activity_conversation_dynamic.g.dart';

const String tblActivityConversations = 'tblActivityConversations';

class ActivityConversationDynamicFields {
  static final List<String> values = [
    /// Add all fields here
    activityConversationId, conversationTypeId, consistedActivityId,
    dateOfParticipation, deactivatedAt, 
  ];

  static const String activityConversationId = 'activity_conversation_id';
  static const String conversationTypeId = 'conversation_type_id';
  static const String consistedActivityId = 'consisted_activity_id';
  static const String dateOfParticipation = 'date_of_participation';
  static const String deactivatedAt = 'deactivated_at';
}

@JsonSerializable()
class ActivityConversationDynamic extends Equatable {
  final int? activityConversationId;
  final ConversationTypeDynamic conversationTypeDynamic;
  final ConsistedActivityDynamic consistedActivityDynamic;
  final DateTime dateOfParticipation;
  final DateTime? deactivatedAt;

  const ActivityConversationDynamic({
    this.activityConversationId,
    required this.conversationTypeDynamic,
    required this.consistedActivityDynamic,
    required this.dateOfParticipation,
    this.deactivatedAt,
  });

  ActivityConversationDynamic copy({
    int? activityConversationId,
    ConversationTypeDynamic? conversationTypeDynamic,
    ConsistedActivityDynamic? consistedActivityDynamic,
    DateTime? dateOfParticipation,
    DateTime? deactivatedAt,
  }) =>
      ActivityConversationDynamic(
        activityConversationId:
            activityConversationId ?? this.activityConversationId,
        conversationTypeDynamic:
            conversationTypeDynamic ?? this.conversationTypeDynamic,
        consistedActivityDynamic:
            consistedActivityDynamic ?? this.consistedActivityDynamic,
        dateOfParticipation: dateOfParticipation ?? this.dateOfParticipation,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
      );

  factory ActivityConversationDynamic.fromJson(Map<String, dynamic> json) =>
      _$ActivityConversationDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityConversationDynamicToJson(this);

  @override
  List<Object?> get props => [
        activityConversationId,
        conversationTypeDynamic,
        consistedActivityDynamic,
        dateOfParticipation,
        deactivatedAt,
      ];



  @override
  String toString() {
    return 'ActivityConversationDynamic(activityConversationId: $activityConversationId, conversationTypeDynamic: $conversationTypeDynamic, consistedActivityDynamic: $consistedActivityDynamic, dateOfParticipation: $dateOfParticipation, deactivatedAt: $deactivatedAt)';
  }
}
