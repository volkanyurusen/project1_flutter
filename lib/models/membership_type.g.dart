// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membership_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MembershipType _$MembershipTypeFromJson(Map<String, dynamic> json) =>
    MembershipType(
      membershipTypeId: json['membership_type_id'] as int?,
      membershipTypeName: json['membership_type_name'] as String,
      limitOfCreatingActivityPerDay:
          json['limit_of_creating_activity_per_day'] as int,
      limitOfAttendancePerDay: json['limit_of_attendance_per_day'] as int,
      multipleActivitySearchability:
          json['multiple_activity_searchability'] as bool? ?? true,
      gpsLocationChangeability: json['gps_location_changeability'] as bool,
      locationCircularDiameter:
          double.parse(json['location_circular_diameter']),
      limitOfFreeBoost: json['limit_of_free_boost'] as int,
      ageClassificationSelectability:
          json['age_classification_selectability'] as bool,
      otherOptionSelectability:
          json['other_option_selectability'] as bool? ?? true,
      templateLimit: json['template_limit'] as int,
      amountOfReplicableActivity: json['amount_of_replicable_activity'] as int,
      repetitionLimit: json['repetition_limit'] as int,
      likeability: json['likeability'] as bool,
      followabilityToUser: json['followability_to_user'] as bool,
      followabilityByUser: json['followability_by_user'] as bool,
      followerViewability: json['follower_viewability'] as bool,
      hideAds: json['hide_ads'] as bool,
      monthlyPrice: double.parse(json['monthly_price']),
      description: json['description'] as String,
      boostType:
          BoostType.fromJson(json['boost_type_id'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      stoppedAt: json['stopped_at'] == null
          ? null
          : DateTime.parse(json['stopped_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      isStopped: json['is_stopped'] as bool? ?? false,
      isUpdated: json['is_updated'] as bool? ?? false,
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$MembershipTypeToJson(MembershipType instance) =>
    <String, dynamic>{
      'membership_type_id': instance.membershipTypeId,
      'membership_type_name': instance.membershipTypeName,
      'limit_of_creating_activity_per_day':
          instance.limitOfCreatingActivityPerDay,
      'limit_of_attendance_per_day': instance.limitOfAttendancePerDay,
      'multiple_activity_searchability': instance.multipleActivitySearchability,
      'gps_location_changeability': instance.gpsLocationChangeability,
      'location_circular_diameter': instance.locationCircularDiameter,
      'limit_of_free_boost': instance.limitOfFreeBoost,
      'age_classification_selectability':
          instance.ageClassificationSelectability,
      'other_option_selectability': instance.otherOptionSelectability,
      'template_limit': instance.templateLimit,
      'amount_of_replicable_activity': instance.amountOfReplicableActivity,
      'repetition_limit': instance.repetitionLimit,
      'likeability': instance.likeability,
      'followability_to_user': instance.followabilityToUser,
      'followability_by_user': instance.followabilityByUser,
      'follower_viewability': instance.followerViewability,
      'hide_ads': instance.hideAds,
      'monthly_price': instance.monthlyPrice,
      'description': instance.description,
      'boost_type_id': instance.boostType,
      'created_at': instance.createdAt.toIso8601String(),
      'stopped_at': instance.stoppedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_stopped': instance.isStopped,
      'is_updated': instance.isUpdated,
      'is_active': instance.isActive,
    };
