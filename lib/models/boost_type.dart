// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'boost_type.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblBoostTypes = 'tblBoostTypes';

class BoostTypeFields {
  static final List<String> values = [
    /// Add all fields here
    boostTypeId, boostName, boostPrice, createdAt, deactivatedAt, updatedAt,
    isActive
  ];

  static const String boostTypeId = 'boost_type_id';
  static const String boostName = 'boost_name';
  static const String boostPrice = 'boost_price';
  static const String createdAt = 'created_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

/// This table was created for boosting a user or a coach to make them find easliy. 6 types of
/// boosts exist. Boots details are below.
///
///                                     Durations                         Prices
/// scheduledUserBoot                    3 hours                           00.00
/// basicUserBoot                        3 hours                           10.00
/// mediumUserBoot                       6 hours                           30.00
/// hughUserBoot                        24 hours                           60.00
/// scheduledCoachingBoost               3 hours                           00.00
/// basicCoachingBoost                   3 hours                           20.00
/// basicCoachingBoost                   6 hours                           60.00
/// basicCoachingBoost                  24 hours                          120.00
///
// @JsonSerializable()
class BoostType extends Equatable {
  final int? boostTypeId;
  final String boostName;
  final double boostPrice;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  BoostType({
    this.boostTypeId,
    required this.boostName,
    required this.boostPrice,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : createdAt = createdAt ?? DateTime.now();

  BoostType copy({
    int? boostTypeId,
    String? boostName,
    double? boostPrice,
    DateTime? createdAt,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      BoostType(
        boostTypeId: boostTypeId ?? this.boostTypeId,
        boostName: boostName ?? this.boostName,
        boostPrice: boostPrice ?? this.boostPrice,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory BoostType.fromJson(Map<String, dynamic> json) =>
      _$BoostTypeFromJson(json);

  Map<String, dynamic> toJson() => _$BoostTypeToJson(this);

  @override
  List<Object?> get props => [
        boostTypeId,
        boostName,
        boostPrice,
        createdAt,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblBoostTypes(boost_type_id: $boostTypeId, boost_name: $boostName, boost_price: $boostPrice, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}
