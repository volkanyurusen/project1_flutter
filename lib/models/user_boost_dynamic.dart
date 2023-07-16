// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'user_boost_dynamic.g.dart';

const String tblUserBoosts = 'tblUserBoosts';

class UserBoostDynamicFields {
  static final List<String> values = [
    userBoostId,
    userId,
    boostTypeId,
    discountTypeId
  ];
  static const String userBoostId = 'user_boost_id';
  static const String userId = 'user_id';
  static const String boostTypeId = 'boost_type_id';
  static const String discountTypeId = 'discount_type_id';
}

@JsonSerializable()
class UserBoostDynamic extends Equatable {
  final int? userBoostId;
  final UserDynamic userDynamic;
  final BoostTypeDynamic boostTypeDynamic;
  final DiscountTypeDynamic discountTypeDynamic;

  const UserBoostDynamic({
    this.userBoostId,
    required this.userDynamic,
    required this.boostTypeDynamic,
    required this.discountTypeDynamic,
  });

  UserBoostDynamic copy({
    int? userBoostId,
    UserDynamic? userDynamic,
    BoostTypeDynamic? boostTypeDynamic,
    DiscountTypeDynamic? discountTypeDynamic,
  }) =>
      UserBoostDynamic(
        userBoostId: userBoostId ?? this.userBoostId,
        userDynamic: userDynamic ?? this.userDynamic,
        boostTypeDynamic: boostTypeDynamic ?? this.boostTypeDynamic,
        discountTypeDynamic: discountTypeDynamic ?? this.discountTypeDynamic,
      );

  factory UserBoostDynamic.fromJson(Map<String, dynamic> json) =>
      _$UserBoostDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$UserBoostDynamicToJson(this);

  @override
  List<Object?> get props => [
        userBoostId,
        userDynamic,
        boostTypeDynamic,
        discountTypeDynamic,
      ];

  @override
  String toString() {
    return 'tblUserBoosts(user_boost_id: $userBoostId, user_id: $userDynamic, boost_type_id: $boostTypeDynamic, discount_type: $discountTypeDynamic)';
  }
}
