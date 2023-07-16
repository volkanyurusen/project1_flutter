// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'training_request_dynamic.g.dart';

const String tblTrainingRequestDyanmics = 'tblTrainingRequestDynamics';

class TrainingRequestDynamicFields {
  static final List<String> values = [
    trainingRequestId,
    trainingRequesterId,
    trainingDetailId,
    locationDetailId,
    createdAt,
    isActive,
  ];
  static const String trainingRequestId = 'training_request_id';
  static const String trainingRequesterId = 'training_requester_id';
  static const String trainingDetailId = 'training_detail_id';
  static const String locationDetailId = 'location_detail_id';
  static const String createdAt = 'created_at';
  static const String isActive = 'is_active';
}

@JsonSerializable()
class TrainingRequestDynamic extends Equatable {
  final int? trainingRequestId;
  final UserDynamic trainingRequester;
  final TrainingDetailDynamic trainingDetailDynamic;
  final LocationDetailDynamic locationDetailDynamic;
  final DateTime createdAt;
  final bool isActive;

  TrainingRequestDynamic({
    this.trainingRequestId,
    required this.trainingRequester,
    required this.trainingDetailDynamic,
    required this.locationDetailDynamic,
    required this.createdAt,
    this.isActive = true,
  });

  TrainingRequestDynamic copy({
    int? trainingRequestId,
    UserDynamic? trainingRequester,
    TrainingDetailDynamic? trainingDetailDynamic,
    LocationDetailDynamic? locationDetailDynamic,
    DateTime? createdAt,
    bool? isActive,
  }) =>
      TrainingRequestDynamic(
        trainingRequestId: trainingRequestId ?? this.trainingRequestId,
        trainingRequester: trainingRequester ?? this.trainingRequester,
        trainingDetailDynamic:
            trainingDetailDynamic ?? this.trainingDetailDynamic,
        locationDetailDynamic:
            locationDetailDynamic ?? this.locationDetailDynamic,
        createdAt: createdAt ?? this.createdAt,
        isActive: isActive ?? this.isActive,
      );

  factory TrainingRequestDynamic.fromJson(Map<String, dynamic> json) =>
      _$TrainingRequestDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingRequestDynamicToJson(this);

  @override
  List<Object?> get props => [
        trainingRequestId,
        trainingRequester,
        trainingDetailDynamic,
        locationDetailDynamic,
        createdAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblTrainingRequests(training_request_id: $trainingRequestId, training_requester_id: $trainingRequester, training_detail_id: $trainingDetailDynamic, location_detail_id: $locationDetailDynamic, created_at: $createdAt, is_active: $isActive)';
  }
}
