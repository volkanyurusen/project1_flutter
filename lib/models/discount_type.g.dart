// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscountType _$DiscountTypeFromJson(Map<String, dynamic> json) => DiscountType(
      discountTypeId: json['discount_type_id'] as int?,
      discountName: json['discount_name'] as String,
      discountRate: (json['discount_rate'] as num).toDouble(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      deactivatedAt: json['deactivated_at'] == null
          ? null
          : DateTime.parse(json['deactivated_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      isActive: json['is_active'] as bool? ?? true,
    );

Map<String, dynamic> _$DiscountTypeToJson(DiscountType instance) =>
    <String, dynamic>{
      'discount_type_id': instance.discountTypeId,
      'discount_name': instance.discountName,
      'discount_rate': instance.discountRate,
      'created_at': instance.createdAt.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
    };
