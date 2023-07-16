// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'process_detail.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblProcessDetails = 'tblProcessDetails';

class ProcessDetailFields {
  static final List<String> values = [
    /// Add all fields here
    processDetailId, processName, createdAt, deactivatedAt, updatedAt, isActive,
  ];

  static const String processDetailId = 'process_detail_id';
  static const String processName = 'process_name';
  static const String createdAt = 'created_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

/// processDetail -second variable- will show the activity attendees' process
/// regarding the activity which they want to participate in.
///
/// requesteed  : When attendee send a request
/// approved    : When the request is approved
/// denied      : When the request is denied
/// recalled    : When the request is recalled by the attendee
///
// @JsonSerializable()
class ProcessDetail extends Equatable {
  final int? processDetailId;
  final String processName;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  ProcessDetail({
    this.processDetailId,
    required this.processName,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : createdAt = createdAt ?? DateTime.now();

  ProcessDetail copy({
    int? processDetailId,
    String? processName,
    DateTime? createdAt,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      ProcessDetail(
        processDetailId: processDetailId ?? this.processDetailId,
        processName: processName ?? this.processName,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory ProcessDetail.fromJson(Map<String, dynamic> json) =>
      _$ProcessDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ProcessDetailToJson(this);

  @override
  List<Object?> get props => [
        processDetailId,
        processName,
        createdAt,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblProcessDetails(process_detail_id: $processDetailId, process_name: $processName, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}
