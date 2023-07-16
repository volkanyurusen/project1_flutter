// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'training_offer_response_dynamic.g.dart';

const String tblTrainingOfferResponseDynamics =
    'tblTrainingOfferResponseDynamics';

class TrainingOfferResponseDynamicFields {
  static final List<String> values = [
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
}

@JsonSerializable()
class TrainingOfferResponseDynamic extends Equatable {
  final int? trainingOfferResponseId;
  final TrainingOfferDynamic trainingOfferDynamic;
  final UserDynamic trainee;
  final ProcessDetailDynamic processDetailDynamic;
  final DateTime requestDate;
  final DateTime? approvedDate;
  final DateTime? deniedDate;
  final DateTime? recalledDate;
  final DateTime? updatedDate;
  final bool isDenied;
  final bool isApproved;

  TrainingOfferResponseDynamic({
    this.trainingOfferResponseId,
    required this.trainingOfferDynamic,
    required this.trainee,
    required this.processDetailDynamic,
    DateTime? requestDate,
    this.approvedDate,
    this.deniedDate,
    this.recalledDate,
    this.updatedDate,
    this.isDenied = false,
    this.isApproved = false,
  }) : requestDate = requestDate ?? DateTime.now();

  TrainingOfferResponseDynamic copy({
    int? trainingOfferResponseId,
    TrainingOfferDynamic? trainingOfferDynamic,
    UserDynamic? trainee,
    ProcessDetailDynamic? processDetailDynamic,
    DateTime? requestDate,
    DateTime? approvedDate,
    DateTime? deniedDate,
    DateTime? recalledDate,
    DateTime? updatedDate,
    bool? isDenied,
    bool? isApproved,
  }) =>
      TrainingOfferResponseDynamic(
        trainingOfferResponseId:
            trainingOfferResponseId ?? this.trainingOfferResponseId,
        trainingOfferDynamic: trainingOfferDynamic ?? this.trainingOfferDynamic,
        trainee: trainee ?? this.trainee,
        processDetailDynamic: processDetailDynamic ?? this.processDetailDynamic,
        requestDate: requestDate ?? this.requestDate,
        approvedDate: approvedDate ?? this.approvedDate,
        deniedDate: deniedDate ?? this.deniedDate,
        recalledDate: recalledDate ?? this.recalledDate,
        updatedDate: updatedDate ?? this.updatedDate,
        isDenied: isDenied ?? this.isDenied,
        isApproved: isApproved ?? this.isApproved,
      );

  factory TrainingOfferResponseDynamic.fromJson(Map<String, dynamic> json) =>
      _$TrainingOfferResponseDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingOfferResponseDynamicToJson(this);

  @override
  List<Object?> get props => [
        trainingOfferResponseId,
        trainingOfferDynamic,
        trainee,
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
    return 'TrainingOfferResponseDynamic(trainingOfferResponseId: $trainingOfferResponseId, trainingOfferDynamic: $trainingOfferDynamic, trainee: $trainee, processDetailDynamic: $processDetailDynamic, requestDate: $requestDate, approvedDate: $approvedDate, deniedDate: $deniedDate, recalledDate: $recalledDate, updatedDate: $updatedDate, isDenied: $isDenied, isApproved: $isApproved)';
  }
}
