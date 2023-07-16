// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'country.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblCountries = 'tblCountries';

class CountryFields {
  static final List<String> values = [
    /// Add all fields here
    countryId, countryDetail, createdAt, deactivatedAt,
    updatedAt, isActive,
  ];

  static const String countryId = 'country_id';
  static const String countryDetail = 'country_detail';
  static const String createdAt = 'created_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

// @JsonSerializable()
class Country extends Equatable {
  final int? countryId;
  final String countryDetail;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  Country({
    this.countryId,
    required this.countryDetail,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = false,
  }) : createdAt = createdAt ?? DateTime.now();

  Country copy({
    int? countryId,
    String? countryDetail,
    DateTime? createdAt,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      Country(
        countryId: countryId ?? this.countryId,
        countryDetail: countryDetail ?? this.countryDetail,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);

  @override
  List<Object?> get props => [
        countryId,
        countryDetail,
        createdAt,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblCountries(country_id: $countryId, country_detail: $countryDetail, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}
