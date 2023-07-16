// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_boost.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBoost _$UserBoostFromJson(Map<String, dynamic> json) => UserBoost(
      userBoostId: json['user_boost_id'] as int?,
      user: User.fromJson(json['user_id'] as Map<String, dynamic>),
      boostType:
          BoostType.fromJson(json['boost_type_id'] as Map<String, dynamic>),
      discountType: DiscountType.fromJson(
          json['discount_type_id'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      lastValidDate: json['last_valid_date'] == null
          ? null
          : DateTime.parse(json['last_valid_date'] as String),
      usingDate: json['using_date'] == null
          ? null
          : DateTime.parse(json['using_date'] as String),
      isScheduled: json['is_scheduled'] as bool? ?? true,
      isPurchasing: json['is_purchasing'] as bool? ?? false,
      isPaid: json['is_paid'] as bool? ?? false,
      isConsumed: json['is_consumed'] as bool? ?? false,
      isActive: json['is_active'] as bool? ?? true,
    );

Map<String, dynamic> _$UserBoostToJson(UserBoost instance) => <String, dynamic>{
      'user_boost_id': instance.userBoostId,
      'user_id': instance.user,
      'boost_type_id': instance.boostType,
      'discount_type_id': instance.discountType,
      'created_at': instance.createdAt.toIso8601String(),
      'last_valid_date': instance.lastValidDate.toIso8601String(),
      'using_date': instance.usingDate?.toIso8601String(),
      'is_scheduled': instance.isScheduled,
      'is_purchasing': instance.isPurchasing,
      'is_paid': instance.isPaid,
      'is_consumed': instance.isConsumed,
      'is_active': instance.isActive,
    };
