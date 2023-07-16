// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'gender.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblGenders = 'tblGenders';

class GenderFields {
  static final List<String> values = [
    /// Add all fields here
    genderId, genderDetail, createdAt, deactivatedAt, updatedAt, isActive,
  ];

  static const String genderId = 'gender_id';
  static const String genderDetail = 'gender_detail';
  static const String createdAt = 'created_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

// @JsonSerializable()
class Gender extends Equatable {
  final int? genderId;
  final String genderDetail;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  Gender({
    this.genderId,
    required this.genderDetail,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : createdAt = createdAt ?? DateTime.now();

  Gender copy({
    int? genderId,
    String? genderDetail,
    DateTime? createdAt,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      Gender(
        genderId: genderId ?? this.genderId,
        genderDetail: genderDetail ?? this.genderDetail,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory Gender.fromJson(Map<String, dynamic> json) => _$GenderFromJson(json);

  Map<String, dynamic> toJson() => _$GenderToJson(this);

  @override
  List<Object?> get props => [
        genderId,
        genderDetail,
        createdAt,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblGenders(gender_id: $genderId, gender_detail: $genderDetail, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}
