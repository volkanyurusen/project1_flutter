// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'training_request.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblTrainingRequests = 'tblTrainingRequests';

class TrainingRequestFields {
  static final List<String> values = [
    /// Add all fields here
    trainingRequestId, trainingRequesterId, trainingDetailId, locationDetailId,
    createdAt, deactivatedAt, updatedAt, isActive,
  ];

  static const String trainingRequestId = 'training_request_id';
  static const String trainingRequesterId = 'training_requester_id';
  static const String trainingDetailId = 'training_detail_id';
  static const String locationDetailId = 'location_detail_id';
  // static const String isLocationTemplate = 'isLocationTemplate';
  static const String createdAt = 'created_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

/// When User click the button "Create Activity" this model is created. All created activity details
/// are stored in this table.
///
// @JsonSerializable()
class TrainingRequest extends Equatable {
  final int? trainingRequestId;
  final int trainingRequesterId;
  final int trainingDetailId;
  final int locationDetailId;
  // final bool isLocationTemplate;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  TrainingRequest({
    this.trainingRequestId,
    required this.trainingRequesterId,
    required this.trainingDetailId,
    required this.locationDetailId,
    // this.isLocationTemplate = false,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : createdAt = createdAt ?? DateTime.now();

  TrainingRequest copy({
    int? trainingRequestId,
    int? trainingRequesterId,
    int? trainingDetailId,
    int? locationDetailId,
    // bool? isLocationTemplate,
    DateTime? createdAt,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      TrainingRequest(
        trainingRequestId: trainingRequestId ?? this.trainingRequestId,
        trainingRequesterId: trainingRequesterId ?? this.trainingRequesterId,
        trainingDetailId: trainingDetailId ?? this.trainingDetailId,
        locationDetailId: locationDetailId ?? this.locationDetailId,
        // isLocationTemplate: isLocationTemplate ?? this.isLocationTemplate,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory TrainingRequest.fromJson(Map<String, dynamic> json) =>
      _$TrainingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingRequestToJson(this);

  @override
  List<Object?> get props => [
        trainingRequestId,
        trainingRequesterId,
        trainingDetailId,
        locationDetailId,
        //  isLocationTemplate,
        createdAt,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblTrainingRequests(training_request_id: $trainingRequestId, training_requester_id: $trainingRequesterId, training_detail_id: $trainingDetailId, location_detail_id: $locationDetailId, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}
