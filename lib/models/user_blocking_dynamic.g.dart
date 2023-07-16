// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_blocking_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBlockingDynamic _$UserBlockingDynamicFromJson(Map<String, dynamic> json) =>
    UserBlockingDynamic(
      userBlockingId: json['user_blocking_id'] as int?,
      blocker: UserDynamic.fromJson(json['blocker'] as Map<String, dynamic>),
      blockedUser:
          UserDynamic.fromJson(json['blocked_user'] as Map<String, dynamic>),
      blockingDate: json['blocking_date'] == null
          ? null
          : DateTime.parse(json['blocking_date'] as String),
      recalledDate: json['recalled_date'] == null
          ? null
          : DateTime.parse(json['recalled_date'] as String),
      updatedDate: json['updated_date'] == null
          ? null
          : DateTime.parse(json['updated_date'] as String),
      isRecalled: json['is_recalled'] as bool? ?? false,
    );

Map<String, dynamic> _$UserBlockingDynamicToJson(
        UserBlockingDynamic instance) =>
    <String, dynamic>{
      'user_blocking_id': instance.userBlockingId,
      'blocker': instance.blocker,
      'blocked_user': instance.blockedUser,
      'blocking_date': instance.blockingDate.toIso8601String(),
      'recalled_date': instance.recalledDate?.toIso8601String(),
      'updated_date': instance.updatedDate?.toIso8601String(),
      'is_recalled': instance.isRecalled,
    };
