// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_detail_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationDetailDynamic _$LocationDetailDynamicFromJson(
        Map<String, dynamic> json) =>
    LocationDetailDynamic(
      locationDetailId: json['location_detail_id'] as int?,
      prefferedLocationCircularDiameter:
          double.parse(json['preffered_location_circular_diameter']),
      membershipMaxDiameter: double.parse(json['membership_max_diameter']),
      lat: double.parse(json['lat']),
      lon: double.parse(json['lon']),
    );

Map<String, dynamic> _$LocationDetailDynamicToJson(
        LocationDetailDynamic instance) =>
    <String, dynamic>{
      'location_detail_id': instance.locationDetailId,
      'preffered_location_circular_diameter':
          instance.prefferedLocationCircularDiameter,
      'membership_max_diameter': instance.membershipMaxDiameter,
      'lat': instance.lat,
      'lon': instance.lon,
    };


// LocationDetailDynamic _$LocationDetailDynamicFromJson(
//         Map<String, dynamic> json) =>
//     LocationDetailDynamic(
//       locationDetailId: json['location_detail_id'] as int?,
//       prefferedLocationCircularDiameter:
//           (json['preffered_location_circular_diameter'] as num?)?.toDouble() ??
//               3.00,
//       membershipMaxDiameter:
//           (json['membership_max_diameter'] as num?)?.toDouble() ?? 3.00,
//     );

// Map<String, dynamic> _$LocationDetailDynamicToJson(
//         LocationDetailDynamic instance) =>
//     <String, dynamic>{
//       'location_detail_id': instance.locationDetailId,
//       'preffered_location_circular_diameter':
//           instance.prefferedLocationCircularDiameter,
//       'membership_max_diameter': instance.membershipMaxDiameter,
//     };