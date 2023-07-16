// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'deleted_training_request_message_dynamic.g.dart';

const String tblDeletedTrainingRequestMessages =
    'tblDeletedTrainingRequestMessages';

class DeletedTrainingRequestMessageDynamicFields {
  static final List<String> values = [
    deletedTrainingRequestMessageId,
    trainingRequestMessageId,
    deletedBy,
    deletedAt,
  ];
  static const String deletedTrainingRequestMessageId =
      'deleted_training_request_message_id';
  static const String trainingRequestMessageId = 'training_request_message_id';
  static const String deletedBy = 'deleted_by';
  static const String deletedAt = 'deleted_at';
}

@JsonSerializable()
class DeletedTrainingRequestMessageDynamic extends Equatable {
  final int? deletedTrainingRequestMessageId;
  final TrainingRequestMessageDynamic trainingRequestMessageDynamic;
  final UserDynamic deletedBy;
  final DateTime deletedAt;

  DeletedTrainingRequestMessageDynamic({
    this.deletedTrainingRequestMessageId,
    required this.trainingRequestMessageDynamic,
    required this.deletedBy,
    DateTime? deletedAt,
  }) : deletedAt = deletedAt ?? DateTime.now();

  DeletedTrainingRequestMessageDynamic copy({
    int? deletedTrainingRequestMessageId,
    TrainingRequestMessageDynamic? trainingRequestMessageDynamic,
    UserDynamic? deletedBy,
    DateTime? deletedAt,
  }) =>
      DeletedTrainingRequestMessageDynamic(
        deletedTrainingRequestMessageId: deletedTrainingRequestMessageId ??
            this.deletedTrainingRequestMessageId,
        trainingRequestMessageDynamic:
            trainingRequestMessageDynamic ?? this.trainingRequestMessageDynamic,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory DeletedTrainingRequestMessageDynamic.fromJson(
          Map<String, dynamic> json) =>
      _$DeletedTrainingRequestMessageDynamicFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DeletedTrainingRequestMessageDynamicToJson(this);

  @override
  List<Object?> get props => [
        deletedTrainingRequestMessageId,
        trainingRequestMessageDynamic,
        deletedBy,
        deletedAt,
      ];

  @override
  String toString() {
    return 'tblDeletedTrainingRequestMessages(deleted_training_request_message_id: $deletedTrainingRequestMessageId, training_request_message_id: $trainingRequestMessageDynamic, deleted_by: $deletedBy, deleted_at: $deletedAt)';
  }
}
