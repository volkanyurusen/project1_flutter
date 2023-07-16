// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDynamic _$UserDynamicFromJson(Map<String, dynamic> json) => UserDynamic(
      uId: json['user_id'] as int?,
      username: json['username'] as String,
      genderDynamic:
          GenderDynamic.fromJson(json['gender_id'] as Map<String, dynamic>),
      countryCityDynamic: CountryCityDynamic.fromJson(
          json['country_city_id'] as Map<String, dynamic>),
      picUrl: json['pic_url'] as String,
      aboutUser: json['about_user'] as String,
      isUnderAge: json['is_under_25'] as bool? ?? false,
      membershipTypeDynamic: MembershipTypeDynamic.fromJson(
          json['membership_type_id'] as Map<String, dynamic>),
      lat: double.parse(json['lat']),
      lon: double.parse(json['lon']),
    );

Map<String, dynamic> _$UserDynamicToJson(UserDynamic instance) =>
    <String, dynamic>{
      'user_id': instance.uId,
      'username': instance.username,
      'gender_id': instance.genderDynamic,
      'country_city_id': instance.countryCityDynamic,
      'pic_url': instance.picUrl,
      'about_user': instance.aboutUser,
      'is_under_25': instance.isUnderAge,
      'membership_type_id': instance.membershipTypeDynamic,
      'lat': instance.lat,
      'lon': instance.lon,
    };
