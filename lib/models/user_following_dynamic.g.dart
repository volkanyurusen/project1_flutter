// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_following_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFollowingDynamic _$UserFollowingDynamicFromJson(
        Map<String, dynamic> json) =>
    UserFollowingDynamic(
      userFollowingId: json['user_following_id'] as int?,
      requester:
          UserDynamic.fromJson(json['requester'] as Map<String, dynamic>),
      requestedUser:
          UserDynamic.fromJson(json['requested_user'] as Map<String, dynamic>),
      processDetailDynamic: ProcessDetailDynamic.fromJson(
          json['process_detail_id'] as Map<String, dynamic>),
      requestDate: json['request_date'] == null
          ? null
          : DateTime.parse(json['request_date'] as String),
      approvedDate: json['approved_date'] == null
          ? null
          : DateTime.parse(json['approved_date'] as String),
      deniedDate: json['denied_date'] == null
          ? null
          : DateTime.parse(json['denied_date'] as String),
      recalledDate: json['recalled_date'] == null
          ? null
          : DateTime.parse(json['recalled_date'] as String),
      updatedDate: json['updated_date'] == null
          ? null
          : DateTime.parse(json['updated_date'] as String),
      isDenied: json['is_denied'] as bool? ?? false,
      isApproved: json['is_approved'] as bool? ?? false,
    );

Map<String, dynamic> _$UserFollowingDynamicToJson(
        UserFollowingDynamic instance) =>
    <String, dynamic>{
      'user_following_id': instance.userFollowingId,
      'requester': instance.requester,
      'requested_user': instance.requestedUser,
      'process_detail_id': instance.processDetailDynamic,
      'request_date': instance.requestDate.toIso8601String(),
      'approved_date': instance.approvedDate?.toIso8601String(),
      'denied_date': instance.deniedDate?.toIso8601String(),
      'recalled_date': instance.recalledDate?.toIso8601String(),
      'updated_date': instance.updatedDate?.toIso8601String(),
      'is_denied': instance.isDenied,
      'is_approved': instance.isApproved,
    };
