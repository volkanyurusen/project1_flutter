// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_template_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationTemplateDynamic _$LocationTemplateDynamicFromJson(
        Map<String, dynamic> json) =>
    LocationTemplateDynamic(
      locationTemplateId: json['location_template_id'] as int?,
      userDynamic:
          UserDynamic.fromJson(json['user_id'] as Map<String, dynamic>),
      locationDetailDynamic: LocationDetailDynamic.fromJson(
          json['location_detail_id'] as Map<String, dynamic>),
      locationTemplateName: json['location_template_name'] as String,
    );

Map<String, dynamic> _$LocationTemplateDynamicToJson(
        LocationTemplateDynamic instance) =>
    <String, dynamic>{
      'location_template_id': instance.locationTemplateId,
      'user_id': instance.userDynamic,
      'location_detail_id': instance.locationDetailDynamic,
      'location_template_name': instance.locationTemplateName,
    };
