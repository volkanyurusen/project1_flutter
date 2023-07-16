// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'consisted_activity.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblConsistedActivities = 'tblConsistedActivities';

class ConsistedActivityFields {
  static final List<String> values = [
    /// Add all fields here
    consistedActivityId, createdActivityId, attendeeId, processDetailId,
    requestDate, deniedDate, recalledDate, updatedDate, isDenied, isApproved,
    isActive,
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
  static const String isActive = 'is_active';
}

/// When User click the button "Create Activity" this model is created. All created activity details
/// are stored in this table.
///
// @JsonSerializable()
class ConsistedActivity extends Equatable {
  final int? consistedActivityId;
  final int createdActivityId;
  final int attendeeId;
  final int processDetailId;
  final DateTime requestDate;
  final DateTime? approvedDate;
  final DateTime? deniedDate;
  final DateTime? recalledDate;
  final DateTime? updatedDate;
  final bool isDenied;
  final bool isApproved;
  final bool isActive;

  ConsistedActivity({
    this.consistedActivityId,
    required this.createdActivityId,
    required this.attendeeId,
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

  ConsistedActivity copy({
    int? consistedActivityId,
    int? createdActivityId,
    int? attendeeId,
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
      ConsistedActivity(
        consistedActivityId: consistedActivityId ?? this.consistedActivityId,
        createdActivityId: createdActivityId ?? this.createdActivityId,
        attendeeId: attendeeId ?? this.attendeeId,
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

  factory ConsistedActivity.fromJson(Map<String, dynamic> json) =>
      _$ConsistedActivityFromJson(json);

  Map<String, dynamic> toJson() => _$ConsistedActivityToJson(this);

  @override
  List<Object?> get props => [
        consistedActivityId,
        createdActivityId,
        attendeeId,
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
    return 'ConsistedActivity(consistedActivityId: $consistedActivityId, createdActivityId: $createdActivityId, attendeeId: $attendeeId, processDetailId: $processDetailId, requestDate: $requestDate, approvedDate: $approvedDate, deniedDate: $deniedDate, recalledDate: $recalledDate, updatedDate: $updatedDate, isDenied: $isDenied, isApproved: $isApproved, isActive: $isActive)';
  }
}

// ConsistedActivity fromMap(Map<String, dynamic> json) => ConsistedActivity(
//       consistedActivityId:
//           json[ConsistedActivityFields.consistedActivityId] as int,
//       createdActivityId: json[ConsistedActivityFields.createdActivityId] as int,
//       attendeeId: json[ConsistedActivityFields.attendeeId] as int,
//       processDetailId: json[ConsistedActivityFields.processDetailId] as int,
//       requestDate:
//           DateTime.parse(json[ConsistedActivityFields.requestDate] as String),
//       approvedDate:
//           DateTime.parse(json[ConsistedActivityFields.approvedDate] as String),
//       deniedDate:
//           DateTime.parse(json[ConsistedActivityFields.deniedDate] as String),
//       recalledDate:
//           DateTime.parse(json[ConsistedActivityFields.recalledDate] as String),
//       updatedDate:
//           DateTime.parse(json[ConsistedActivityFields.updatedDate] as String),
//       isApproved: json[ConsistedActivityFields.isApproved] == 1,
//       isActive: json[ConsistedActivityFields.isActive] == 1,
//     );

// Map<String, dynamic> toMap() => {
//       ConsistedActivityFields.consistedActivityId: consistedActivityId,
//       ConsistedActivityFields.createdActivityId: createdActivityId,
//       ConsistedActivityFields.attendeeId: attendeeId,
//       ConsistedActivityFields.processDetailId: processDetailId,
//       ConsistedActivityFields.requestDate: requestDate.toIso8601String(),
//       ConsistedActivityFields.approvedDate: approvedDate?.toIso8601String(),
//       ConsistedActivityFields.deniedDate: deniedDate?.toIso8601String(),
//       ConsistedActivityFields.recalledDate: recalledDate?.toIso8601String(),
//       ConsistedActivityFields.updatedDate: updatedDate?.toIso8601String(),
//       ConsistedActivityFields.isApproved: isApproved ? 1 : 0,
//       ConsistedActivityFields.isActive: isActive ? 1 : 0,
//     };
