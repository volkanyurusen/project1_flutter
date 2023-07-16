// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gender_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenderDynamic _$GenderDynamicFromJson(Map<String, dynamic> json) =>
    GenderDynamic(
      genderId: json['gender_id'] as int?,
      genderDetail: json['gender_detail'] as String,
    );

Map<String, dynamic> _$GenderDynamicToJson(GenderDynamic instance) =>
    <String, dynamic>{
      'gender_id': instance.genderId,
      'gender_detail': instance.genderDetail,
    };
