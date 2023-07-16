// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consisted_activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsistedActivity _$ConsistedActivityFromJson(Map<String, dynamic> json) =>
    ConsistedActivity(
      consistedActivityId: json['consisted_activity_id'] as int?,
      createdActivityId: json['created_activity_id'] as int,
      attendeeId: json['attendee_id'] as int,
      processDetailId: json['process_detail_id'] as int,
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
      isActive: json['is_active'] as bool? ?? true,
    );

Map<String, dynamic> _$ConsistedActivityToJson(ConsistedActivity instance) =>
    <String, dynamic>{
      'consisted_activity_id': instance.consistedActivityId,
      'created_activity_id': instance.createdActivityId,
      'attendee_id': instance.attendeeId,
      'process_detail_id': instance.processDetailId,
      'request_date': instance.requestDate.toIso8601String(),
      'approved_date': instance.approvedDate?.toIso8601String(),
      'denied_date': instance.deniedDate?.toIso8601String(),
      'recalled_date': instance.recalledDate?.toIso8601String(),
      'updated_date': instance.updatedDate?.toIso8601String(),
      'is_denied': instance.isDenied,
      'is_approved': instance.isApproved,
      'is_active': instance.isActive,
    };
