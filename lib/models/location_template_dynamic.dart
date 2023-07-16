// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'location_template_dynamic.g.dart';

const String tblLocationTemplates = 'tblLocationTemplates';

class LocationTemplateDynamicFields {
  static final List<String> values = [
    locationTemplateId,
    userId,
    locationDetailId,
    locationTemplateName,
  ];

  static const String locationTemplateId = 'location_template_id';
  static const String userId = 'user_id';
  static const String locationDetailId = 'location_detail_id';
  static const String locationTemplateName = 'location_template_name';
}

@JsonSerializable()
class LocationTemplateDynamic extends Equatable {
  final int? locationTemplateId;
  final UserDynamic userDynamic;
  final LocationDetailDynamic locationDetailDynamic;
  final String locationTemplateName;

  const LocationTemplateDynamic({
    this.locationTemplateId,
    required this.userDynamic,
    required this.locationDetailDynamic,
    required this.locationTemplateName,
  });

  LocationTemplateDynamic copy({
    int? locationTemplateId,
    UserDynamic? userDynamic,
    LocationDetailDynamic? locationDetailDynamic,
    String? locationTemplateName,
  }) =>
      LocationTemplateDynamic(
        locationTemplateId: locationTemplateId ?? this.locationTemplateId,
        userDynamic: userDynamic ?? this.userDynamic,
        locationDetailDynamic:
            locationDetailDynamic ?? this.locationDetailDynamic,
        locationTemplateName: locationTemplateName ?? this.locationTemplateName,
      );

  factory LocationTemplateDynamic.fromJson(Map<String, dynamic> json) =>
      _$LocationTemplateDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$LocationTemplateDynamicToJson(this);

  @override
  List<Object?> get props => [
        locationTemplateId,
        userDynamic,
        locationDetailDynamic,
        locationTemplateName,
      ];

  @override
  String toString() {
    return 'tblLocationTemplates(location_template_id: $locationTemplateId, user_id: $userDynamic, location_detail_id: $locationDetailDynamic, location_template_name: $locationTemplateName)';
  }
}
