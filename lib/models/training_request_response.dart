// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'training_request_response.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblTrainingRequestResponses = 'tblTrainingRequestResponses';

class TrainingRequestResponseFields {
  static final List<String> values = [
    /// Add all fields here
    trainingRequestResponseId, trainingRequestId, coachId, processDetailId,
    requestDate, approvedDate, deniedDate, recalledDate, updatedDate, isDenied,
    isApproved, isActive,
  ];

  static const String trainingRequestResponseId =
      'training_request_response_id';
  static const String trainingRequestId = 'training_request_id';
  static const String coachId = 'coach_id';
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
class TrainingRequestResponse extends Equatable {
  final int? trainingRequestResponseId;
  final int trainingRequestId;
  final int coachId;
  final int processDetailId;
  final DateTime requestDate;
  final DateTime? approvedDate;
  final DateTime? deniedDate;
  final DateTime? recalledDate;
  final DateTime? updatedDate;
  final bool isDenied;
  final bool isApproved;
  final bool isActive;

  TrainingRequestResponse({
    this.trainingRequestResponseId,
    required this.trainingRequestId,
    required this.coachId,
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

  TrainingRequestResponse copy({
    int? trainingRequestResponseId,
    int? trainingRequestId,
    int? coachId,
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
      TrainingRequestResponse(
        trainingRequestResponseId:
            trainingRequestResponseId ?? this.trainingRequestResponseId,
        trainingRequestId: trainingRequestId ?? this.trainingRequestId,
        coachId: coachId ?? this.coachId,
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

  factory TrainingRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$TrainingRequestResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingRequestResponseToJson(this);

  @override
  List<Object?> get props => [
        trainingRequestResponseId,
        trainingRequestId,
        coachId,
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
    return 'TrainingRequestResponse(trainingRequestResponseId: $trainingRequestResponseId, trainingRequestId: $trainingRequestId, coachId: $coachId, processDetailId: $processDetailId, requestDate: $requestDate, approvedDate: $approvedDate, deniedDate: $deniedDate, recalledDate: $recalledDate, updatedDate: $updatedDate, isDenied: $isDenied, isApproved: $isApproved, isActive: $isActive)';
  }
}
