// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'training_request_dynamic_with_distance.g.dart';

const String tblTrainingRequestDynamicWithDistances =
    'tblTrainingRequestDynamicWithDistances';

class TrainingRequestDynamicWithDistanceFields {
  static final List<String> values = [
    trainingRequestId,
    trainingRequesterId,
    trainingDetailId,
    locationDetailId,
    createdAt,
    distanceBetween,
  ];
  static const String trainingRequestId = 'training_request_id';
  static const String trainingRequesterId = 'training_requester_id';
  static const String trainingDetailId = 'training_detail_id';
  static const String locationDetailId = 'location_detail_id';
  static const String createdAt = 'created_at';
  static const String distanceBetween = 'distance_between';
}

@JsonSerializable()
class TrainingRequestDynamicWithDistance extends Equatable {
  final int? trainingRequestId;
  final UserDynamic trainingRequester;
  final TrainingDetailDynamic trainingDetailDynamic;
  final LocationDetailDynamic locationDetailDynamic;
  final DateTime createdAt;
  final double distanceBetween;

  TrainingRequestDynamicWithDistance({
    this.trainingRequestId,
    required this.trainingRequester,
    required this.trainingDetailDynamic,
    required this.locationDetailDynamic,
    DateTime? createdAt,
    required this.distanceBetween,
  }) : createdAt = createdAt ?? DateTime.now();

  TrainingRequestDynamicWithDistance copy({
    int? trainingRequestId,
    UserDynamic? trainingRequester,
    TrainingDetailDynamic? trainingDetailDynamic,
    LocationDetailDynamic? locationDetailDynamic,
    DateTime? createdAt,
    double? distanceBetween,
  }) =>
      TrainingRequestDynamicWithDistance(
        trainingRequestId: trainingRequestId ?? this.trainingRequestId,
        trainingRequester: trainingRequester ?? this.trainingRequester,
        trainingDetailDynamic:
            trainingDetailDynamic ?? this.trainingDetailDynamic,
        locationDetailDynamic:
            locationDetailDynamic ?? this.locationDetailDynamic,
        createdAt: createdAt ?? this.createdAt,
        distanceBetween: distanceBetween ?? this.distanceBetween,
      );

  factory TrainingRequestDynamicWithDistance.fromJson(
          Map<String, dynamic> json) =>
      _$TrainingRequestDynamicWithDistanceFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TrainingRequestDynamicWithDistanceToJson(this);

  @override
  List<Object?> get props => [
        trainingRequestId,
        trainingRequester,
        trainingDetailDynamic,
        locationDetailDynamic,
        createdAt,
        distanceBetween,
      ];

  @override
  String toString() {
    return 'tblTrainingRequests(training_request_id: $trainingRequestId, training_requester_id: $trainingRequester, training_detail_id: $trainingDetailDynamic, location_detail_id: $locationDetailDynamic, created_at: $createdAt, distance_between: $distanceBetween)';
  }
}
