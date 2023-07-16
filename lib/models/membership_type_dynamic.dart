// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'membership_type_dynamic.g.dart';

const String tblMembershipTypes = 'tblMembershipTypes';

class MembershipTypeDynamicFields {
  static final List<String> values = [
    /// Add all fields here
    membershipTypeId, membershipTypeName, limitOfCreatingActivityPerDay,
    limitOfAttendancePerDay, locationCircularDiameter, templateLimit,
  ];
  static const String membershipTypeId = 'membership_type_id';
  static const String membershipTypeName = 'membership_type_name';
  static const String limitOfCreatingActivityPerDay =
      'limit_of_creating_activity_per_day';
  static const String limitOfAttendancePerDay = 'limit_of_attendance_per_day';
  static const String locationCircularDiameter = 'location_circular_diameter';
  static const String templateLimit = 'template_limit';
}

@JsonSerializable()
class MembershipTypeDynamic extends Equatable {
  final int? membershipTypeId;
  final String membershipTypeName;
  final int limitOfCreatingActivityPerDay;
  final int limitOfAttendancePerDay;
  final double locationCircularDiameter;
  final int templateLimit;

  const MembershipTypeDynamic({
    this.membershipTypeId,
    required this.membershipTypeName,
    required this.limitOfCreatingActivityPerDay,
    required this.limitOfAttendancePerDay,
    required this.locationCircularDiameter,
    required this.templateLimit,
  });

  MembershipTypeDynamic copy({
    int? membershipTypeId,
    String? membershipTypeName,
    int? limitOfCreatingActivityPerDay,
    int? limitOfAttendancePerDay,
    double? locationCircularDiameter,
    int? templateLimit,
  }) =>
      MembershipTypeDynamic(
        membershipTypeId: membershipTypeId ?? this.membershipTypeId,
        membershipTypeName: membershipTypeName ?? this.membershipTypeName,
        limitOfCreatingActivityPerDay:
            limitOfCreatingActivityPerDay ?? this.limitOfCreatingActivityPerDay,
        limitOfAttendancePerDay:
            limitOfAttendancePerDay ?? this.limitOfAttendancePerDay,
        locationCircularDiameter:
            locationCircularDiameter ?? this.locationCircularDiameter,
        templateLimit: templateLimit ?? this.templateLimit,
      );

  factory MembershipTypeDynamic.fromJson(Map<String, dynamic> json) =>
      _$MembershipTypeDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$MembershipTypeDynamicToJson(this);

  @override
  List<Object?> get props => [
        membershipTypeId,
        membershipTypeName,
        limitOfCreatingActivityPerDay,
        limitOfAttendancePerDay,
        locationCircularDiameter,
        templateLimit,
      ];

  @override
  String toString() {
    return 'MembershipTypeDynamic(membershipTypeId: $membershipTypeId, membershipTypeName: $membershipTypeName, limitOfCreatingActivityPerDay: $limitOfCreatingActivityPerDay, limitOfAttendancePerDay: $limitOfAttendancePerDay, locationCircularDiameter: $locationCircularDiameter, template_limit: $templateLimit)';
  }
}
