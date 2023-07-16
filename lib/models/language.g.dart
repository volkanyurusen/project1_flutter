// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Language _$LanguageFromJson(Map<String, dynamic> json) => Language(
      languageId: json[LanguageFields.languageId] as int?,
      languageDetail: json[LanguageFields.languageDetail] as String?,
      createdAt: json[LanguageFields.createdAt] == null
          ? null
          : DateTime.parse(json[LanguageFields.createdAt] as String),
      deactivatedAt: json[LanguageFields.deactivatedAt] == null
          ? null
          : DateTime.parse(json[LanguageFields.deactivatedAt] as String),
      updatedAt: json[LanguageFields.updatedAt] == null
          ? null
          : DateTime.parse(json[LanguageFields.updatedAt] as String),
      isActive: json[LanguageFields.isActive] as bool? ?? true,
    );

Map<String, dynamic> _$LanguageToJson(Language instance) => <String, dynamic>{
      LanguageFields.languageId: instance.languageId,
      LanguageFields.languageDetail: instance.languageDetail,
      LanguageFields.createdAt: instance.createdAt.toIso8601String(),
      LanguageFields.deactivatedAt: instance.deactivatedAt?.toIso8601String(),
      LanguageFields.updatedAt: instance.updatedAt?.toIso8601String(),
      LanguageFields.isActive: instance.isActive,
    };
