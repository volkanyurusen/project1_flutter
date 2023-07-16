// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'activity_name_dynamic.g.dart';

const String tblActivityNames = 'tblActivityNames';

class ActivityNameDynamicFields {
  static final List<String> values = [
    activityNameId,
    activityTypeId,
    activityTitle,
    activityTypeId,
  ];

  static const String activityNameId = 'activity_name_id';
  static const String activityTitle = 'activity_title';
  static const String activityTypeId = 'activity_type_id';
}

@JsonSerializable()
class ActivityNameDynamic extends Equatable {
  final int? activityNameId;
  final String activityTitle;
  final ActivityTypeDynamic activityTypeDynamic;

  const ActivityNameDynamic({
    this.activityNameId,
    required this.activityTitle,
    required this.activityTypeDynamic,
  });

  ActivityNameDynamic copy({
    int? activityNameId,
    String? activityTitle,
    ActivityTypeDynamic? activityTypeDynamic,
  }) =>
      ActivityNameDynamic(
        activityNameId: activityNameId ?? this.activityNameId,
        activityTitle: activityTitle ?? this.activityTitle,
        activityTypeDynamic: activityTypeDynamic ?? this.activityTypeDynamic,
      );

  factory ActivityNameDynamic.fromJson(Map<String, dynamic> json) =>
      _$ActivityNameDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityNameDynamicToJson(this);

  @override
  List<Object?> get props => [
        activityNameId,
        activityTitle,
        activityTypeDynamic,
      ];

  @override
  String toString() {
    return 'tblActivityNames(activity_name_id: $activityNameId, activity_title: $activityTitle, activity_type: $activityTypeDynamic)';
  }
}
