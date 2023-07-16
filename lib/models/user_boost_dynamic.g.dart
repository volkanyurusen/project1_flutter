// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_boost_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBoostDynamic _$UserBoostDynamicFromJson(Map<String, dynamic> json) =>
    UserBoostDynamic(
      userBoostId: json['user_boost_id'] as int?,
      userDynamic:
          UserDynamic.fromJson(json['user_id'] as Map<String, dynamic>),
      boostTypeDynamic: BoostTypeDynamic.fromJson(
          json['boost_type_id'] as Map<String, dynamic>),
      discountTypeDynamic: DiscountTypeDynamic.fromJson(
          json['discount_type_id'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserBoostDynamicToJson(UserBoostDynamic instance) =>
    <String, dynamic>{
      'user_boost_id': instance.userBoostId,
      'user_id': instance.userDynamic,
      'boost_type_id': instance.boostTypeDynamic,
      'discount_type_id': instance.discountTypeDynamic,
    };
