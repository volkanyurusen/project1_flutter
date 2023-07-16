// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boost_type_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoostTypeDynamic _$BoostTypeDynamicFromJson(Map<String, dynamic> json) =>
    BoostTypeDynamic(
      boostTypeId: json['boost_type_id'] as int?,
      boostName: json['boost_name'] as String,
      boostPrice: json['boost_price'] as int,
    );

Map<String, dynamic> _$BoostTypeDynamicToJson(BoostTypeDynamic instance) =>
    <String, dynamic>{
      'boost_type_id': instance.boostTypeId,
      'boost_name': instance.boostName,
      'boost_price': instance.boostPrice,
    };
