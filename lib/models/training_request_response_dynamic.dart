// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models//models_dynamics.dart';

part 'training_request_response_dynamic.g.dart';

const String tblTrainingRequestResponseDynamics =
    'tblTrainingRequestResponseDynamics';

class TrainingRequestResponseDynamicFields {
  static final List<String> values = [
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
}

@JsonSerializable()
class TrainingRequestResponseDynamic extends Equatable {
  final int? trainingRequestResponseId;
  final TrainingRequestDynamic trainingRequestDynamic;
  final CoachDynamic coachDynamic;
  final ProcessDetailDynamic processDetailDynamic;
  final DateTime requestDate;
  final DateTime? approvedDate;
  final DateTime? deniedDate;
  final DateTime? recalledDate;
  final DateTime? updatedDate;
  final bool isDenied;
  final bool isApproved;

  TrainingRequestResponseDynamic({
    this.trainingRequestResponseId,
    required this.trainingRequestDynamic,
    required this.coachDynamic,
    required this.processDetailDynamic,
    DateTime? requestDate,
    this.approvedDate,
    this.deniedDate,
    this.recalledDate,
    this.updatedDate,
    this.isDenied = false,
    this.isApproved = false,
  }) : requestDate = requestDate ?? DateTime.now();

  TrainingRequestResponseDynamic copy({
    int? trainingRequestResponseId,
    TrainingRequestDynamic? trainingRequestDynamic,
    CoachDynamic? coachDynamic,
    ProcessDetailDynamic? processDetailDynamic,
    DateTime? requestDate,
    DateTime? approvedDate,
    DateTime? deniedDate,
    DateTime? recalledDate,
    DateTime? updatedDate,
    bool? isDenied,
    bool? isApproved,
  }) =>
      TrainingRequestResponseDynamic(
        trainingRequestResponseId:
            trainingRequestResponseId ?? this.trainingRequestResponseId,
        trainingRequestDynamic:
            trainingRequestDynamic ?? this.trainingRequestDynamic,
        coachDynamic: coachDynamic ?? this.coachDynamic,
        processDetailDynamic: processDetailDynamic ?? this.processDetailDynamic,
        requestDate: requestDate ?? this.requestDate,
        approvedDate: approvedDate ?? this.approvedDate,
        deniedDate: deniedDate ?? this.deniedDate,
        recalledDate: recalledDate ?? this.recalledDate,
        updatedDate: updatedDate ?? this.updatedDate,
        isDenied: isDenied ?? this.isDenied,
        isApproved: isApproved ?? this.isApproved,
      );

  factory TrainingRequestResponseDynamic.fromJson(Map<String, dynamic> json) =>
      _$TrainingRequestResponseDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingRequestResponseDynamicToJson(this);

  @override
  List<Object?> get props => [
        trainingRequestResponseId,
        trainingRequestDynamic,
        coachDynamic,
        processDetailDynamic,
        requestDate,
        approvedDate,
        deniedDate,
        recalledDate,
        updatedDate,
        isDenied,
        isApproved,
      ];



  @override
  String toString() {
    return 'TrainingRequestResponseDynamic(trainingRequestResponseId: $trainingRequestResponseId, trainingRequestDynamic: $trainingRequestDynamic, coachDynamic: $coachDynamic, processDetailDynamic: $processDetailDynamic, requestDate: $requestDate, approvedDate: $approvedDate, deniedDate: $deniedDate, recalledDate: $recalledDate, updatedDate: $updatedDate, isDenied: $isDenied, isApproved: $isApproved)';
  }
}
