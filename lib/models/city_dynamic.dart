// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city_dynamic.g.dart';

const String tblCities = 'tblCities';

class CityDynamicFields {
  static final List<String> values = [
    cityId,
    cityDetail,
  ];
  static const String cityId = 'city_id';
  static const String cityDetail = 'city_detail';
}

@JsonSerializable()
class CityDynamic extends Equatable {
  final int? cityId;
  final String cityDetail;

  const CityDynamic({
    this.cityId,
    required this.cityDetail,
  });

  CityDynamic copy({
    int? cityId,
    String? cityDetail,
  }) =>
      CityDynamic(
        cityId: cityId ?? this.cityId,
        cityDetail: cityDetail ?? this.cityDetail,
      );

  factory CityDynamic.fromJson(Map<String, dynamic> json) =>
      _$CityDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$CityDynamicToJson(this);

  @override
  List<Object?> get props => [
        cityId,
        cityDetail,
      ];

  @override
  String toString() {
    return 'tblCities(city_id: $cityId, city_detail: $cityDetail)';
  }
}
