// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coaching_template_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoachingTemplateDynamic _$CoachingTemplateDynamicFromJson(
        Map<String, dynamic> json) =>
    CoachingTemplateDynamic(
      coachingTemplateId: json['coaching_template_id'] as int?,
      userDynamic:
          UserDynamic.fromJson(json['user_id'] as Map<String, dynamic>),
      trainingDetailDynamic: TrainingDetailDynamic.fromJson(
          json['training_detail_id'] as Map<String, dynamic>),
      templateName: json['template_name'] as String,
    );

Map<String, dynamic> _$CoachingTemplateDynamicToJson(
        CoachingTemplateDynamic instance) =>
    <String, dynamic>{
      'coaching_template_id': instance.coachingTemplateId,
      'user_id': instance.userDynamic,
      'training_detail_id': instance.trainingDetailDynamic,
      'template_name': instance.templateName,
    };
