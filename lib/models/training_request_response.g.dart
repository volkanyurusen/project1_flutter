// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_request_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingRequestResponse _$TrainingRequestResponseFromJson(
        Map<String, dynamic> json) =>
    TrainingRequestResponse(
      trainingRequestResponseId: json['training_request_response_id'] as int?,
      trainingRequestId: json['training_request_id'] as int,
      coachId: json['coach_id'] as int,
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

Map<String, dynamic> _$TrainingRequestResponseToJson(
        TrainingRequestResponse instance) =>
    <String, dynamic>{
      'training_request_response_id': instance.trainingRequestResponseId,
      'training_request_id': instance.trainingRequestId,
      'coach_id': instance.coachId,
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
