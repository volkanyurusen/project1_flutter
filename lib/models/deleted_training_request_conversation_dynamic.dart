// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'deleted_training_request_conversation_dynamic.g.dart';

const String tblDeletedTrainingRequestConversations =
    'tblDeletedTrainingRequestConversations';

class DeletedTrainingRequestConversationDynamicFields {
  static final List<String> values = [
    deletedTrainingRequestConversationId,
    trainingRequestConversationId,
    deletedBy,
    deletedAt,
  ];
  static const String deletedTrainingRequestConversationId =
      'deleted_training_request_conversation_id';
  static const String trainingRequestConversationId =
      'training_request_conversation_id';
  static const String deletedBy = 'deleted_by';
  static const String deletedAt = 'deleted_at';
}

@JsonSerializable()
class DeletedTrainingRequestConversationDynamic extends Equatable {
  final int? deletedTrainingRequestConversationId;
  final TrainingRequestConversationDynamic trainingRequestConversationDynamic;
  final UserDynamic deletedBy;
  final DateTime deletedAt;

  DeletedTrainingRequestConversationDynamic({
    this.deletedTrainingRequestConversationId,
    required this.trainingRequestConversationDynamic,
    required this.deletedBy,
    DateTime? deletedAt,
  }) : deletedAt = deletedAt ?? DateTime.now();

  DeletedTrainingRequestConversationDynamic copy({
    int? deletedTrainingRequestConversationId,
    TrainingRequestConversationDynamic? trainingRequestConversationDynamic,
    UserDynamic? deletedBy,
    DateTime? deletedAt,
  }) =>
      DeletedTrainingRequestConversationDynamic(
        deletedTrainingRequestConversationId:
            deletedTrainingRequestConversationId ??
                this.deletedTrainingRequestConversationId,
        trainingRequestConversationDynamic:
            trainingRequestConversationDynamic ??
                this.trainingRequestConversationDynamic,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory DeletedTrainingRequestConversationDynamic.fromJson(
          Map<String, dynamic> json) =>
      _$DeletedTrainingRequestConversationDynamicFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DeletedTrainingRequestConversationDynamicToJson(this);

  @override
  List<Object?> get props => [
        deletedTrainingRequestConversationId,
        trainingRequestConversationDynamic,
        deletedBy,
        deletedAt,
      ];

  @override
  String toString() {
    return 'tblDeletedTrainingRequestConversations(deleted_training_request_conversation_id: $deletedTrainingRequestConversationId, training_request_conversation_id: $trainingRequestConversationDynamic, deleted_by: $deletedBy, deleted_at: $deletedAt)';
  }
}
