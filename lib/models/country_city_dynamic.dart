// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'country_city_dynamic.g.dart';

const String tblCountryCities = 'tblCountryCities';

class CountryCityDynamicFields {
  static final List<String> values = [
    /// Add all fields here
    countryCityId, countryId, cityId,
  ];
  static const String countryCityId = 'country_city_id';
  static const String countryId = 'country_id';
  static const String cityId = 'city_id';
}

// @JsonSerializable()
class CountryCityDynamic extends Equatable {
  final int? countryCityId;
  final CountryDynamic countryDynamic;
  final CityDynamic cityDynamic;

  const CountryCityDynamic({
    this.countryCityId,
    required this.countryDynamic,
    required this.cityDynamic,
  });

  CountryCityDynamic copy({
    int? countryCityId,
    CountryDynamic? countryDynamic,
    CityDynamic? cityDynamic,
  }) =>
      CountryCityDynamic(
        countryCityId: countryCityId ?? this.countryCityId,
        countryDynamic: countryDynamic ?? this.countryDynamic,
        cityDynamic: cityDynamic ?? this.cityDynamic,
      );

  factory CountryCityDynamic.fromJson(Map<String, dynamic> json) =>
      _$CountryCityDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$CountryCityDynamicToJson(this);

  @override
  List<Object?> get props => [
        countryCityId,
        countryDynamic,
        cityDynamic,
      ];

  @override
  String toString() {
    return 'tblCountryCities(country_city_id: $countryCityId, country_id: $countryDynamic, city_id: $cityDynamic';
  }
}
