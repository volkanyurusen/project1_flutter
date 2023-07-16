// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationDetail _$LocationDetailFromJson(Map<String, dynamic> json) =>
    LocationDetail(
      locationDetailId: json['location_detail_id'] as int?,
      prefferedLocationCircularDiameter:
          (json['preffered_location_circular_diameter'] as num?)?.toDouble() ??
              3.00,
      membershipMaxDiameter:
          (json['membership_max_diameter'] as num?)?.toDouble() ?? 3.00,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
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

Map<String, dynamic> _$LocationDetailToJson(LocationDetail instance) =>
    <String, dynamic>{
      'location_detail_id': instance.locationDetailId,
      'preffered_location_circular_diameter':
          instance.prefferedLocationCircularDiameter,
      'membership_max_diameter': instance.membershipMaxDiameter,
      'lat': instance.lat,
      'lon': instance.lon,
      'created_at': instance.createdAt.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
    };
