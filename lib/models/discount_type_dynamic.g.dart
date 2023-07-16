// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_type_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscountTypeDynamic _$DiscountTypeDynamicFromJson(Map<String, dynamic> json) =>
    DiscountTypeDynamic(
      discountTypeId: json['discount_type_id'] as int?,
      discountName: json['discount_name'] as String,
      discountRate: (json['discount_rate'] as num).toDouble(),
    );

Map<String, dynamic> _$DiscountTypeDynamicToJson(
        DiscountTypeDynamic instance) =>
    <String, dynamic>{
      'discount_type_id': instance.discountTypeId,
      'discount_name': instance.discountName,
      'discount_rate': instance.discountRate,
    };
