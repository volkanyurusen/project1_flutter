// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProcessDetail _$ProcessDetailFromJson(Map<String, dynamic> json) =>
    ProcessDetail(
      processDetailId: json['process_detail_id'] as int?,
      processName: json['process_name'] as String,
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

Map<String, dynamic> _$ProcessDetailToJson(ProcessDetail instance) =>
    <String, dynamic>{
      'process_detail_id': instance.processDetailId,
      'process_name': instance.processName,
      'created_at': instance.createdAt.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
    };
