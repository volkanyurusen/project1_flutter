// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'training_offer_dynamic.g.dart';

const String tblTrainingOfferDynamics = 'tblTrainingOfferDynamics';

class TrainingOfferDynamicFields {
  static final List<String> values = [
    trainingOfferId,
    coachId,
    trainingDetailId,
    coachingLocationDetailId,
    createdAt,
    isActive,
  ];
  static const String trainingOfferId = 'training_offer_id';
  static const String coachId = 'coach_id';
  static const String trainingDetailId = 'training_detail_id';
  static const String coachingLocationDetailId = 'coaching_location_detail_id';
  static const String createdAt = 'created_at';
  static const String isActive = 'is_active';
}

@JsonSerializable()
class TrainingOfferDynamic extends Equatable {
  final int? trainingOfferId;
  final CoachDynamic coachDynamic;
  final TrainingDetailDynamic trainingDetailDynamic;
  final CoachingLocationDetailDynamic coachingLocationDetailDynamic;
  final DateTime createdAt;
  final bool isActive;

  TrainingOfferDynamic({
    this.trainingOfferId,
    required this.coachDynamic,
    required this.trainingDetailDynamic,
    required this.coachingLocationDetailDynamic,
    required this.createdAt,
    this.isActive = true,
  });

  TrainingOfferDynamic copy({
    int? trainingOfferId,
    CoachDynamic? coachDynamic,
    TrainingDetailDynamic? trainingDetailDynamic,
    CoachingLocationDetailDynamic? coachingLocationDetailDynamic,
    DateTime? createdAt,
    bool? isActive,
  }) =>
      TrainingOfferDynamic(
        trainingOfferId: trainingOfferId ?? this.trainingOfferId,
        coachDynamic: coachDynamic ?? this.coachDynamic,
        trainingDetailDynamic:
            trainingDetailDynamic ?? this.trainingDetailDynamic,
        coachingLocationDetailDynamic:
            coachingLocationDetailDynamic ?? this.coachingLocationDetailDynamic,
        createdAt: createdAt ?? this.createdAt,
        isActive: isActive ?? this.isActive,
      );

  factory TrainingOfferDynamic.fromJson(Map<String, dynamic> json) =>
      _$TrainingOfferDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingOfferDynamicToJson(this);

  @override
  List<Object?> get props => [
        trainingOfferId,
        coachDynamic,
        trainingDetailDynamic,
        coachingLocationDetailDynamic,
        createdAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblTrainingOffers(training_offer_id: $trainingOfferId, coach_id: $coachDynamic, training_detail_id: $trainingDetailDynamic, coaching_location_detail_id: $coachingLocationDetailDynamic, created_at: $createdAt, is_active: $isActive)';
  }
}
