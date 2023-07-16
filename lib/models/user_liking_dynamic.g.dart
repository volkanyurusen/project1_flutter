// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_liking_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLikingDynamic _$UserLikingDynamicFromJson(Map<String, dynamic> json) =>
    UserLikingDynamic(
      userLikingId: json['user_liking_id'] as int?,
      likingUser:
          UserDynamic.fromJson(json['liking_user'] as Map<String, dynamic>),
      likedUser:
          UserDynamic.fromJson(json['liked_user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserLikingDynamicToJson(UserLikingDynamic instance) =>
    <String, dynamic>{
      'user_liking_id': instance.userLikingId,
      'liking_user': instance.likingUser,
      'liked_user': instance.likedUser,
    };
