// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'coaching_template_dynamic.g.dart';

const String tblCoachingTemplates = 'tblCoachingTemplates';

class CoachingTemplateDynamicFields {
  static final List<String> values = [
    coachingTemplateId,
    userId,
    trainingDetailId,
    templateName,
  ];
  static const String coachingTemplateId = 'coaching_template_id';
  static const String userId = 'user_id';
  static const String trainingDetailId = 'training_detail_id';
  static const String templateName = 'template_name';
}

@JsonSerializable()
class CoachingTemplateDynamic extends Equatable {
  final int? coachingTemplateId;
  final UserDynamic userDynamic;
  final TrainingDetailDynamic trainingDetailDynamic;
  final String templateName;

  const CoachingTemplateDynamic({
    this.coachingTemplateId,
    required this.userDynamic,
    required this.trainingDetailDynamic,
    required this.templateName,
  });

  CoachingTemplateDynamic copy({
    int? coachingTemplateId,
    UserDynamic? userDynamic,
    TrainingDetailDynamic? trainingDetailDynamic,
    String? templateName,
  }) =>
      CoachingTemplateDynamic(
        coachingTemplateId: coachingTemplateId ?? this.coachingTemplateId,
        userDynamic: userDynamic ?? this.userDynamic,
        trainingDetailDynamic:
            trainingDetailDynamic ?? this.trainingDetailDynamic,
        templateName: templateName ?? this.templateName,
      );

  factory CoachingTemplateDynamic.fromJson(Map<String, dynamic> json) =>
      _$CoachingTemplateDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$CoachingTemplateDynamicToJson(this);

  @override
  List<Object?> get props => [
        coachingTemplateId,
        userDynamic,
        trainingDetailDynamic,
        templateName,
      ];

  @override
  String toString() {
    return 'tblCoachingTemplates(coaching_template_id: $coachingTemplateId, coach_id: $userDynamic, training_detail_id: $trainingDetailDynamic, template_name: $templateName)';
  }
}
