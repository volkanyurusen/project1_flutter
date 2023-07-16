// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'user_dynamic.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblUserDynamics = 'tblUserDynamics';

class UserDynamicFields {
  static final List<String> values = [
    uId,
    username,
    genderId,
    countryCityId,
    picUrl,
    aboutUser,
    isUnderAge,
    membershipTypeId,
    lat,
    lon,
  ];

  static const String uId = 'user_id';
  static const String username = 'username';
  static const String genderId = 'gender_id';
  static const String countryCityId = 'country_city_id';
  static const String picUrl = 'pic_url';
  static const String aboutUser = 'about_user';
  static const String isUnderAge = 'is_under_25';
  static const String membershipTypeId = 'membership_type_id';
  static const String lat = 'lat';
  static const String lon = 'lon';
}

@JsonSerializable()
class UserDynamic extends Equatable {
  final int? uId;
  final String username;
  final GenderDynamic genderDynamic;
  final CountryCityDynamic countryCityDynamic;
  final String picUrl;
  final String aboutUser;
  final bool? isUnderAge;
  final MembershipTypeDynamic membershipTypeDynamic;
  final double lat;
  final double lon;

  const UserDynamic({
    this.uId,
    required this.username,
    required this.genderDynamic,
    required this.countryCityDynamic,
    required this.picUrl,
    required this.aboutUser,
    this.isUnderAge = false,
    required this.membershipTypeDynamic,
    required this.lat,
    required this.lon,
  });

  UserDynamic copy({
    int? uId,
    String? username,
    GenderDynamic? genderDynamic,
    CountryCityDynamic? countryCityDynamic,
    String? picUrl,
    String? aboutUser,
    bool? isUnderAge,
    MembershipTypeDynamic? membershipTypeDynamic,
    double? lat,
    double? lon,
  }) =>
      UserDynamic(
        uId: uId ?? this.uId,
        username: username ?? this.username,
        genderDynamic: genderDynamic ?? this.genderDynamic,
        countryCityDynamic: countryCityDynamic ?? this.countryCityDynamic,
        picUrl: picUrl ?? this.picUrl,
        aboutUser: aboutUser ?? this.aboutUser,
        isUnderAge: isUnderAge ?? this.isUnderAge,
        membershipTypeDynamic:
            membershipTypeDynamic ?? this.membershipTypeDynamic,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
      );

  factory UserDynamic.fromJson(Map<String, dynamic> json) =>
      _$UserDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$UserDynamicToJson(this);

  @override
  List<Object?> get props => [
        uId,
        username,
        genderDynamic,
        countryCityDynamic,
        picUrl,
        aboutUser,
        isUnderAge,
        membershipTypeDynamic,
        lat,
        lon,
      ];

  @override
  String toString() {
    return 'UserDynamic(uId: $uId, username: $username, genderDynamic: $genderDynamic, countryCityDynamic: $countryCityDynamic, picUrl: $picUrl, aboutUser: $aboutUser, isUnderAge: $isUnderAge, membershipTypeDynamic: $membershipTypeDynamic, lat: $lat, lon: $lon)';
  }
}
