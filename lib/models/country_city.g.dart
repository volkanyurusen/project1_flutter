// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryCity _$CountryCityFromJson(Map<String, dynamic> json) => CountryCity(
      countryCityId: json['country_city_id'] as int?,
      country: Country.fromJson(json['country_id'] as Map<String, dynamic>),
      city: City.fromJson(json['city_id'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      deactivatedAt: json['deactivated_at'] == null
          ? null
          : DateTime.parse(json['deactivated_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      isActive: json['is_active'] as bool? ?? false,
    );

Map<String, dynamic> _$CountryCityToJson(CountryCity instance) =>
    <String, dynamic>{
      'country_city_id': instance.countryCityId,
      'country_id': instance.country,
      'city_id': instance.city,
      'created_at': instance.createdAt.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
    };
