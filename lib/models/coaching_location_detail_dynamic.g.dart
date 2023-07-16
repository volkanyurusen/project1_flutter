// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coaching_location_detail_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoachingLocationDetailDynamic _$CoachingLocationDetailDynamicFromJson(
        Map<String, dynamic> json) =>
    CoachingLocationDetailDynamic(
      coachingLocationDetailId: json['coaching_location_detail_id'] as int?,
      prefferedLocationCircularDiameter:
          double.parse(json['preffered_location_circular_diameter']),
      coachingMaxDiameter: double.parse(json['coaching_max_diameter']),
    );

Map<String, dynamic> _$CoachingLocationDetailDynamicToJson(
        CoachingLocationDetailDynamic instance) =>
    <String, dynamic>{
      'coaching_location_detail_id': instance.coachingLocationDetailId,
      'preffered_location_circular_diameter':
          instance.prefferedLocationCircularDiameter,
      'coaching_max_diameter': instance.coachingMaxDiameter,
    };
