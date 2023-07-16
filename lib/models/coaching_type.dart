// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:my_project/models/models.dart';

part 'coaching_type.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblCoachingTypes = 'tblCoachingTypes';

class CoachingTypeFields {
  static final List<String> values = [
    /// Add all fields here
    coachingTypeId, coachingTypeName, creatingTrainingLimitPerDay,
    studentSearchability, gpsLocationChangeability,
    locationCircularDiameter, boostTypeId, limitOfFreeBoost,
    ageClassificationSelectability, otherOptionSelectability, templateLimit,
    amountOfReplicableActivity, likeability, followabilityToUser,
    followabilityByUser, followerViewability, hideAds, monthlyPrice,
    description, createdAt, stoppedAt, updatedAt, isStopped, isUpdated,
    isActive,
  ];

  static const String coachingTypeId = 'coaching_type_id';
  static const String coachingTypeName = 'coaching_type_name';
  static const String creatingTrainingLimitPerDay =
      'creating_training_limit_per_day';
  static const String studentSearchability = 'student_searchability';
  // static const String multipleSportCoachability = 'multipleSportCoachability';
  static const String gpsLocationChangeability = 'gps_location_changeability';
  static const String locationCircularDiameter = 'location_circular_diameter';
  static const String limitOfFreeBoost = 'limit_of_free_boost';
  static const String ageClassificationSelectability =
      'age_classification_selectability';
  static const String otherOptionSelectability = 'other_option_selectability';
  static const String templateLimit = 'template_limit';
  static const String amountOfReplicableActivity =
      'amount_of_replicable_activity';
  // static const String repetitionLimit = 'repetitionLimit';
  static const String likeability = 'likeability';
  static const String followabilityToUser = 'followability_to_user';
  static const String followabilityByUser = 'followability_by_user';
  static const String followerViewability = 'follower_viewability';
  static const String hideAds = 'hide_ads';
  static const String monthlyPrice = 'monthly_price';
  static const String description = 'description';
  static const String boostTypeId = 'boost_type_id';
  static const String createdAt = 'created_at';
  static const String stoppedAt = 'stopped_at';
  static const String updatedAt = 'updated_at';
  static const String isStopped = 'is_stopped';
  static const String isUpdated = 'is_updated';
  static const String isActive = 'is_active';
}

/// This table contains all coachings details. Coaching feature will be added later (for now). All
/// coaches must be users first, then they can change their account from users to coach by making
/// payment of relevant coaching type. They can change  the type of their coaching at any time by \
/// making payments. The coaching types and all column details are below.
///
/// Basic, High, Platinum
///
/// coachingTypeName;                 Basic             High            Platinum
/// creatingTrainingLimitPerDay;     1                 5                255
/// studentSearchability;             false            false             true
/// multipleSportCoachability;         2                 5                255
/// gpsLocationChangeability;         false            false             true
/// locationCircularDiameter;          3                10                255
/// boostTypeId;                       5                 5                 5
/// limitOfFreeBoost;                  0                 1                 5
/// ageClassificationSelectability;   false            true              true
/// otherOptionSelectability;         true             true              true
/// templateLimit;                     1                 3               100
/// amountOfReplicableActivity;        1                 3               100
//// repetitionLimit;                  3                 7                30
/// likeability;                      true             true              true
/// followabilityToTrainee;           false            true              true
/// followabilityByTrainee;           false            true              true
/// followerViewability;              false            false             true
/// hideAds;                          true             true              true
/// monthlyPrice;                     9.99             19.99             59.99
/// description;                   will be added    will be added      will be added
/// createdAt;                        date             date              date
/// stoppedAt;                        date             date              date
/// updatedAt;                        date             date              date
/// isStopped;                        bool             bool              bool
/// isUpdated;                        bool             bool              bool
/// isActive;                         bool             bool              bool

// @JsonSerializable()
class CoachingType extends Equatable {
  final int? coachingTypeId;
  final String coachingTypeName;
  final int creatingTrainingLimitPerDay;
  // final bool multipleSportCoachability;
  final bool gpsLocationChangeability;
  final double locationCircularDiameter;
  final int limitOfFreeBoost;
  final bool ageClassificationSelectability;
  final bool otherOptionSelectability;
  final int templateLimit;
  final int amountOfReplicableActivity;
  // final int repetitionLimit;
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

  CoachingType({
    this.coachingTypeId,
    required this.coachingTypeName,
    required this.creatingTrainingLimitPerDay,
    // required this.multipleSportCoachability,
    required this.gpsLocationChangeability,
    required this.locationCircularDiameter,
    required this.limitOfFreeBoost,
    required this.ageClassificationSelectability,
    required this.otherOptionSelectability,
    required this.templateLimit,
    required this.amountOfReplicableActivity,
    // required this.repetitionLimit,
    this.likeability = true,
    required this.followabilityToUser,
    required this.followabilityByUser,
    required this.followerViewability,
    this.hideAds = true,
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

  CoachingType copy({
    int? coachingTypeId,
    String? coachingTypeName,
    int? creatingTrainingLimitPerDay,
    // bool? multipleSportCoachability,
    bool? gpsLocationChangeability,
    double? locationCircularDiameter,
    int? limitOfFreeBoost,
    bool? ageClassificationSelectability,
    bool? otherOptionSelectability,
    int? templateLimit,
    int? amountOfReplicableActivity,
    // int repetitionLimit,
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
      CoachingType(
        coachingTypeId: coachingTypeId ?? this.coachingTypeId,
        coachingTypeName: coachingTypeName ?? this.coachingTypeName,
        creatingTrainingLimitPerDay:
            creatingTrainingLimitPerDay ?? this.creatingTrainingLimitPerDay,
        // multipleSportCoachability:
        //     multipleSportCoachability ?? this.multipleSportCoachability,
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
        likeability: likeability ?? this.likeability,
        followabilityToUser: followabilityToUser ?? this.followabilityToUser,
        followabilityByUser: followabilityByUser ?? this.followabilityByUser,
        followerViewability: followerViewability ?? this.followerViewability,
        hideAds: hideAds ?? this.hideAds,
        monthlyPrice: monthlyPrice ?? this.monthlyPrice,
        boostType: boostType ?? this.boostType,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        stoppedAt: stoppedAt ?? this.stoppedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isStopped: isStopped ?? this.isStopped,
        isUpdated: isUpdated ?? this.isUpdated,
        isActive: isActive ?? this.isActive,
      );

  factory CoachingType.fromJson(Map<String, dynamic> json) =>
      _$CoachingTypeFromJson(json);

  Map<String, dynamic> toJson() => _$CoachingTypeToJson(this);

  @override
  List<Object?> get props => [
        coachingTypeId,
        coachingTypeName,
        creatingTrainingLimitPerDay,
        // multipleSportCoachability,
        gpsLocationChangeability,
        locationCircularDiameter,
        limitOfFreeBoost,
        ageClassificationSelectability,
        otherOptionSelectability,
        templateLimit,
        amountOfReplicableActivity,
        // int repetitionLimit,
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
    return 'tblCoachingTypes(coaching_type_id: $coachingTypeId, coaching_type_name: $coachingTypeName, limit_of_creating_training_per_day: $creatingTrainingLimitPerDay, gps_location_changeability: $gpsLocationChangeability, location_circular_diameter: $locationCircularDiameter,  limit_of_free_boost: $limitOfFreeBoost, age_classification_selectability: $ageClassificationSelectability, other_option_selectability: $otherOptionSelectability, template_limit: $templateLimit, amount_of_replicable_activity: $amountOfReplicableActivity, likeability: $likeability, followability_to_user: $followabilityToUser, followability_by_user: $followabilityByUser, follower_viewability: $followerViewability, hide_ads: $hideAds, monthly_price: $monthlyPrice, description: $description, boost_type_id: $boostType, created_at: $createdAt, stopped_at: $stoppedAt, updated_at: $updatedAt, is_stopped: $isStopped, is_updated: $isUpdated, is_active: $isActive)';
  }
}
