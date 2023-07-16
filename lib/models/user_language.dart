// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:my_project/models/models.dart';

part 'user_language.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblUserLanguages = 'tblUserLanguages';

class UserLanguageFields {
  static final List<String> values = [
    /// Add all fields here
    userLanguageId, userId, languageId, createdAt, deactivatedAt, updatedAt,
    isActive,
  ];

  static const String userLanguageId = 'user_language_id';
  static const String userId = 'user_id';
  static const String languageId = 'language_id';
  static const String createdAt = 'created_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

/// This table demonstrates the languages which users are able to speak
///
// @JsonSerializable()
class UserLanguage extends Equatable {
  final int? userLanguageId;
  final User user;
  final Language language;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  UserLanguage({
    this.userLanguageId,
    required this.user,
    required this.language,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : createdAt = createdAt ?? DateTime.now();

  UserLanguage copy({
    int? userLanguageId,
    User? user,
    Language? language,
    DateTime? createdAt,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      UserLanguage(
        userLanguageId: userLanguageId ?? this.userLanguageId,
        user: user ?? this.user,
        language: language ?? this.language,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory UserLanguage.fromJson(Map<String, dynamic> json) =>
      _$UserLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$UserLanguageToJson(this);

  @override
  List<Object?> get props => [
        userLanguageId,
        user,
        language,
        createdAt,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblUserLanguages(user_language_id: $userLanguageId, user_id: $user, language_id: $language, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}
