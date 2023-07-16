// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'deleted_training_offer_conversation_dynamic.g.dart';

const String tblDeletedTrainingOfferConversations =
    'tblDeletedTrainingOfferConversations';

class DeletedTrainingOfferConversationDynamicFields {
  static final List<String> values = [
    deletedTrainingOfferConversationId,
    trainingOfferConversationId,
    deletedBy,
    deletedAt,
  ];
  static const String deletedTrainingOfferConversationId =
      'deleted_training_offer_conversation_id';
  static const String trainingOfferConversationId =
      'training_offer_conversation_id';
  static const String deletedBy = 'deleted_by';
  static const String deletedAt = 'deleted_at';
}

@JsonSerializable()
class DeletedTrainingOfferConversationDynamic extends Equatable {
  final int? deletedTrainingOfferConversationId;
  final TrainingOfferConversationDynamic trainingOfferConversationDynamic;
  final UserDynamic deletedBy;
  final DateTime deletedAt;

  DeletedTrainingOfferConversationDynamic({
    this.deletedTrainingOfferConversationId,
    required this.trainingOfferConversationDynamic,
    required this.deletedBy,
    DateTime? deletedAt,
  }) : deletedAt = deletedAt ?? DateTime.now();

  DeletedTrainingOfferConversationDynamic copy({
    int? deletedTrainingOfferConversationId,
    TrainingOfferConversationDynamic? trainingOfferConversationDynamic,
    UserDynamic? deletedBy,
    DateTime? deletedAt,
  }) =>
      DeletedTrainingOfferConversationDynamic(
        deletedTrainingOfferConversationId:
            deletedTrainingOfferConversationId ??
                this.deletedTrainingOfferConversationId,
        trainingOfferConversationDynamic: trainingOfferConversationDynamic ??
            this.trainingOfferConversationDynamic,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory DeletedTrainingOfferConversationDynamic.fromJson(
          Map<String, dynamic> json) =>
      _$DeletedTrainingOfferConversationDynamicFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DeletedTrainingOfferConversationDynamicToJson(this);

  @override
  List<Object?> get props => [
        deletedTrainingOfferConversationId,
        trainingOfferConversationDynamic,
        deletedBy,
        deletedAt,
      ];

  @override
  String toString() {
    return 'tblDeletedTrainingOfferConversations(deleted_training_offer_conversation_id: $deletedTrainingOfferConversationId, training_offer_conversation_id: $trainingOfferConversationDynamic, deleted_by: $deletedBy, deleted_at: $deletedAt)';
  }
}
