// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_liking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLiking _$UserLikingFromJson(Map<String, dynamic> json) => UserLiking(
      userLikingId: json['user_liking_id'] as int?,
      likingUser: User.fromJson(json['liking_user'] as Map<String, dynamic>),
      likedUser: User.fromJson(json['liked_user'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      deactivatedAt: json['deactivated_at'] == null
          ? null
          : DateTime.parse(json['deactivated_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      isActive: json['is_active'] as bool? ?? true,
    );

Map<String, dynamic> _$UserLikingToJson(UserLiking instance) =>
    <String, dynamic>{
      'user_liking_id': instance.userLikingId,
      'liking_user': instance.likingUser,
      'liked_user': instance.likedUser,
      'created_at': instance.createdAt.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
    };
