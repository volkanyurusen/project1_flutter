// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_dynamic.g.dart';

const String tblCountries = 'tblCountries';

class CountryDynamicFields {
  static final List<String> values = [countryId, countryDetail];
  static const String countryId = 'country_id';
  static const String countryDetail = 'country_detail';
}

@JsonSerializable()
class CountryDynamic extends Equatable {
  final int? countryId;
  final String countryDetail;

  const CountryDynamic({
    this.countryId,
    required this.countryDetail,
  });

  CountryDynamic copy({
    int? countryId,
    String? countryDetail,
  }) =>
      CountryDynamic(
        countryId: countryId ?? this.countryId,
        countryDetail: countryDetail ?? this.countryDetail,
      );

  factory CountryDynamic.fromJson(Map<String, dynamic> json) =>
      _$CountryDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$CountryDynamicToJson(this);

  @override
  List<Object?> get props => [
        countryId,
        countryDetail,
      ];

  @override
  String toString() {
    return 'tblCountries(country_id: $countryId, country_detail: $countryDetail)';
  }
}
