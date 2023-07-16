// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'boost_type_dynamic.g.dart';

const String tblBoostTypes = 'tblBoostTypes';

class BoostTypeDynamicFields {
  static final List<String> values = [
    /// Add all fields here
    boostTypeId, boostName, boostPrice,
  ];
  static const String boostTypeId = 'boost_type_id';
  static const String boostName = 'boost_name';
  static const String boostPrice = 'boost_price';
}

@JsonSerializable()
class BoostTypeDynamic extends Equatable {
  final int? boostTypeId;
  final String boostName;
  final int boostPrice;

  const BoostTypeDynamic({
    this.boostTypeId,
    required this.boostName,
    required this.boostPrice,
  });

  BoostTypeDynamic copy({
    int? boostTypeId,
    String? boostName,
    int? boostPrice,
  }) =>
      BoostTypeDynamic(
        boostTypeId: boostTypeId ?? this.boostTypeId,
        boostName: boostName ?? this.boostName,
        boostPrice: boostPrice ?? this.boostPrice,
      );

  factory BoostTypeDynamic.fromJson(Map<String, dynamic> json) =>
      _$BoostTypeDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$BoostTypeDynamicToJson(this);

  @override
  List<Object?> get props => [
        boostTypeId,
        boostName,
        boostPrice,
      ];

  @override
  String toString() {
    return 'tblBoostTypeDynamics(boost_type_id: $boostTypeId, boost_name: $boostName, boost_price: $boostPrice)';
  }
}
