// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_db.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDB _$UserDBFromJson(Map<String, dynamic> json) => UserDB(
      userDBId: json['user_id'] as int?,
      username: json['username'] as String,
      nameSurname: json['name_surname'] as String,
      email: json['mail'] as String,
      address: json['address'] as String,
      birthyear: json['birth_year'] as int,
      genderId: json['gender_id'] as int,
      countryCityId: json['country_city_id'] as int,
      picUrl: json['pic_url'] as String,
      aboutUser: json['about_user'] as String,
      isUnderAge: json['is_under_25'] as bool? ?? false,
      lat: double.parse(json['lat']),
      lon: double.parse(json['lon']),
      verificationCode: json['verification_code'] as String,
      membershipTypeId: json['membership_type_id'] as int,
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

Map<String, dynamic> _$UserDBToJson(UserDB instance) => <String, dynamic>{
      'user_id': instance.userDBId,
      'username': instance.username,
      'name_surname': instance.nameSurname,
      'mail': instance.email,
      'address': instance.address,
      'birth_year': instance.birthyear,
      'gender_id': instance.genderId,
      'country_city_id': instance.countryCityId,
      'pic_url': instance.picUrl,
      'about_user': instance.aboutUser,
      'is_under_25': instance.isUnderAge,
      'lat': instance.lat,
      'lon': instance.lon,
      'verification_code': instance.verificationCode,
      'membership_type_id': instance.membershipTypeId,
      'created_at': instance.createdAt.toIso8601String(),
      'deactivated_at': instance.deactivatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_coach': instance.isCoach,
      'is_active': instance.isActive,
    };
