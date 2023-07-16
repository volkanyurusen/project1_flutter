// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activity_type_dynamic.g.dart';

const String tblActivityTypes = 'tblactivityTypes';

class ActivityTypeDynamicFields {
  static final List<String> values = [
    /// Add all fields here
    activityTypeId, activityTypeDetail,
  ];
  static const String activityTypeId = 'activity_type_id';
  static const String activityTypeDetail = 'activity_type_detail';
}

@JsonSerializable()
class ActivityTypeDynamic extends Equatable {
  final int? activityTypeId;
  final String activityTypeDetail;

  const ActivityTypeDynamic({
    this.activityTypeId,
    required this.activityTypeDetail,
  });

  ActivityTypeDynamic copy({
    int? activityTypeId,
    String? activityTypeDetail,
  }) =>
      ActivityTypeDynamic(
        activityTypeId:
            activityTypeId ?? this.activityTypeId,
        activityTypeDetail:
            activityTypeDetail ?? this.activityTypeDetail,
      );

  factory ActivityTypeDynamic.fromJson(Map<String, dynamic> json) =>
      _$ActivityTypeDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityTypeDynamicToJson(this);

  @override
  List<Object?> get props => [
        activityTypeId,
        activityTypeDetail,
      ];

  @override
  String toString() {
    return 'tblActivityTypeDynamics(activity_type_id: $activityTypeId, activity_type_detail: $activityTypeDetail)';
  }
}
