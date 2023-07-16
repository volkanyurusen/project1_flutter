// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_following.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFollowing _$UserFollowingFromJson(Map<String, dynamic> json) =>
    UserFollowing(
      userFollowingId: json['user_following_id'] as int?,
      requester: User.fromJson(json['requester'] as Map<String, dynamic>),
      requestedUser:
          User.fromJson(json['requested_user'] as Map<String, dynamic>),
      processDetail: ProcessDetail.fromJson(
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
      isActive: json['is_active'] as bool? ?? true,
    );

Map<String, dynamic> _$UserFollowingToJson(UserFollowing instance) =>
    <String, dynamic>{
      'user_following_id': instance.userFollowingId,
      'requester': instance.requester,
      'requested_user': instance.requestedUser,
      'process_detail_id': instance.processDetail,
      'request_date': instance.requestDate.toIso8601String(),
      'approved_date': instance.approvedDate?.toIso8601String(),
      'denied_date': instance.deniedDate?.toIso8601String(),
      'recalled_date': instance.recalledDate?.toIso8601String(),
      'updated_date': instance.updatedDate?.toIso8601String(),
      'is_denied': instance.isDenied,
      'is_approved': instance.isApproved,
      'is_active': instance.isActive,
    };
