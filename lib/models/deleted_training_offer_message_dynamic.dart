// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'deleted_training_offer_message_dynamic.g.dart';

const String tblDeletedTrainingOfferMessages =
    'tblDeletedTrainingOfferMessages';

class DeletedTrainingOfferMessageDynamicFields {
  static final List<String> values = [
    deletedTrainingOfferMessageId,
    trainingOfferMessageId,
    deletedBy,
    deletedAt,
  ];

  static const String deletedTrainingOfferMessageId =
      'deleted_training_offer_message_id';
  static const String trainingOfferMessageId = 'training_offer_message_id';
  static const String deletedBy = 'deleted_by';
  static const String deletedAt = 'deleted_at';
}

@JsonSerializable()
class DeletedTrainingOfferMessageDynamic extends Equatable {
  final int? deletedTrainingOfferMessageId;
  final TrainingOfferMessageDynamic trainingOfferMessageDynamic;
  final UserDynamic deletedBy;
  final DateTime deletedAt;

  DeletedTrainingOfferMessageDynamic({
    this.deletedTrainingOfferMessageId,
    required this.trainingOfferMessageDynamic,
    required this.deletedBy,
    DateTime? deletedAt,
  }) : deletedAt = deletedAt ?? DateTime.now();

  DeletedTrainingOfferMessageDynamic copy({
    int? deletedTrainingOfferMessageId,
    TrainingOfferMessageDynamic? trainingOfferMessageDynamic,
    UserDynamic? deletedBy,
    DateTime? deletedAt,
  }) =>
      DeletedTrainingOfferMessageDynamic(
        deletedTrainingOfferMessageId:
            deletedTrainingOfferMessageId ?? this.deletedTrainingOfferMessageId,
        trainingOfferMessageDynamic:
            trainingOfferMessageDynamic ?? this.trainingOfferMessageDynamic,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory DeletedTrainingOfferMessageDynamic.fromJson(
          Map<String, dynamic> json) =>
      _$DeletedTrainingOfferMessageDynamicFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DeletedTrainingOfferMessageDynamicToJson(this);

  @override
  List<Object?> get props => [
        deletedTrainingOfferMessageId,
        trainingOfferMessageDynamic,
        deletedBy,
        deletedAt,
      ];

  @override
  String toString() {
    return 'tblDeletedTrainingOfferMessages(deleted_training_offer_message_id: $deletedTrainingOfferMessageId, training_offer_message_id: $trainingOfferMessageDynamic, deleted_by: $deletedBy, deleted_at: $deletedAt)';
  }
}
