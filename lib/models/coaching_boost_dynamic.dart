// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'coaching_boost_dynamic.g.dart';

const String tblCoachingBoosts = 'tblCoachingBoosts';

class CoachingBoostDynamicFields {
  static final List<String> values = [
    coachingBoostId,
    coachId,
    boostTypeId,
    discountTypeId,
  ];
  static const String coachingBoostId = 'coaching_boost_id';
  static const String coachId = 'coach_id';
  static const String boostTypeId = 'boost_type_id';
  static const String discountTypeId = 'discount_type_id';
}

@JsonSerializable()
class CoachingBoostDynamic extends Equatable {
  final int? coachingBoostId;
  final CoachDynamic coachDynamic;
  final BoostTypeDynamic boostTypeDynamic;
  final DiscountTypeDynamic discountTypeDynamic;

  const CoachingBoostDynamic(
      {this.coachingBoostId,
      required this.coachDynamic,
      required this.boostTypeDynamic,
      required this.discountTypeDynamic});

  CoachingBoostDynamic copy({
    int? coachingBoostId,
    CoachDynamic? coachDynamic,
    BoostTypeDynamic? boostTypeDynamic,
    DiscountTypeDynamic? discountTypeDynamic,
  }) =>
      CoachingBoostDynamic(
        coachingBoostId: coachingBoostId ?? this.coachingBoostId,
        coachDynamic: coachDynamic ?? this.coachDynamic,
        boostTypeDynamic: boostTypeDynamic ?? this.boostTypeDynamic,
        discountTypeDynamic: discountTypeDynamic ?? this.discountTypeDynamic,
      );

  factory CoachingBoostDynamic.fromJson(Map<String, dynamic> json) =>
      _$CoachingBoostDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$CoachingBoostDynamicToJson(this);

  @override
  List<Object?> get props => [
        coachingBoostId,
        coachDynamic,
        boostTypeDynamic,
        discountTypeDynamic,
      ];

  @override
  String toString() {
    return 'tblCoachingBoosts(coaching_boost_id: $coachingBoostId, coach_id: $coachDynamic, boost_type_id: $boostTypeDynamic, discount_type_id: $discountTypeDynamic)';
  }
}
