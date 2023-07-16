// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'discount_type_dynamic.g.dart';

const String tblDiscountTypes = 'tblDiscountTypes';

class DiscountTypeDynamicFields {
  static final List<String> values = [
    discountTypeId,
    discountName,
    discountRate,
  ];
  static const String discountTypeId = 'discount_type_id';
  static const String discountName = 'discount_name';
  static const String discountRate = 'discount_rate';
}

@JsonSerializable()
class DiscountTypeDynamic extends Equatable {
  final int? discountTypeId;
  final String discountName;
  final double discountRate;

  const DiscountTypeDynamic({
    this.discountTypeId,
    required this.discountName,
    required this.discountRate,
  });

  DiscountTypeDynamic copy({
    int? discountTypeId,
    String? discountName,
    double? discountRate,
  }) =>
      DiscountTypeDynamic(
        discountTypeId: discountTypeId ?? this.discountTypeId,
        discountName: discountName ?? this.discountName,
        discountRate: discountRate ?? this.discountRate,
      );

  factory DiscountTypeDynamic.fromJson(Map<String, dynamic> json) =>
      _$DiscountTypeDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$DiscountTypeDynamicToJson(this);

  @override
  List<Object?> get props => [
        discountTypeId,
        discountName,
        discountRate,
      ];

  @override
  String toString() {
    return 'tblDiscountTypes(discount_type_id: $discountTypeId, discount_name: $discountName, discount_rate: $discountRate)';
  }
}
