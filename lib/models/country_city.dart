// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

import 'package:my_project/models/models.dart';

part 'country_city.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblCountryCities = 'tblCountryCities';

class CountryCityFields {
  static final List<String> values = [
    /// Add all fields here
    countryCityId, countryId, cityId, createdAt, deactivatedAt,
    updatedAt, isActive,
  ];

  static const String countryCityId = 'country_city_id';
  static const String countryId = 'country_id';
  static const String cityId = 'city_id';
  static const String createdAt = 'created_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

// @JsonSerializable()
class CountryCity extends Equatable {
  final int? countryCityId;
  final Country country;
  final City city;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  CountryCity({
    this.countryCityId,
    required this.country,
    required this.city,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = false,
  }) : createdAt = createdAt ?? DateTime.now();

  CountryCity copy({
    int? countryCityId,
    Country? country,
    City? city,
    DateTime? createdAt,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      CountryCity(
        countryCityId: countryCityId ?? this.countryCityId,
        country: country ?? this.country,
        city: city ?? this.city,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory CountryCity.fromJson(Map<String, dynamic> json) =>
      _$CountryCityFromJson(json);

  Map<String, dynamic> toJson() => _$CountryCityToJson(this);

  @override
  List<Object?> get props => [
        countryCityId,
        country,
        city,
        createdAt,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblCountryCities(country_city_id: $countryCityId, country_id: $country, city_id: $city, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}

// CountryCity fromMap(Map<String, dynamic> json) => CountryCity(
//       countryCityId: json[CountryCityFields.countryCityId] as int?,
//       countryId: json[CountryCityFields.countryId] as int,
//       cityId: json[CountryCityFields.cityId] as int,
//       createdAt: DateTime.parse(json[CountryCityFields.createdAt] as String),
//       deactivatedAt:
//           DateTime.parse(json[CountryCityFields.deactivatedAt] as String),
//       updatedAt: DateTime.parse(json[CountryCityFields.updatedAt] as String),
//       isActive: json[CountryCityFields.isActive] == 1,
//     );

// Map<String, dynamic> toMap() => {
//       CountryCityFields.countryCityId: countryCityId,
//       CountryCityFields.countryId: countryId,
//       CountryCityFields.cityId: cityId,
//       CountryCityFields.createdAt: createdAt.toIso8601String(),
//       CountryCityFields.deactivatedAt: deactivatedAt?.toIso8601String(),
//       CountryCityFields.updatedAt: updatedAt?.toIso8601String(),
//       CountryCityFields.isActive: isActive ? 1 : 0,
//     };

Map<String, dynamic> exampleCountryCity = {
  "country_city_id": 2,
  "country_id": {
    "country_id": 1,
    "country_detail": "Germany",
    "created_at": "2022-08-06T20:02:07.383518Z",
    "deactivated_at": null,
    "updated_at": null,
    "is_active": true
  },
  "city_id": {
    "city_id": 2,
    "city_detail": "Hamburg",
    "created_at": "2022-08-06T20:13:55.602388Z",
    "deactivated_at": null,
    "updated_at": null,
    "is_active": true
  },
  "created_at": "2022-08-06T20:25:49.991424Z",
  "deactivated_at": null,
  "updated_at": null,
  "is_active": true
};
