// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_language_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLanguageDynamic _$UserLanguageDynamicFromJson(Map<String, dynamic> json) =>
    UserLanguageDynamic(
      userLanguageId: json['user_language_id'] as int?,
      userDynamic:
          UserDynamic.fromJson(json['user_id'] as Map<String, dynamic>),
      languageDynamic:
          LanguageDynamic.fromJson(json['language_id'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserLanguageDynamicToJson(
        UserLanguageDynamic instance) =>
    <String, dynamic>{
      'user_language_id': instance.userLanguageId,
      'user_id': instance.userDynamic,
      'language_id': instance.languageDynamic,
    };
