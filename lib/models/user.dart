// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:my_project/models/models.dart';

part 'user.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblUsers = 'tblUsers';

class UserFields {
  static final List<String> values = [
    /// Add all fields here
    uId, username, nameSurname, email, address, birthyear, genderId,
    countryCityId, picUrl, aboutUser, isUnderAge, lat, lon,
    verificationCode, membershipTypeId, createdAt, deactivatedAt, updatedAt,
    isCoach, isActive,
  ];

  static const String uId = 'user_id';
  static const String username = 'username';
  static const String nameSurname = 'name_surname';
  static const String email = 'mail';
  static const String address = 'address';
  static const String birthyear = 'birth_year';
  static const String genderId = 'gender_id';
  static const String countryCityId = 'country_city_id';
  static const String picUrl = 'pic_url';
  static const String aboutUser = 'about_user';
  static const String isUnderAge = 'is_under_25';
  static const String lat = 'lat';
  static const String lon = 'lon';
  static const String verificationCode = 'verification_code';
  static const String membershipTypeId = 'membership_type_id';
  // static const String password = 'passwordAt';
  static const String createdAt = 'created_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isCoach = 'is_coach';
  static const String isActive = 'is_active';
}

/// user can be as any user it can be also coach. Every coach is app's user
/// but not every user is a coach. The coach feature will be alive in time,
/// not at launch.
///
// @JsonSerializable()
class User extends Equatable {
  final int? uId;
  final String username;
  final String nameSurname;
  final String email;
  final String address;
  final int birthyear;
  final Gender gender;
  final CountryCity countryCity;
  final String picUrl;
  final String aboutUser;
  final bool? isUnderAge;
  final double lat;
  final double lon;
  final String verificationCode;
  final MembershipType membershipType;
  // final String? password;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isCoach;
  final bool isActive;

  User({
    this.uId,
    required this.username,
    required this.nameSurname,
    required this.email,
    required this.address,
    required this.birthyear,
    required this.gender,
    required this.countryCity,
    required this.picUrl,
    required this.aboutUser,
    this.isUnderAge = false,
    this.lat = 0.000000,
    this.lon = 0.000000,
    required this.verificationCode,
    required this.membershipType,
    // this.password,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isCoach = false,
    required this.isActive,
  }) : createdAt = createdAt ?? DateTime.now();

  User copy({
    int? uId,
    String? username,
    String? nameSurname,
    String? email,
    String? address,
    int? birthyear,
    Gender? gender,
    CountryCity? countryCity,
    String? picUrl,
    String? aboutUser,
    bool? isUnderAge,
    double? lat,
    double? lon,
    String? verificationCode,
    MembershipType? membershipType,
    // String? password,
    DateTime? createdAt,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isCoach,
    bool? isActive,
  }) =>
      User(
        uId: uId ?? this.uId,
        username: username ?? this.username,
        nameSurname: nameSurname ?? this.nameSurname,
        email: email ?? this.email,
        address: address ?? this.address,
        birthyear: birthyear ?? this.birthyear,
        gender: gender ?? this.gender,
        countryCity: countryCity ?? this.countryCity,
        picUrl: picUrl ?? this.picUrl,
        aboutUser: aboutUser ?? this.aboutUser,
        isUnderAge: isUnderAge ?? this.isUnderAge,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        verificationCode: verificationCode ?? this.verificationCode,
        membershipType: membershipType ?? this.membershipType,
        // password: password ?? this.password,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isCoach: isCoach ?? this.isCoach,
        isActive: isActive ?? this.isActive,
      );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [
        uId,
        username,
        nameSurname,
        email,
        address,
        birthyear,
        gender,
        countryCity,
        picUrl,
        aboutUser,
        isUnderAge,
        lat,
        lon,
        verificationCode,
        membershipType,
        //  password,
        createdAt,
        deactivatedAt,
        updatedAt,
        isCoach,
        isActive,
      ];

  @override
  String toString() {
    return 'tblUsers(user_id: $uId, username: $username, name_surname: $nameSurname, mail: $email, address: $address, birth_year: $birthyear, gender_id: $gender, country_city_id: $countryCity, pic_url: $picUrl, about_user: $aboutUser, is_under_25: $isUnderAge, lat: $lat, lon: $lon, verification_code: $verificationCode, membership_type_id: $membershipType, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_coach: $isCoach, is_active: $isActive)';
  }
}


// static List<User> users = const [
//   User(
//     uId: 1,
//     username: 'GabrielaG',
//     name: 'Gabriela',
//     surname: 'White',
//     email: 'gabrielaw@gmail.com',
//     address: 'Eichendorffstr. 43, Frankfurt',
//     birthyear: 1978,
//     gender: 'female',
//     city: 'Frankfurt',
//     picUrl:
//         'https://www.pexels.com/tr-tr/fotograf/merdivenlerden-asagi-kosu-kadin-fotografi-1112633/',
//     aboutUser: 'Just do it',
//     isUnderAge: false,
//     lat: 50.052967,
//     lon: 8.683516,
//   ),
//   User(
//     uId: 2,
//     username: 'VictorB',
//     name: 'Victor',
//     surname: 'Brown',
//     email: 'victorw@gmail.com',
//     address: 'Brandenburgische Str. 98, Frankfurt',
//     birthyear: 1986,
//     gender: 'male',
//     city: 'Frankfurt',
//     picUrl:
//         'https://www.pexels.com/tr-tr/fotograf/duz-bankta-oturan-adam-3490348/',
//     aboutUser: 'I like doing sport',
//     isUnderAge: false,
//     lat: 50.053652,
//     lon: 8.684821,
//   ),
//   User(
//     uId: 3,
//     username: 'MichaelG',
//     name: 'Michael',
//     surname: 'Green',
//     email: 'michaelw@hotmaill.com',
//     address: 'Rhinstrasse 63, Frankfurt',
//     birthyear: 1989,
//     gender: 'male',
//     city: 'Frankfurt',
//     picUrl:
//         'https://www.pexels.com/tr-tr/fotograf/beyaz-yelekli-ve-kirmizi-sortlu-adamin-beton-merdivenlerde-otururken-ayakkabilarini-baglayan-secici-odak-fotografi-3766226/',
//     aboutUser:
//         ' I am an Auburn fan. Graduated from there and love to go back when I can.',
//     isUnderAge: false,
//     lat: 50.054911,
//     lon: 8.686389,
//   ),
//   User(
//     uId: 4,
//     username: 'JamesR',
//     name: 'James',
//     surname: 'Red',
//     email: 'jamesw@msn.com',
//     address: 'Genterstrasse 48, Frankfurt',
//     birthyear: 2002,
//     gender: 'other',
//     city: 'Frankfurt',
//     picUrl:
//         'https://www.pexels.com/tr-tr/fotograf/siyah-halter-tutan-kisi-1032117/',
//     aboutUser: 'I like to cook and eat.',
//     isUnderAge: true,
//     lat: 50.055543,
//     lon: 8.687601,
//   ),
//   User(
//     uId: 5,
//     username: 'JulietteB',
//     name: 'Juliette',
//     surname: 'Black',
//     email: 'juliettew@gmail.com',
//     address: 'Rankestrasse 26, Frankfurt',
//     birthyear: 2000,
//     gender: 'female',
//     city: 'Frankfurt',
//     picUrl:
//         'https://www.pexels.com/tr-tr/fotograf/siyah-atlet-ve-gri-taytli-kadin-3621168/',
//     aboutUser: 'I love to sing and play piano.',
//     isUnderAge: true,
//     lat: 50.059867,
//     lon: 8.680023,
//   ),
//   User(
//     uId: 6,
//     username: 'MelS',
//     name: 'Mel',
//     surname: 'Smith',
//     email: 'melw@gmail.com',
//     address: 'Landsberger Allee 1, Frankfurt',
//     birthyear: 1995,
//     gender: 'female',
//     city: 'Frankfurt',
//     picUrl:
//         'https://www.pexels.com/tr-tr/fotograf/spor-kavga-kuvvetli-fitness-4753928/',
//     aboutUser: ' I love to learn new things, and I embrace my inner nerd.',
//     isUnderAge: false,
//     lat: 50.051216,
//     lon: 8.681738,
//   ),
//   User(
//     uId: 7,
//     username: 'WillW',
//     name: 'Will',
//     surname: 'Walter',
//     email: 'willw@gmail.com',
//     address: 'Alsterkrugchaussee 65, Frankfurt',
//     birthyear: 1999,
//     gender: 'male',
//     city: 'Frankfurt',
//     picUrl:
//         'https://www.pexels.com/tr-tr/fotograf/siyah-pantolonlu-calisan-ustsuz-adam-2098007/',
//     aboutUser:
//         'I am so sentimental, and I feel the big feels. I am very expressive, especially with people I trust.',
//     isUnderAge: true,
//     lat: 50.052212,
//     lon: 8.689892,
//   ),
//   User(
//     uId: 8,
//     username: 'RockyL',
//     name: 'Rocky',
//     surname: 'Lord',
//     email: 'rockyw@yahool.com',
//     address: 'Brandenburgische Strasse 54, Frankfurt',
//     birthyear: 1985,
//     gender: 'other',
//     city: 'Frankfurt',
//     picUrl:
//         'https://www.pexels.com/tr-tr/fotograf/adam-kisi-fitness-egzersiz-yapmak-5039659/',
//     aboutUser: 'I love movies. Except maybe horror movies',
//     isUnderAge: false,
//     lat: 50.059981,
//     lon: 8.688732,
//   ),
//   User(
//     uId: 9,
//     username: 'MikeR',
//     name: 'Mike',
//     surname: 'Reeves',
//     email: 'mikew@gmail.com',
//     address: 'Kirchenallee 86, Frankfurt',
//     birthyear: 1986,
//     gender: 'male',
//     city: 'Frankfurt',
//     picUrl:
//         'https://www.pexels.com/tr-tr/fotograf/bankta-oturan-adamin-gri-tonlamali-fotografi-1431283/',
//     aboutUser:
//         ' I love the beach. We are lucky to go several times a year to see my parents and sister, who live in Destin, Florida.',
//     isUnderAge: false,
//     lat: 50.054324,
//     lon: 8.681941,
//   ),
//   User(
//     uId: 10,
//     username: 'SandraG',
//     name: 'Sandra',
//     surname: 'Gibson',
//     email: 'sandraw@gmail.com',
//     address: 'Scharnweberstrasse 83, Frankfurt',
//     birthyear: 1975,
//     gender: 'female',
//     city: 'Frankfurt',
//     picUrl:
//         'https://www.pexels.com/tr-tr/fotograf/kadin-spor-renkli-mutlu-4498155/',
//     aboutUser:
//         'I am terrible at decorating and DIY stuff, and I am envious of those who are good at it.',
//     isUnderAge: false,
//     lat: 50.056674,
//     lon: 8.683439,
//   ),
//   User(
//     uId: 11,
//     username: 'EvaC',
//     name: 'Eva',
//     surname: 'Cruise',
//     email: 'evaw@gmail.com',
//     address: 'Flotowstr. 88, Frankfurt',
//     birthyear: 2005,
//     gender: 'female',
//     city: 'Frankfurt',
//     picUrl:
//         'https://www.pexels.com/tr-tr/fotograf/saglikli-gunesli-kadin-yol-4457913/',
//     aboutUser: 'I am really forgetful sometimes.',
//     isUnderAge: true,
//     lat: 50.051219,
//     lon: 8.689303,
//   ),
//   User(
//     uId: 12,
//     username: 'VictoriaG',
//     name: 'Victoria',
//     surname: 'Gonzales',
//     email: 'victoriaw@gmail.com',
//     address: 'Unter den Linden 73, Frankfurt',
//     birthyear: 2003,
//     gender: 'other',
//     city: 'Frankfurt',
//     picUrl:
//         'https://www.pexels.com/tr-tr/fotograf/moda-adam-insanlar-kadin-4587359/',
//     aboutUser: 'I am good with numbers and math.',
//     isUnderAge: true,
//     lat: 50.051764,
//     lon: 8.687512,
//   ),
// ];
