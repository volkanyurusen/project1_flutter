// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'user_language_dynamic.g.dart';

const String tblUserLanguages = 'tblUserLanguages';

class UserLanguageDynamicFields {
  static final List<String> values = [
    /// Add all fields here
    userLanguageId, userId, languageId,
  ];
  static const String userLanguageId = 'user_language_id';
  static const String userId = 'user_id';
  static const String languageId = 'language_id';
}

@JsonSerializable()
class UserLanguageDynamic extends Equatable {
  final int? userLanguageId;
  final UserDynamic userDynamic;
  final LanguageDynamic languageDynamic;

  const UserLanguageDynamic({
    this.userLanguageId,
    required this.userDynamic,
    required this.languageDynamic,
  });

  UserLanguageDynamic copy({
    int? userLanguageId,
    UserDynamic? userDynamic,
    LanguageDynamic? languageDynamic,
  }) =>
      UserLanguageDynamic(
        userLanguageId: userLanguageId ?? this.userLanguageId,
        userDynamic: userDynamic ?? this.userDynamic,
        languageDynamic: languageDynamic ?? this.languageDynamic,
      );

  factory UserLanguageDynamic.fromJson(Map<String, dynamic> json) =>
      _$UserLanguageDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$UserLanguageDynamicToJson(this);

  @override
  List<Object?> get props => [
        userLanguageId,
        userDynamic,
        languageDynamic,
      ];

  @override
  String toString() {
    return 'tblUserLanguages(user_language_id: $userLanguageId, user_id: $userDynamic, language_id: $languageDynamic';
  }
}
