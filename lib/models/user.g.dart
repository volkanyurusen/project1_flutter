// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      uId: json['user_id'] as int?,
      username: json['username'] as String,
      nameSurname: json['name_surname'] as String,
      email: json['mail'] as String,
      address: json['address'] as String,
      birthyear: json['birth_year'] as int,
      gender: Gender.fromJson(json['gender_id'] as Map<String, dynamic>),
      countryCity:
          CountryCity.fromJson(json['country_city_id'] as Map<String, dynamic>),
      picUrl: json['pic_url'] as String,
      aboutUser: json['about_user'] as String,
      isUnderAge: json['is_under_25'] as bool? ?? false,
      lat: double.parse(json['lat']),
      lon: double.parse(json['lon']),
      verificationCode: json['verification_code'] as String,
      membershipType: MembershipType.fromJson(
          json['membership_type_id'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      deactivatedAt: json['deactivated_at'] == null
          ? null
          : DateTime.parse(json['deactivated_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      isCoach: json['is_coach'] as bool? ?? false,
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'user_id': instance.uId,
      'username': instance.username,
      'name_surname': instance.nameSurname,
      'mail': instance.email,
      'address': instance.address,
      'birth_year': instance.birthyear,
      'gender_id': instance.gender,
      'country_city_id': instance.countryCity,
      'pic_url': instance.picUrl,
      'about_user': instance.aboutUser,
      'is_under_25': instance.isUnderAge,
      'lat': instance.lat,
      'lon': instance.lon,
      'verification_code': instance.verificationCode,
      'membership_type_id': instance.membershipType,
      'created_at': instance.createdAt.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_coach': instance.isCoach,
      'is_active': instance.isActive,
    };
