// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consisted_activity_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsistedActivityDynamic _$ConsistedActivityDynamicFromJson(
        Map<String, dynamic> json) =>
    ConsistedActivityDynamic(
      consistedActivityId: json['consisted_activity_id'] as int?,
      createdActivityDynamic: CreatedActivityDynamic.fromJson(
          json['created_activity_id'] as Map<String, dynamic>),
      attendee:
          UserDynamic.fromJson(json['attendee_id'] as Map<String, dynamic>),
      processDetailDynamic: ProcessDetailDynamic.fromJson(
          json['process_detail_id'] as Map<String, dynamic>),
      requestDate: json['request_date'] == null
          ? null
          : DateTime.parse(json['request_date'] as String),
      approvedDate: json['approved_date'] == null
          ? null
          : DateTime.parse(json['approved_date'] as String),
      deniedDate: json['denied_date'] == null
          ? null
          : DateTime.parse(json['denied_date'] as String),
      recalledDate: json['recalled_date'] == null
          ? null
          : DateTime.parse(json['recalled_date'] as String),
      updatedDate: json['updated_date'] == null
          ? null
          : DateTime.parse(json['updated_date'] as String),
      isDenied: json['is_denied'] as bool? ?? false,
      isApproved: json['is_approved'] as bool? ?? false,
    );

Map<String, dynamic> _$ConsistedActivityDynamicToJson(
        ConsistedActivityDynamic instance) =>
    <String, dynamic>{
      'consisted_activity_id': instance.consistedActivityId,
      'created_activity_id': instance.createdActivityDynamic,
      'attendee_id': instance.attendee,
      'process_detail_id': instance.processDetailDynamic,
      'request_date': instance.requestDate.toIso8601String(),
      'approved_date': instance.approvedDate?.toIso8601String(),
      'denied_date': instance.deniedDate?.toIso8601String(),
      'recalled_date': instance.recalledDate?.toIso8601String(),
      'updated_date': instance.updatedDate?.toIso8601String(),
      'is_denied': instance.isDenied,
      'is_approved': instance.isApproved,
    };
