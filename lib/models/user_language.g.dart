// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLanguage _$UserLanguageFromJson(Map<String, dynamic> json) => UserLanguage(
      userLanguageId: json['user_language_id'] as int?,
      user: User.fromJson(json['user_id'] as Map<String, dynamic>),
      language: Language.fromJson(json['language_id'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      deactivatedAt: json['deactivated_at'] == null
          ? null
          : DateTime.parse(json['deactivated_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      isActive: json['is_active'] as bool? ?? true,
    );

Map<String, dynamic> _$UserLanguageToJson(UserLanguage instance) =>
    <String, dynamic>{
      'user_language_id': instance.userLanguageId,
      'user_id': instance.user,
      'language_id': instance.language,
      'created_at': instance.createdAt.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
    };
