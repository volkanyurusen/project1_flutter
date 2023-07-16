// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_detail_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingDetailDynamic _$TrainingDetailDynamicFromJson(
        Map<String, dynamic> json) =>
    TrainingDetailDynamic(
      trainingDetailId: json['training_detail_id'] as int?,
      activityNameDynamic: ActivityNameDynamic.fromJson(
          json['activity_name_id'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrainingDetailDynamicToJson(
        TrainingDetailDynamic instance) =>
    <String, dynamic>{
      'training_detail_id': instance.trainingDetailId,
      'activity_name_id': instance.activityNameDynamic,
    };
