// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'training_detail_dynamic.g.dart';

const String tblTrainingDetails = 'tblTrainingDetails';

class TrainingDetailDynamicFields {
  static final List<String> values = [
    trainingDetailId,
    activityNameId,
  ];
  static const String trainingDetailId = 'training_detail_id';
  static const String activityNameId = 'activity_name_id';
}

@JsonSerializable()
class TrainingDetailDynamic extends Equatable {
  final int? trainingDetailId;
  final ActivityNameDynamic activityNameDynamic;

  const TrainingDetailDynamic({
    this.trainingDetailId,
    required this.activityNameDynamic,
  });

  TrainingDetailDynamic copy({
    int? trainingDetailId,
    ActivityNameDynamic? activityNameDynamic,
  }) =>
      TrainingDetailDynamic(
        trainingDetailId: trainingDetailId ?? this.trainingDetailId,
        activityNameDynamic: activityNameDynamic ?? this.activityNameDynamic,
      );

  factory TrainingDetailDynamic.fromJson(Map<String, dynamic> json) =>
      _$TrainingDetailDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingDetailDynamicToJson(this);

  @override
  List<Object?> get props => [
        trainingDetailId,
        activityNameDynamic,
      ];

  @override
  String toString() {
    return 'tblTrainingDetails(training_detail_id: $trainingDetailId, activity_name: $activityNameDynamic)';
  }
}
