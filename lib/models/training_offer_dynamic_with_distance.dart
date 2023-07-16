// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'training_offer_dynamic_with_distance.g.dart';

const String tblTrainingOfferDynamicsWithDistance =
    'tblTrainingOfferDynamicsWithDistance';

class TrainingOfferDynamicWithDistanceFields {
  static final List<String> values = [
    trainingOfferId,
    coachId,
    trainingDetailId,
    coachingLocationDetailId,
    createdAt,
    distanceBetween,
  ];
  static const String trainingOfferId =
      'training_offer_id';
  static const String coachId = 'coach_id';
  static const String trainingDetailId = 'training_detail_id';
  static const String coachingLocationDetailId = 'coaching_location_detail_id';
  static const String createdAt = 'created_at';
  static const String distanceBetween = 'distance_between';
}

@JsonSerializable()
class TrainingOfferDynamicWithDistance extends Equatable {
  final int? trainingOfferId;
  final CoachDynamic coachDynamic;
  final TrainingDetailDynamic trainingDetailDynamic;
  final CoachingLocationDetailDynamic coachingLocationDetailDynamic;
  final DateTime createdAt;
  final double distanceBetween;

  TrainingOfferDynamicWithDistance({
    this.trainingOfferId,
    required this.coachDynamic,
    required this.trainingDetailDynamic,
    required this.coachingLocationDetailDynamic,
    DateTime? createdAt,
    required this.distanceBetween,
  }) : createdAt = createdAt ?? DateTime.now();

  TrainingOfferDynamicWithDistance copy({
    int? trainingOfferId,
    CoachDynamic? coachDynamic,
    TrainingDetailDynamic? trainingDetailDynamic,
    CoachingLocationDetailDynamic? coachingLocationDetailDynamic,
    DateTime? createdAt,
    double? distanceBetween,
  }) =>
      TrainingOfferDynamicWithDistance(
        trainingOfferId:
            trainingOfferId ??
                this.trainingOfferId,
        coachDynamic: coachDynamic ?? this.coachDynamic,
        trainingDetailDynamic:
            trainingDetailDynamic ?? this.trainingDetailDynamic,
        coachingLocationDetailDynamic:
            coachingLocationDetailDynamic ?? this.coachingLocationDetailDynamic,
        createdAt: createdAt ?? this.createdAt,
        distanceBetween: distanceBetween ?? this.distanceBetween,
      );

  factory TrainingOfferDynamicWithDistance.fromJson(
          Map<String, dynamic> json) =>
      _$TrainingOfferDynamicWithDistanceFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TrainingOfferDynamicWithDistanceToJson(this);

  @override
  List<Object?> get props => [
        trainingOfferId,
        coachDynamic,
        trainingDetailDynamic,
        coachingLocationDetailDynamic,
        createdAt,
        distanceBetween,
      ];

  @override
  String toString() {
    return 'tblTrainingOffers(training_offer_id: $trainingOfferId, coach_id: $coachDynamic, training_detail_id: $trainingDetailDynamic, coaching_location_detail_id: $coachingLocationDetailDynamic, created_at: $createdAt, distance_between: $distanceBetween)';
  }
}
