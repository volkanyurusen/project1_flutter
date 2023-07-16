// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coaching_boost_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoachingBoostDynamic _$CoachingBoostDynamicFromJson(
        Map<String, dynamic> json) =>
    CoachingBoostDynamic(
      coachingBoostId: json['coaching_boost_id'] as int?,
      coachDynamic:
          CoachDynamic.fromJson(json['coach_id'] as Map<String, dynamic>),
      boostTypeDynamic: BoostTypeDynamic.fromJson(
          json['boost_type_id'] as Map<String, dynamic>),
      discountTypeDynamic: DiscountTypeDynamic.fromJson(
          json['discount_type_id'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoachingBoostDynamicToJson(
        CoachingBoostDynamic instance) =>
    <String, dynamic>{
      'coaching_boost_id': instance.coachingBoostId,
      'coach_id': instance.coachDynamic,
      'boost_type_id': instance.boostTypeDynamic,
      'discount_type_id': instance.discountTypeDynamic,
    };
