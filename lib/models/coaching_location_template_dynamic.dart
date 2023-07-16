// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'coaching_location_template_dynamic.g.dart';

const String tblCoachingLocationTemplates = 'tblCoachingLocationTemplates';

class CoachingLocationTemplateDynamicFields {
  static final List<String> values = [
    coachingLocationTemplateId,
    coachId,
    coachingLocationDetailId,
    coachingLocationTemplateName,
  ];
  static const String coachingLocationTemplateId =
      'coaching_location_template_id';
  static const String coachId = 'coach_id';
  static const String coachingLocationDetailId = 'coaching_location_detail_id';
  static const String coachingLocationTemplateName =
      'coaching_location_template_name';
}

@JsonSerializable()
class CoachingLocationTemplateDynamic extends Equatable {
  final int? coachingLocationTemplateId;
  final CoachDynamic coachDynamic;
  final CoachingLocationDetailDynamic coachingLocationDetailDynamic;
  final String coachingLocationTemplateName;

  const CoachingLocationTemplateDynamic({
    this.coachingLocationTemplateId,
    required this.coachDynamic,
    required this.coachingLocationDetailDynamic,
    required this.coachingLocationTemplateName,
  });

  CoachingLocationTemplateDynamic copy({
    int? coachingLocationTemplateId,
    CoachDynamic? coachDynamic,
    CoachingLocationDetailDynamic? coachingLocationDetailDynamic,
    String? coachingLocationTemplateName,
  }) =>
      CoachingLocationTemplateDynamic(
        coachingLocationTemplateId:
            coachingLocationTemplateId ?? this.coachingLocationTemplateId,
        coachDynamic: coachDynamic ?? this.coachDynamic,
        coachingLocationDetailDynamic:
            coachingLocationDetailDynamic ?? this.coachingLocationDetailDynamic,
        coachingLocationTemplateName:
            coachingLocationTemplateName ?? this.coachingLocationTemplateName,
      );

  factory CoachingLocationTemplateDynamic.fromJson(Map<String, dynamic> json) =>
      _$CoachingLocationTemplateDynamicFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CoachingLocationTemplateDynamicToJson(this);

  @override
  List<Object?> get props => [
        coachingLocationTemplateId,
        coachDynamic,
        coachingLocationDetailDynamic,
        coachingLocationTemplateName,
      ];

  @override
  String toString() {
    return 'tblCoachingLocationTemplates(coaching_location_template_id: $coachingLocationTemplateId, coach_id: $coachDynamic, coaching_location_detail_id: $coachingLocationDetailDynamic, coaching_location_template_name: $coachingLocationTemplateName)';
  }
}
