// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coaching_location_detail_dynamic.g.dart';

const String tblCoachingLocationDetails = 'tblCoachingLocationDetails';

class CoachingLocationDetailDynamicFields {
  static final List<String> values = [
    coachingLocationDetailId, prefferedLocationCircularDiameter,
    coachingMaxDiameter,
  ];
  static const String coachingLocationDetailId = 'coaching_location_detail_id';
  static const String prefferedLocationCircularDiameter =
      'preffered_location_circular_diameter';
  static const String coachingMaxDiameter = 'coaching_max_diameter';
}

@JsonSerializable()
class CoachingLocationDetailDynamic extends Equatable {
  final int? coachingLocationDetailId;
  final double prefferedLocationCircularDiameter;
  final double
      coachingMaxDiameter; // This can change with Membership's max diameter

  const CoachingLocationDetailDynamic({
    this.coachingLocationDetailId,
    this.prefferedLocationCircularDiameter = 3.00,
    this.coachingMaxDiameter = 3.00,
  });

  CoachingLocationDetailDynamic copy({
    int? coachingLocationDetailId,
    double? prefferedLocationCircularDiameter,
    double? coachingMaxDiameter,
  }) =>
      CoachingLocationDetailDynamic(
        coachingLocationDetailId:
            coachingLocationDetailId ?? this.coachingLocationDetailId,
        prefferedLocationCircularDiameter: prefferedLocationCircularDiameter ??
            this.prefferedLocationCircularDiameter,
        coachingMaxDiameter: coachingMaxDiameter ?? this.coachingMaxDiameter,
      );

  factory CoachingLocationDetailDynamic.fromJson(Map<String, dynamic> json) =>
      _$CoachingLocationDetailDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$CoachingLocationDetailDynamicToJson(this);

  @override
  List<Object?> get props => [
        coachingLocationDetailId,
        prefferedLocationCircularDiameter,
        coachingMaxDiameter,
      ];

  @override
  String toString() {
    return 'tblCoachingLocationDetails(coaching_location_detail_id: $coachingLocationDetailId, preffered_location_circular_diameter: $prefferedLocationCircularDiameter, coaching_max_diameter: $coachingMaxDiameter)';
  }
}
