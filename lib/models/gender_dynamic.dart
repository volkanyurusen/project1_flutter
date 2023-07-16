// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gender_dynamic.g.dart';

const String tblGenders = 'tblGenders';

class GenderDynamicFields {
  static final List<String> values = [
    /// Add all fields here
    genderId, genderDetail
  ];
  static const String genderId = 'gender_id';
  static const String genderDetail = 'gender_detail';
}

@JsonSerializable()
class GenderDynamic extends Equatable {
  final int? genderId;
  final String genderDetail;

  const GenderDynamic({
    this.genderId,
    required this.genderDetail,
  });

  GenderDynamic copy({
    int? genderId,
    String? genderDetail,
  }) =>
      GenderDynamic(
        genderId: genderId ?? this.genderId,
        genderDetail: genderDetail ?? this.genderDetail,
      );

  factory GenderDynamic.fromJson(Map<String, dynamic> json) =>
      _$GenderDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$GenderDynamicToJson(this);

  @override
  List<Object?> get props => [
        genderId,
        genderDetail,
      ];

  @override
  String toString() {
    return 'tblGenders(gender_id: $genderId, gender_detail: $genderDetail)';
  }
}
