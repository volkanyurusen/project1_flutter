// import 'package:equatable/equatable.dart';
import 'package:equatable/equatable.dart';

part 'language.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblLanguages = 'tblLanguages';

class LanguageFields {
  static final List<String> values = [
    /// Add all fields here
    languageId, languageDetail, createdAt, deactivatedAt, updatedAt, isActive,
  ];

  static const String languageId = 'language_id';
  static const String languageDetail = 'language_detail';
  static const String createdAt = 'created_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

/// language was created for being displayed the spoken languages by Users
// @JsonSerializable()
class Language extends Equatable {
  final int? languageId;
  final String? languageDetail;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  Language({
    this.languageId,
    this.languageDetail,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : createdAt = createdAt ?? DateTime.now();

  Language copy({
    int? languageId,
    String? languageDetail,
    DateTime? createdAt,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      Language(
        languageId: languageId ?? this.languageId,
        languageDetail: languageDetail ?? this.languageDetail,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageToJson(this);

  @override
  List<Object?> get props => [
        languageId,
        languageDetail,
        createdAt,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblLanguages(language_id: $languageId, language_detail: $languageDetail, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}
