// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'deleted_conversation_dynamic.g.dart';

const String tblDeletedConversations = 'tblDeletedConversations';

class DeletedConversationDynamicFields {
  static final List<String> values = [
    deletedConversationId,
    activityConversationId,
    deletedBy,
    deletedAt,
  ];

  static const String deletedConversationId = 'deleted_conversation_id';
  static const String activityConversationId = 'activity_conversation_id';
  static const String deletedBy = 'deleted_by';
  static const String deletedAt = 'deleted_at';
}

@JsonSerializable()
class DeletedConversationDynamic extends Equatable {
  final int? deletedConversationId;
  final ActivityConversationDynamic activityConversationDynamic;
  final UserDynamic deletedBy;
  final DateTime deletedAt;

  DeletedConversationDynamic({
    this.deletedConversationId,
    required this.activityConversationDynamic,
    required this.deletedBy,
    DateTime? deletedAt,
  }) : deletedAt = deletedAt ?? DateTime.now();

  DeletedConversationDynamic copy({
    int? deletedConversationId,
    ActivityConversationDynamic? activityConversationDynamic,
    UserDynamic? deletedBy,
    DateTime? deletedAt,
  }) =>
      DeletedConversationDynamic(
        deletedConversationId:
            deletedConversationId ?? this.deletedConversationId,
        activityConversationDynamic:
            activityConversationDynamic ?? this.activityConversationDynamic,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory DeletedConversationDynamic.fromJson(Map<String, dynamic> json) =>
      _$DeletedConversationDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$DeletedConversationDynamicToJson(this);

  @override
  List<Object?> get props => [
        deletedConversationId,
        activityConversationDynamic,
        deletedBy,
        deletedAt,
      ];

  @override
  String toString() {
    return 'tblDeletedConversations(deleted_conversation_id: $deletedConversationId, activity_conversation_id: $activityConversationDynamic, deleted_by: $deletedBy, deleted_at: $deletedAt)';
  }
}
