// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'training_offer_response.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblTrainingOfferResponses = 'tblTrainingOfferResponses';

class TrainingOfferResponseFields {
  static final List<String> values = [
    /// Add all fields here
    trainingOfferResponseId, trainingOfferId, traineeId, processDetailId,
    requestDate, approvedDate, deniedDate, recalledDate, updatedDate, isDenied,
    isApproved, isActive,
  ];

  static const String trainingOfferResponseId = 'training_offer_response_id';
  static const String trainingOfferId = 'training_offer_id';
  static const String traineeId = 'trainee_id';
  static const String processDetailId = 'process_detail_id';
  static const String requestDate = 'request_date';
  static const String approvedDate = 'approved_date';
  static const String deniedDate = 'denied_date';
  static const String recalledDate = 'recalled_date';
  static const String updatedDate = 'updated_date';
  static const String isDenied = 'is_denied';
  static const String isApproved = 'is_approved';
  static const String isActive = 'is_active';
}

/// When User click the button "Create Activity" this model is created. All created activity details
/// are stored in this table.
///
// @JsonSerializable()
class TrainingOfferResponse extends Equatable {
  final int? trainingOfferResponseId;
  final int trainingOfferId;
  final int traineeId;
  final int processDetailId;
  final DateTime requestDate;
  final DateTime? approvedDate;
  final DateTime? deniedDate;
  final DateTime? recalledDate;
  final DateTime? updatedDate;
  final bool isDenied;
  final bool isApproved;
  final bool isActive;

  TrainingOfferResponse({
    this.trainingOfferResponseId,
    required this.trainingOfferId,
    required this.traineeId,
    required this.processDetailId,
    DateTime? requestDate,
    this.approvedDate,
    this.deniedDate,
    this.recalledDate,
    this.updatedDate,
    this.isDenied = false,
    this.isApproved = false,
    this.isActive = true,
  }) : requestDate = requestDate ?? DateTime.now();

  TrainingOfferResponse copy({
    int? trainingOfferResponseId,
    int? trainingOfferId,
    int? traineeId,
    int? processDetailId,
    DateTime? requestDate,
    DateTime? approvedDate,
    DateTime? deniedDate,
    DateTime? recalledDate,
    DateTime? updatedDate,
    bool? isDenied,
    bool? isApproved,
    bool? isActive,
  }) =>
      TrainingOfferResponse(
        trainingOfferResponseId:
            trainingOfferResponseId ?? this.trainingOfferResponseId,
        trainingOfferId: trainingOfferId ?? this.trainingOfferId,
        traineeId: traineeId ?? this.traineeId,
        processDetailId: processDetailId ?? this.processDetailId,
        requestDate: requestDate ?? this.requestDate,
        approvedDate: approvedDate ?? this.approvedDate,
        deniedDate: deniedDate ?? this.deniedDate,
        recalledDate: recalledDate ?? this.recalledDate,
        updatedDate: updatedDate ?? this.updatedDate,
        isDenied: isDenied ?? this.isDenied,
        isApproved: isApproved ?? this.isApproved,
        isActive: isActive ?? this.isActive,
      );

  factory TrainingOfferResponse.fromJson(Map<String, dynamic> json) =>
      _$TrainingOfferResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingOfferResponseToJson(this);

  @override
  List<Object?> get props => [
        trainingOfferResponseId,
        trainingOfferId,
        traineeId,
        processDetailId,
        requestDate,
        approvedDate,
        deniedDate,
        recalledDate,
        updatedDate,
        isDenied,
        isApproved,
        isActive,
      ];

  @override
  String toString() {
    return 'TrainingOfferResponse(trainingOfferResponseId: $trainingOfferResponseId, trainingOfferId: $trainingOfferId, traineeId: $traineeId, processDetailId: $processDetailId, requestDate: $requestDate, approvedDate: $approvedDate, deniedDate: $deniedDate, recalledDate: $recalledDate, updatedDate: $updatedDate, isDenied: $isDenied, isApproved: $isApproved, isActive: $isActive)';
  }
}
