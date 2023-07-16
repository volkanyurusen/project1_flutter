// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coaching_type_dynamic.g.dart';

const String tblCoachingTypes = 'tblCoachingTypes';

class CoachingTypeDynamicFields {
  static final List<String> values = [
    coachingTypeId,
    coachingTypeName,
    creatingTrainingLimitPerDay,
    locationCircularDiameter,
  ];
  static const String coachingTypeId = 'coaching_type_id';
  static const String coachingTypeName = 'coaching_type_name';
  static const String creatingTrainingLimitPerDay =
      'creating_training_limit_per_day';
  static const String locationCircularDiameter = 'location_circular_diameter';
}

@JsonSerializable()
class CoachingTypeDynamic extends Equatable {
  final int? coachingTypeId;
  final String coachingTypeName;
  final int creatingTrainingLimitPerDay;
  final double locationCircularDiameter;

  const CoachingTypeDynamic({
    this.coachingTypeId,
    required this.coachingTypeName,
    required this.creatingTrainingLimitPerDay,
    required this.locationCircularDiameter,
  });

  CoachingTypeDynamic copy({
    int? coachingTypeId,
    String? coachingTypeName,
    int? creatingTrainingLimitPerDay,
    double? locationCircularDiameter,
  }) =>
      CoachingTypeDynamic(
        coachingTypeId: coachingTypeId ?? this.coachingTypeId,
        coachingTypeName: coachingTypeName ?? this.coachingTypeName,
        creatingTrainingLimitPerDay:
            creatingTrainingLimitPerDay ?? this.creatingTrainingLimitPerDay,
        locationCircularDiameter:
            locationCircularDiameter ?? this.locationCircularDiameter,
      );

  factory CoachingTypeDynamic.fromJson(Map<String, dynamic> json) =>
      _$CoachingTypeDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$CoachingTypeDynamicToJson(this);

  @override
  List<Object?> get props => [
        coachingTypeId,
        locationCircularDiameter,
        coachingTypeName,
        creatingTrainingLimitPerDay,
        locationCircularDiameter,
      ];


  @override
  String toString() {
    return 'CoachingTypeDynamic(coachingTypeId: $coachingTypeId, coachingTypeName: $coachingTypeName, creatingTrainingLimitPerDay: $creatingTrainingLimitPerDay, locationCircularDiameter: $locationCircularDiameter)';
  }
}
