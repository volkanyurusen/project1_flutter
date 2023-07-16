// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'activity_template_dynamic.g.dart';

const String tblActivityTemplates = 'tblactivityTemplates';

class ActivityTemplateDynamicFields {
  static final List<String> values = [
    activityTemplateId,
    userId,
    activityNameId,
    templateName,
  ];
  static const String activityTemplateId = 'activity_template_id';
  static const String userId = 'user_id';
  static const String activityNameId = 'activity_name_id';
  static const String templateName = 'template_name';
}

@JsonSerializable()
class ActivityTemplateDynamic extends Equatable {
  final int? activityTemplateId;
  final UserDynamic userDynamic;
  final ActivityNameDynamic activityNameDynamic;
  final String templateName;

  const ActivityTemplateDynamic({
    this.activityTemplateId,
    required this.userDynamic,
    required this.activityNameDynamic,
    required this.templateName,
  });

  ActivityTemplateDynamic copy({
    int? activityTemplateId,
    UserDynamic? userDynamic,
    ActivityNameDynamic? activityNameDynamic,
    String? templateName,
  }) =>
      ActivityTemplateDynamic(
        activityTemplateId: activityTemplateId ?? this.activityTemplateId,
        userDynamic: userDynamic ?? this.userDynamic,
        activityNameDynamic:
            activityNameDynamic ?? this.activityNameDynamic,
        templateName: templateName ?? this.templateName,
      );

  factory ActivityTemplateDynamic.fromJson(Map<String, dynamic> json) =>
      _$ActivityTemplateDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityTemplateDynamicToJson(this);

  @override
  List<Object?> get props => [
        activityTemplateId,
        userDynamic,
        activityNameDynamic,
        templateName,
      ];

  @override
  String toString() {
    return 'tblActivityTemplates(activity_template_id: $activityTemplateId, user_id: $userDynamic, activity_detail_id: $activityNameDynamic, template_name: $templateName)';
  }
}
