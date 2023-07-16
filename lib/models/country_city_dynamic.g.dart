// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_city_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryCityDynamic _$CountryCityDynamicFromJson(Map<String, dynamic> json) =>
    CountryCityDynamic(
      countryCityId: json['country_city_id'] as int?,
      countryDynamic:
          CountryDynamic.fromJson(json['country_id'] as Map<String, dynamic>),
      cityDynamic:
          CityDynamic.fromJson(json['city_id'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CountryCityDynamicToJson(CountryCityDynamic instance) =>
    <String, dynamic>{
      'country_city_id': instance.countryCityId,
      'country_id': instance.countryDynamic,
      'city_id': instance.cityDynamic,
    };
