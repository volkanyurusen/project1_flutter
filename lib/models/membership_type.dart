// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:my_project/models/models.dart';

part 'membership_type.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblMembershipTypes = 'tblMembershipTypes';

class MembershipTypeFields {
  static final List<String> values = [
    /// Add all fields here
    membershipTypeId, membershipTypeName, limitOfCreatingActivityPerDay,
    limitOfAttendancePerDay, multipleActivitySearchability,
    gpsLocationChangeability, locationCircularDiameter, boostTypeId,
    limitOfFreeBoost, ageClassificationSelectability, otherOptionSelectability,
    templateLimit, amountOfReplicableActivity, repetitionLimit, likeability,
    followabilityToUser, followabilityByUser, followerViewability, hideAds,
    monthlyPrice, description, createdAt, stoppedAt, updatedAt, isStopped,
    isUpdated, isActive,
  ];

  static const String membershipTypeId = 'membership_type_id';
  static const String membershipTypeName = 'membership_type_name';
  static const String limitOfCreatingActivityPerDay =
      'limit_of_creating_activity_per_day';
  static const String limitOfAttendancePerDay = 'limit_of_attendance_per_day';
  static const String multipleActivitySearchability =
      'multiple_activity_searchability';
  static const String gpsLocationChangeability = 'gps_location_changeability';
  static const String locationCircularDiameter = 'location_circular_diameter';
  static const String boostTypeId = 'boost_type_id';
  static const String limitOfFreeBoost = 'limit_of_free_boost';
  static const String ageClassificationSelectability =
      'age_classification_selectability';
  static const String otherOptionSelectability = 'other_option_selectability';
  static const String templateLimit = 'template_limit';
  static const String amountOfReplicableActivity =
      'amount_of_replicable_activity';
  static const String repetitionLimit = 'repetition_limit';
  static const String likeability = 'likeability';
  static const String followabilityToUser = 'followability_to_user';
  static const String followabilityByUser = 'followability_by_user';
  static const String followerViewability = 'follower_viewability';
  static const String hideAds = 'hide_ads';
  static const String monthlyPrice = 'monthly_price';
  static const String description = 'description';
  static const String createdAt = 'created_at';
  static const String stoppedAt = 'stopped_at';
  static const String updatedAt = 'updated_at';
  static const String isStopped = 'is_stopped';
  static const String isUpdated = 'is_updated';
  static const String isActive = 'is_active';
}

/// This table contains all memberships detail, all users will be basic members at the beginning.
/// They can change  the type of their membership at any time by making payments. The membership types
/// and all column details are below.
///
/// Basic, High, Platinum
///
/// membershipType;                         Basic             High              Platinum
/// limitOfCreatingActivityPerDay;            3                15                 255
/// limitOfAttendancePerDay;                  3                15                 255
/// multipleActivitySearchability;          true              true                true
/// gpsLocationChangeability;               false            false                true
/// locationCircularDiameter;                 3                15                 50
/// boostTypeId;                              1                 1                  1
/// limitOfFreeBoost;                         0                 1                  5
/// ageClassificationSelectability;         false             true                true
/// otherOptionSelectability;                true             true                true
/// templateLimit;                            0                1                   10
/// amountOfReplicableActivity;               0                1                   10
/// repetitionLimit;                          0                5                   18
/// likeability;                            false             true                true
/// followabilityToUser;                    false             true                true
/// followabilityByUser;                    false             true                true
/// followerViewability;                    false            false                true
/// hideAds;                                false             true                true
/// monthlyPrice;                           0.00              9.99               29.99
/// description;                         will be added    will be added      will be added
/// createdAt;                              date              date                date
/// stoppedAt;                              date              date                date
/// updatedAt;                              date              date                date
/// isStopped;                              bool              bool                bool
/// isUpdated;                              bool              bool                bool
/// isActive;                               bool              bool                bool
///
// @JsonSerializable()
class MembershipType extends Equatable {
  final int? membershipTypeId;
  final String membershipTypeName;
  final int limitOfCreatingActivityPerDay;
  final int limitOfAttendancePerDay;
  final bool multipleActivitySearchability;
  final bool gpsLocationChangeability;
  final double locationCircularDiameter;
  final int limitOfFreeBoost;
  final bool ageClassificationSelectability;
  final bool otherOptionSelectability;
  final int templateLimit;
  final int amountOfReplicableActivity;
  final int repetitionLimit;
  final bool likeability;
  final bool followabilityToUser;
  final bool followabilityByUser;
  final bool followerViewability;
  final bool hideAds;
  final double monthlyPrice;
  final String description;
  final BoostType boostType;
  final DateTime createdAt;
  final DateTime? stoppedAt;
  final DateTime? updatedAt;
  final bool isStopped;
  final bool isUpdated;
  final bool isActive;

  MembershipType({
    this.membershipTypeId,
    required this.membershipTypeName,
    required this.limitOfCreatingActivityPerDay,
    required this.limitOfAttendancePerDay,
    this.multipleActivitySearchability = true,
    required this.gpsLocationChangeability,
    required this.locationCircularDiameter,
    required this.limitOfFreeBoost,
    required this.ageClassificationSelectability,
    this.otherOptionSelectability = true,
    required this.templateLimit,
    required this.amountOfReplicableActivity,
    required this.repetitionLimit,
    required this.likeability,
    required this.followabilityToUser,
    required this.followabilityByUser,
    required this.followerViewability,
    required this.hideAds,
    required this.monthlyPrice,
    required this.description,
    required this.boostType,
    DateTime? createdAt,
    this.stoppedAt,
    this.updatedAt,
    this.isStopped = false,
    this.isUpdated = false,
    required this.isActive,
  }) : createdAt = createdAt ?? DateTime.now();

  MembershipType copy({
    int? membershipTypeId,
    String? membershipTypeName,
    int? limitOfCreatingActivityPerDay,
    int? limitOfAttendancePerDay,
    bool? multipleActivitySearchability,
    bool? gpsLocationChangeability,
    double? locationCircularDiameter,
    int? limitOfFreeBoost,
    bool? ageClassificationSelectability,
    bool? otherOptionSelectability,
    int? templateLimit,
    int? amountOfReplicableActivity,
    int? repetitionLimit,
    bool? likeability,
    bool? followabilityToUser,
    bool? followabilityByUser,
    bool? followerViewability,
    bool? hideAds,
    double? monthlyPrice,
    String? description,
    BoostType? boostType,
    DateTime? createdAt,
    DateTime? stoppedAt,
    DateTime? updatedAt,
    bool? isStopped,
    bool? isUpdated,
    bool? isActive,
  }) =>
      MembershipType(
        membershipTypeId: membershipTypeId ?? this.membershipTypeId,
        membershipTypeName: membershipTypeName ?? this.membershipTypeName,
        limitOfCreatingActivityPerDay:
            limitOfCreatingActivityPerDay ?? this.limitOfCreatingActivityPerDay,
        limitOfAttendancePerDay:
            limitOfAttendancePerDay ?? this.limitOfAttendancePerDay,
        multipleActivitySearchability:
            multipleActivitySearchability ?? this.multipleActivitySearchability,
        gpsLocationChangeability:
            gpsLocationChangeability ?? this.gpsLocationChangeability,
        locationCircularDiameter:
            locationCircularDiameter ?? this.locationCircularDiameter,
        limitOfFreeBoost: limitOfFreeBoost ?? this.limitOfFreeBoost,
        ageClassificationSelectability: ageClassificationSelectability ??
            this.ageClassificationSelectability,
        otherOptionSelectability:
            otherOptionSelectability ?? this.otherOptionSelectability,
        templateLimit: templateLimit ?? this.templateLimit,
        amountOfReplicableActivity:
            amountOfReplicableActivity ?? this.amountOfReplicableActivity,
        repetitionLimit: repetitionLimit ?? this.repetitionLimit,
        likeability: likeability ?? this.likeability,
        followabilityToUser: followabilityToUser ?? this.followabilityToUser,
        followabilityByUser: followabilityByUser ?? this.followabilityByUser,
        followerViewability: followerViewability ?? this.followerViewability,
        hideAds: hideAds ?? this.hideAds,
        monthlyPrice: monthlyPrice ?? this.monthlyPrice,
        description: description ?? this.description,
        boostType: boostType ?? this.boostType,
        createdAt: createdAt ?? this.createdAt,
        stoppedAt: stoppedAt ?? this.stoppedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isStopped: isStopped ?? this.isStopped,
        isUpdated: isUpdated ?? this.isUpdated,
        isActive: isActive ?? this.isActive,
      );

  factory MembershipType.fromJson(Map<String, dynamic> json) =>
      _$MembershipTypeFromJson(json);

  Map<String, dynamic> toJson() => _$MembershipTypeToJson(this);

  @override
  List<Object?> get props => [
        membershipTypeId,
        membershipTypeName,
        limitOfCreatingActivityPerDay,
        limitOfAttendancePerDay,
        multipleActivitySearchability,
        gpsLocationChangeability,
        locationCircularDiameter,
        limitOfFreeBoost,
        ageClassificationSelectability,
        otherOptionSelectability,
        templateLimit,
        amountOfReplicableActivity,
        repetitionLimit,
        likeability,
        followabilityToUser,
        followabilityByUser,
        followerViewability,
        hideAds,
        monthlyPrice,
        description,
        boostType,
        createdAt,
        stoppedAt,
        updatedAt,
        isStopped,
        isUpdated,
        isActive,
      ];

  @override
  String toString() {
    return 'tblMembershipTypes(membership_type_id: $membershipTypeId, membership_type_name: $membershipTypeName, limit_of_creating_activity_per_day: $limitOfCreatingActivityPerDay, limit_of_attendance_per_day: $limitOfAttendancePerDay, multiple_activity_searchability: $multipleActivitySearchability, gps_location_changeability: $gpsLocationChangeability, location_circular_diameter: $locationCircularDiameter, limit_of_free_boost: $limitOfFreeBoost, age_classification_selectability: $ageClassificationSelectability, other_option_selectability: $otherOptionSelectability, template_limit: $templateLimit, amount_of_replicable_activity: $amountOfReplicableActivity, repetition_limit: $repetitionLimit, likeability: $likeability, followability_to_user: $followabilityToUser, followability_by_user: $followabilityByUser, follower_viewability: $followerViewability, hide_ads: $hideAds, monthly_price: $monthlyPrice, description: $description, boost_type_id: $boostType, created_at: $createdAt, stopped_at: $stoppedAt, updated_at: $updatedAt, is_stopped: $isStopped, is_updated: $isUpdated, is_active: $isActive)';
  }
}

// MembershipType fromMap(Map<String, dynamic> json) => MembershipType(
//       membershipTypeId: json[MembershipTypeFields.membershipTypeId] as int?,
//       membershipTypeName:
//           json[MembershipTypeFields.membershipTypeName] as String,
//       limitOfCreatingActivityPerDay:
//           json[MembershipTypeFields.limitOfCreatingActivityPerDay] as int,
//       limitOfAttendancePerDay:
//           json[MembershipTypeFields.limitOfAttendancePerDay] as int,
//       multipleActivitySearchability:
//           json[MembershipTypeFields.multipleActivitySearchability] == 1,
//       gpsLocationChangeability:
//           json[MembershipTypeFields.gpsLocationChangeability] == 1,
//       locationCircularDiameter:
//           json[MembershipTypeFields.locationCircularDiameter] as double,
//       boostTypeId: json[MembershipTypeFields.boostTypeId] as int,
//       limitOfFreeBoost: json[MembershipTypeFields.limitOfFreeBoost] as int,
//       ageClassificationSelectability:
//           json[MembershipTypeFields.ageClassificationSelectability] == 1,
//       otherOptionSelectability:
//           json[MembershipTypeFields.otherOptionSelectability] == 1,
//       templateLimit: json[MembershipTypeFields.templateLimit] as int,
//       amountOfReplicableActivity:
//           json[MembershipTypeFields.amountOfReplicableActivity] as int,
//       repetitionLimit: json[MembershipTypeFields.repetitionLimit] as int,
//       likeability: json[MembershipTypeFields.likeability] == 1,
//       followabilityToUser: json[MembershipTypeFields.followabilityToUser] == 1,
//       followabilityByUser: json[MembershipTypeFields.followabilityByUser] == 1,
//       followerViewability: json[MembershipTypeFields.followerViewability] == 1,
//       hideAds: json[MembershipTypeFields.hideAds] == 1,
//       monthlyPrice: json[MembershipTypeFields.monthlyPrice] as double,
//       description: json[MembershipTypeFields.description] as String,
//       createdAt: DateTime.parse(json[MembershipTypeFields.createdAt] as String),
//       stoppedAt: DateTime.parse(json[MembershipTypeFields.stoppedAt] as String),
//       updatedAt: DateTime.parse(json[MembershipTypeFields.updatedAt] as String),
//       isStopped: json[MembershipTypeFields.isStopped] == 1,
//       isUpdated: json[MembershipTypeFields.isUpdated] == 1,
//       isActive: json[MembershipTypeFields.isActive] == 1,
//     );

// Map<String, dynamic> toMap() => {
//       MembershipTypeFields.membershipTypeId: membershipTypeId,
//       MembershipTypeFields.membershipTypeName: membershipTypeName,
//       MembershipTypeFields.limitOfCreatingActivityPerDay:
//           limitOfCreatingActivityPerDay,
//       MembershipTypeFields.limitOfAttendancePerDay: limitOfAttendancePerDay,
//       MembershipTypeFields.multipleActivitySearchability:
//           multipleActivitySearchability ? 1 : 0,
//       MembershipTypeFields.gpsLocationChangeability:
//           gpsLocationChangeability ? 1 : 0,
//       MembershipTypeFields.locationCircularDiameter: locationCircularDiameter,
//       MembershipTypeFields.boostTypeId: boostTypeId,
//       MembershipTypeFields.limitOfFreeBoost: limitOfFreeBoost,
//       MembershipTypeFields.ageClassificationSelectability:
//           ageClassificationSelectability ? 1 : 0,
//       MembershipTypeFields.otherOptionSelectability:
//           otherOptionSelectability ? 1 : 0,
//       MembershipTypeFields.templateLimit: templateLimit,
//       MembershipTypeFields.amountOfReplicableActivity:
//           amountOfReplicableActivity,
//       MembershipTypeFields.repetitionLimit: repetitionLimit,
//       MembershipTypeFields.likeability: likeability ? 1 : 0,
//       MembershipTypeFields.followabilityToUser: followabilityToUser ? 1 : 0,
//       MembershipTypeFields.followabilityByUser: followabilityByUser ? 1 : 0,
//       MembershipTypeFields.followerViewability: followerViewability ? 1 : 0,
//       MembershipTypeFields.hideAds: hideAds ? 1 : 0,
//       MembershipTypeFields.monthlyPrice: monthlyPrice,
//       MembershipTypeFields.description: description,
//       MembershipTypeFields.createdAt: createdAt.toIso8601String(),
//       MembershipTypeFields.stoppedAt: stoppedAt?.toIso8601String(),
//       MembershipTypeFields.updatedAt: updatedAt?.toIso8601String(),
//       MembershipTypeFields.isStopped: isStopped ? 1 : 0,
//       MembershipTypeFields.isUpdated: isUpdated ? 1 : 0,
//       MembershipTypeFields.isActive: isActive ? 1 : 0,
//     };
