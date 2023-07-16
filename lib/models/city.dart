// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'city.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblCities = 'tblCities';

class CityFields {
  static final List<String> values = [
    /// Add all fields here
    cityId, cityDetail, createdAt, deactivatedAt, updatedAt, isActive,
  ];

  static const String cityId = 'city_id';
  static const String cityDetail = 'city_detail';
  static const String createdAt = 'created_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

// @JsonSerializable()
class City extends Equatable {
  final int? cityId;
  final String cityDetail;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  City({
    this.cityId,
    required this.cityDetail,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : createdAt = createdAt ?? DateTime.now();

  City copy({
    int? cityId,
    String? cityDetail,
    DateTime? createdAt,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      City(
        cityId: cityId ?? this.cityId,
        cityDetail: cityDetail ?? this.cityDetail,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);

  @override
  List<Object?> get props => [
        cityId,
        cityDetail,
        createdAt,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblCities(city_id: $cityId, city_detail: $cityDetail, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}
