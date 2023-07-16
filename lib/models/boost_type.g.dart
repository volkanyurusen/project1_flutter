// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boost_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoostType _$BoostTypeFromJson(Map<String, dynamic> json) => BoostType(
      boostTypeId: json['boost_type_id'] as int?,
      boostName: json['boost_name'] as String,
      boostPrice: double.parse(json['boost_price']),
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

Map<String, dynamic> _$BoostTypeToJson(BoostType instance) => <String, dynamic>{
      'boost_type_id': instance.boostTypeId,
      'boost_name': instance.boostName,
      'boost_price': instance.boostPrice,
      'created_at': instance.createdAt.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
    };
