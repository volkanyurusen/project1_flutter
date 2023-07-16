// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'training_offer.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblTrainingOffers = 'tblTrainingOffers';

class TrainingOfferFields {
  static final List<String> values = [
    /// Add all fields here
    trainingOfferId, coachId, trainingDetailId, coachingLocationDetailId,
    createdAt, deactivatedAt, updatedAt, isActive,
  ];

  static const String trainingOfferId = 'training_offer_id';
  static const String coachId = 'coach_id';
  static const String trainingDetailId = 'training_detail_id';
  static const String coachingLocationDetailId = 'coaching_location_detail_id';
  static const String createdAt = 'created_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

/// When User click the button "Create Activity" this model is created. All created activity details
/// are stored in this table.
///
// @JsonSerializable()
class TrainingOffer extends Equatable {
  final int? trainingOfferId;
  final int coachId;
  final int trainingDetailId;
  final int coachingLocationDetailId;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  TrainingOffer({
    this.trainingOfferId,
    required this.coachId,
    required this.trainingDetailId,
    required this.coachingLocationDetailId,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : createdAt = createdAt ?? DateTime.now();

  TrainingOffer copy({
    int? trainingOfferId,
    int? coachId,
    int? trainingDetailId,
    int? coachingLocationDetailId,
    DateTime? createdAt,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      TrainingOffer(
        trainingOfferId: trainingOfferId ?? this.trainingOfferId,
        coachId: coachId ?? this.coachId,
        trainingDetailId: trainingDetailId ?? this.trainingDetailId,
        coachingLocationDetailId:
            coachingLocationDetailId ?? this.coachingLocationDetailId,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory TrainingOffer.fromJson(Map<String, dynamic> json) =>
      _$TrainingOfferFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingOfferToJson(this);

  @override
  List<Object?> get props => [
        trainingOfferId,
        coachId,
        trainingDetailId,
        coachingLocationDetailId,
        createdAt,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblTrainingOffers(training_offer_id: $trainingOfferId, coach_id: $coachId, training_detail_id: $trainingDetailId, coaching_location_detail_id: $coachingLocationDetailId, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}
