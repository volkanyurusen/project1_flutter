// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models//models_dynamics.dart';

part 'training_offer_response_dynamic_with_distance.g.dart';

const String tblTrainingOfferResponseDynamicWithDistances =
    'tblTrainingOfferResponseDynamicWithDistances';

class TrainingOfferResponseDynamicWithDistanceFields {
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
    distanceBetween,
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
  static const String distanceBetween = 'distance_between';
}

@JsonSerializable()
class TrainingOfferResponseDynamicWithDistance extends Equatable {
  final int? trainingOfferResponseId;
  final TrainingOfferDynamic trainingOfferDynamic;
  final UserDynamic traineeDynamic;
  final ProcessDetailDynamic processDetailDynamic;
  final DateTime requestDate;
  final DateTime? approvedDate;
  final DateTime? deniedDate;
  final DateTime? recalledDate;
  final DateTime? updatedDate;
  final bool isDenied;
  final bool isApproved;
  final double distanceBetween;

  TrainingOfferResponseDynamicWithDistance({
    this.trainingOfferResponseId,
    required this.trainingOfferDynamic,
    required this.traineeDynamic,
    required this.processDetailDynamic,
    DateTime? requestDate,
    this.approvedDate,
    this.deniedDate,
    this.recalledDate,
    this.updatedDate,
    this.isDenied = false,
    this.isApproved = false,
    required this.distanceBetween,
  }) : requestDate = requestDate ?? DateTime.now();

  TrainingOfferResponseDynamicWithDistance copy({
    int? trainingOfferResponseId,
    TrainingOfferDynamic? trainingOfferDynamic,
    UserDynamic? traineeDynamic,
    ProcessDetailDynamic? processDetailDynamic,
    DateTime? requestDate,
    DateTime? approvedDate,
    DateTime? deniedDate,
    DateTime? recalledDate,
    DateTime? updatedDate,
    bool? isDenied,
    bool? isApproved,
    double? distanceBetween,
  }) =>
      TrainingOfferResponseDynamicWithDistance(
        trainingOfferResponseId:
            trainingOfferResponseId ?? this.trainingOfferResponseId,
        trainingOfferDynamic: trainingOfferDynamic ?? this.trainingOfferDynamic,
        traineeDynamic: traineeDynamic ?? this.traineeDynamic,
        processDetailDynamic: processDetailDynamic ?? this.processDetailDynamic,
        requestDate: requestDate ?? this.requestDate,
        approvedDate: approvedDate ?? this.approvedDate,
        deniedDate: deniedDate ?? this.deniedDate,
        recalledDate: recalledDate ?? this.recalledDate,
        updatedDate: updatedDate ?? this.updatedDate,
        isDenied: isDenied ?? this.isDenied,
        isApproved: isApproved ?? this.isApproved,
        distanceBetween: distanceBetween ?? this.distanceBetween,
      );

  factory TrainingOfferResponseDynamicWithDistance.fromJson(
          Map<String, dynamic> json) =>
      _$TrainingOfferResponseDynamicWithDistanceFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TrainingOfferResponseDynamicWithDistanceToJson(this);

  @override
  List<Object?> get props => [
        trainingOfferResponseId,
        trainingOfferDynamic,
        traineeDynamic,
        processDetailDynamic,
        requestDate,
        approvedDate,
        deniedDate,
        recalledDate,
        updatedDate,
        isDenied,
        isApproved,
        distanceBetween,
      ];

  @override
  String toString() {
    return 'TrainingOfferResponseDynamicWithDistance(trainingOfferResponseId: $trainingOfferResponseId, trainingOfferDynamic: $trainingOfferDynamic, traineeDynamic: $traineeDynamic, processDetailDynamic: $processDetailDynamic, requestDate: $requestDate, approvedDate: $approvedDate, deniedDate: $deniedDate, recalledDate: $recalledDate, updatedDate: $updatedDate, isDenied: $isDenied, isApproved: $isApproved, distanceBetween: $distanceBetween)';
  }
}
