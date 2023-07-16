// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_template_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityTemplateDynamic _$ActivityTemplateDynamicFromJson(
        Map<String, dynamic> json) =>
    ActivityTemplateDynamic(
      activityTemplateId: json['activity_template_id'] as int?,
      userDynamic:
          UserDynamic.fromJson(json['user_id'] as Map<String, dynamic>),
      activityNameDynamic: ActivityNameDynamic.fromJson(
          json['activity_name_id'] as Map<String, dynamic>),
      templateName: json['template_name'] as String,
    );

Map<String, dynamic> _$ActivityTemplateDynamicToJson(
        ActivityTemplateDynamic instance) =>
    <String, dynamic>{
      'activity_template_id': instance.activityTemplateId,
      'user_id': instance.userDynamic,
      'activity_name_id': instance.activityNameDynamic,
      'template_name': instance.templateName,
    };
