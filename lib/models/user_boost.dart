// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:my_project/models/models.dart';

part 'user_boost.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblUserBoosts = 'tblUserBoosts';

class UserBoostFields {
  static final List<String> values = [
    /// Add all fields here
    userBoostId, userId, boostTypeId, discountTypeId, createdAt, lastValidDate,
    usingDate, isScheduled, isPurchasing, isPaid, isConsumed, isActive,
  ];

  static const String userBoostId = 'user_boost_id';
  static const String userId = 'user_id';
  static const String boostTypeId = 'boost_type_id';
  static const String discountTypeId = 'discount_type_id';
  static const String createdAt = 'created_at';
  static const String lastValidDate =
      'last_valid_date'; //must be added in DjangoAPI
  static const String usingDate = 'using_date'; //must be added in DjangoAPI
  static const String isScheduled = 'is_scheduled'; //must be added in DjangoAPI
  static const String isPurchasing =
      'is_purchasing'; //must be added in DjangoAPI
  static const String isPaid = 'is_paid'; //must be added in DjangoAPI
  static const String isConsumed = 'is_consumed'; //must be added in DjangoAPI
  static const String isActive = 'is_active';
}

/// This table holds users' purchasing boosts. All boost will be manage here, both paid and
/// scheduled.
///
// @JsonSerializable()
class UserBoost extends Equatable {
  final int? userBoostId;
  final User user;
  final BoostType boostType;
  final DiscountType discountType;
  final DateTime createdAt;
  final DateTime lastValidDate;
  final DateTime? usingDate;
  final bool isScheduled;
  final bool isPurchasing;
  final bool isPaid;
  final bool isConsumed;
  final bool isActive;

  UserBoost({
    this.userBoostId,
    required this.user,
    required this.boostType,
    required this.discountType,
    DateTime? createdAt,
    DateTime? lastValidDate,
    this.usingDate,
    this.isScheduled = true,
    this.isPurchasing = false,
    this.isPaid = false,
    this.isConsumed = false,
    this.isActive = true,
  })  : createdAt = createdAt ?? DateTime.now(),
        lastValidDate = lastValidDate ??
            DateTime(
              createdAt!.year,
              createdAt.month + 1,
              createdAt.day,
              createdAt.hour,
              createdAt.minute,
              createdAt.second,
              createdAt.millisecond,
            );

  UserBoost copy({
    int? userBoostId,
    User? user,
    BoostType? boostType,
    DiscountType? discountType,
    DateTime? createdAt,
    DateTime? lastValidDate,
    DateTime? usingDate,
    bool? isScheduled,
    bool? isPurchasing,
    bool? isPaid,
    bool? isConsumed,
    bool? isActive,
  }) =>
      UserBoost(
        userBoostId: userBoostId ?? this.userBoostId,
        user: user ?? this.user,
        boostType: boostType ?? this.boostType,
        discountType: discountType ?? this.discountType,
        createdAt: createdAt ?? this.createdAt,
        lastValidDate: lastValidDate ?? this.lastValidDate,
        usingDate: usingDate ?? this.usingDate,
        isScheduled: isScheduled ?? this.isScheduled,
        isPurchasing: isPurchasing ?? this.isPurchasing,
        isPaid: isPaid ?? this.isPaid,
        isConsumed: isConsumed ?? this.isConsumed,
        isActive: isActive ?? this.isActive,
      );

  factory UserBoost.fromJson(Map<String, dynamic> json) =>
      _$UserBoostFromJson(json);

  Map<String, dynamic> toJson() => _$UserBoostToJson(this);

  @override
  List<Object?> get props => [
        userBoostId,
        user,
        boostType,
        discountType,
        createdAt,
        lastValidDate,
        usingDate,
        isScheduled,
        isPurchasing,
        isPaid,
        isConsumed,
        isActive,
      ];

  @override
  String toString() {
    return 'tblUserBoosts(user_boost_id: $userBoostId, user_id: $user, boost_type_id: $boostType, discount_type: $discountType, created_at: $createdAt, last_valid_date: $lastValidDate, using_date: $usingDate, is_scheduled: $isScheduled, is_purchasing: $isPurchasing, is_paid: $isPaid, is_consumed: $isConsumed, is_active: $isActive)';
  }
}
