// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'consisted_activity_dynamic_with_distance.g.dart';

const String tblConsistedActivityDynamicWithDistances =
    'tblConsistedActivityDynamicWithDistances';

class ConsistedActivityDynamicWithDistanceFields {
  static final List<String> values = [
    consistedActivityId,
    createdActivityId,
    attendeeId,
    processDetailId,
    requestDate,
    deniedDate,
    recalledDate,
    updatedDate,
    isDenied,
    isApproved,
    distanceBetween
  ];
  static const String consistedActivityId = 'consisted_activity_id';
  static const String createdActivityId = 'created_activity_id';
  static const String attendeeId = 'attendee_id';
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
class ConsistedActivityDynamicWithDistance extends Equatable {
  final int? consistedActivityId;
  final CreatedActivityDynamic createdActivityDynamic;
  final UserDynamic attendee;
  final ProcessDetailDynamic processDetailDynamic;
  final DateTime requestDate;
  final DateTime? approvedDate;
  final DateTime? deniedDate;
  final DateTime? recalledDate;
  final DateTime? updatedDate;
  final bool isDenied;
  final bool isApproved;
  final double distanceBetween;

  ConsistedActivityDynamicWithDistance({
    this.consistedActivityId,
    required this.createdActivityDynamic,
    required this.attendee,
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

  ConsistedActivityDynamicWithDistance copy({
    int? consistedActivityId,
    CreatedActivityDynamic? createdActivityDynamic,
    UserDynamic? attendee,
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
      ConsistedActivityDynamicWithDistance(
        consistedActivityId: consistedActivityId ?? this.consistedActivityId,
        createdActivityDynamic:
            createdActivityDynamic ?? this.createdActivityDynamic,
        attendee: attendee ?? this.attendee,
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

  factory ConsistedActivityDynamicWithDistance.fromJson(
          Map<String, dynamic> json) =>
      _$ConsistedActivityDynamicWithDistanceFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ConsistedActivityDynamicWithDistanceToJson(this);

  @override
  List<Object?> get props => [
        consistedActivityId,
        createdActivityDynamic,
        attendee,
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
    return 'ConsistedActivityDynamicWithDistance(consistedActivityId: $consistedActivityId, createdActivityDynamic: $createdActivityDynamic, attendee: $attendee, processDetailDynamic: $processDetailDynamic, requestDate: $requestDate, approvedDate: $approvedDate, deniedDate: $deniedDate, recalledDate: $recalledDate, updatedDate: $updatedDate, isDenied: $isDenied, isApproved: $isApproved, distanceBetween: $distanceBetween)';
  }
}
