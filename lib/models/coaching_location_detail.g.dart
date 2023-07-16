// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coaching_location_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoachingLocationDetail _$CoachingLocationDetailFromJson(
        Map<String, dynamic> json) =>
    CoachingLocationDetail(
      coachingLocationDetailId: json['coaching_location_detail_id'] as int?,
      prefferedLocationCircularDiameter:
          (json['preffered_location_circular_diameter'] as num?)?.toDouble() ??
              3.00,
      coachingMaxDiameter:
          (json['coaching_max_diameter'] as num?)?.toDouble() ?? 3.00,
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

Map<String, dynamic> _$CoachingLocationDetailToJson(
        CoachingLocationDetail instance) =>
    <String, dynamic>{
      'coaching_location_detail_id': instance.coachingLocationDetailId,
      'preffered_location_circular_diameter':
          instance.prefferedLocationCircularDiameter,
      'coaching_max_diameter': instance.coachingMaxDiameter,
      'lat': instance.lat,
      'lon': instance.lon,
      'created_at': instance.createdAt.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
    };
