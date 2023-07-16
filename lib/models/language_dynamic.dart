// import 'package:equatable/equatable.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'language_dynamic.g.dart';

const String tblLanguages = 'tblLanguages';

class LanguageDynamicFields {
  static final List<String> values = [
    languageId,
    languageDetail,
  ];
  static const String languageId = 'language_id';
  static const String languageDetail = 'language_detail';
}

@JsonSerializable()
class LanguageDynamic extends Equatable {
  final int? languageId;
  final String? languageDetail;

  const LanguageDynamic({
    this.languageId,
    this.languageDetail,
  });

  LanguageDynamic copy({
    int? languageId,
    String? languageDetail,
  }) =>
      LanguageDynamic(
        languageId: languageId ?? this.languageId,
        languageDetail: languageDetail ?? this.languageDetail,
      );

  factory LanguageDynamic.fromJson(Map<String, dynamic> json) =>
      _$LanguageDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageDynamicToJson(this);

  @override
  List<Object?> get props => [
        languageId,
        languageDetail,
      ];

  @override
  String toString() {
    return 'tblLanguages(language_id: $languageId, language_detail: $languageDetail)';
  }
}
