// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membership_type_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MembershipTypeDynamic _$MembershipTypeDynamicFromJson(
        Map<String, dynamic> json) =>
    MembershipTypeDynamic(
      membershipTypeId: json['membership_type_id'] as int?,
      membershipTypeName: json['membership_type_name'] as String,
      limitOfCreatingActivityPerDay:
          json['limit_of_creating_activity_per_day'] as int,
      limitOfAttendancePerDay: json['limit_of_attendance_per_day'] as int,
      locationCircularDiameter:
          double.parse(json['location_circular_diameter']),
      templateLimit: json['template_limit'] as int,
    );

Map<String, dynamic> _$MembershipTypeDynamicToJson(
        MembershipTypeDynamic instance) =>
    <String, dynamic>{
      'membership_type_id': instance.membershipTypeId,
      'membership_type_name': instance.membershipTypeName,
      'limit_of_creating_activity_per_day':
          instance.limitOfCreatingActivityPerDay,
      'limit_of_attendance_per_day': instance.limitOfAttendancePerDay,
      'location_circular_diameter': instance.locationCircularDiameter,
      'template_limit': instance.templateLimit,
    };
