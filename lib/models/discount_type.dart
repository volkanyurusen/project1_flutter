// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'discount_type.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblDiscountTypes = 'tblDiscountTypes';

class DiscountTypeFields {
  static final List<String> values = [
    /// Add all fields here
    discountTypeId, discountName, discountRate, createdAt, deactivatedAt,
    updatedAt, isActive,
  ];

  static const String discountTypeId = 'discount_type_id';
  static const String discountName = 'discount_name';
  static const String discountRate = 'discount_rate';
  static const String createdAt = 'created_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

/// This table holds discounts rate. For membership, coaching or boots discounts are given by using
/// these rates.
///
/// discountName              discountRate
/// discount0                       0.00%
/// discount5                       5.00%
/// discount10                     10.00%
/// discount15                     15.00%
/// discount20                     20.00%
/// discount25                     25.00%
/// discount30                     30.00%
/// discount35                     35.00%
/// discount40                     40.00%
/// discount45                     45.00%
/// discount50                     50.00%
/// discount100                   100.00%
///
// @JsonSerializable()
class DiscountType extends Equatable {
  final int? discountTypeId;
  final String discountName;
  final double discountRate;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  DiscountType({
    this.discountTypeId,
    required this.discountName,
    required this.discountRate,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : createdAt = createdAt ?? DateTime.now();

  DiscountType copy({
    int? discountTypeId,
    String? discountName,
    double? discountRate,
    DateTime? createdAt,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      DiscountType(
        discountTypeId: discountTypeId ?? this.discountTypeId,
        discountName: discountName ?? this.discountName,
        discountRate: discountRate ?? this.discountRate,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory DiscountType.fromJson(Map<String, dynamic> json) =>
      _$DiscountTypeFromJson(json);

  Map<String, dynamic> toJson() => _$DiscountTypeToJson(this);

  @override
  List<Object?> get props => [
        discountTypeId,
        discountName,
        discountRate,
        createdAt,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblDiscountTypes(discount_type_id: $discountTypeId, discount_name: $discountName, discount_rate: $discountRate, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}
