// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:my_project/models/models.dart';

part 'user_liking.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblUserLikings = 'tblUserLikings';

class UserLikingFields {
  static final List<String> values = [
    /// Add all fields here
    userLikingId, likingUser, likedUser, createdAt, deactivatedAt, updatedAt,
    isActive,
  ];

  static const String userLikingId = 'user_liking_id';
  static const String likingUser = 'liking_user';
  static const String likedUser = 'liked_user';
  static const String createdAt = 'created_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

/// usersliking was created for all users to be able to have an idea about
/// other users' potential whether they are nice, enjoyable, good buddies,
/// or not.
///
// @JsonSerializable()
class UserLiking extends Equatable {
  final int? userLikingId;
  final User likingUser;
  final User likedUser;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  UserLiking({
    this.userLikingId,
    required this.likingUser,
    required this.likedUser,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : createdAt = createdAt ?? DateTime.now();

  UserLiking copy({
    int? userLikingId,
    User? likingUser,
    User? likedUser,
    DateTime? createdAt,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      UserLiking(
        userLikingId: userLikingId ?? this.userLikingId,
        likingUser: likingUser ?? this.likingUser,
        likedUser: likedUser ?? this.likedUser,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory UserLiking.fromJson(Map<String, dynamic> json) =>
      _$UserLikingFromJson(json);

  Map<String, dynamic> toJson() => _$UserLikingToJson(this);

  @override
  List<Object?> get props => [
        userLikingId,
        likingUser,
        likedUser,
        createdAt,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblUserLikings(user_liking_id: $userLikingId, liking_user: $likingUser, liked_user: $likedUser, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}

// UserLiking fromMap(Map<String, dynamic> json) => UserLiking(
//       userLikingId: json[UserLikingFields.userLikingId] as int?,
//       likingUser: json[UserLikingFields.likingUser] as int,
//       likedUser: json[UserLikingFields.likedUser] as int,
//       createdAt: DateTime.parse(json[UserLikingFields.createdAt] as String),
//       deactivatedAt:
//           DateTime.parse(json[UserLikingFields.deactivatedAt] as String),
//       updatedAt: DateTime.parse(json[UserLikingFields.updatedAt] as String),
//       isActive: json[UserLikingFields.isActive] == 1,
//     );

// Map<String, dynamic> toMap() => {
//       UserLikingFields.userLikingId: userLikingId,
//       UserLikingFields.likingUser: likingUser,
//       UserLikingFields.likedUser: likedUser,
//       UserLikingFields.createdAt: createdAt.toIso8601String(),
//       UserLikingFields.deactivatedAt: deactivatedAt?.toIso8601String(),
//       UserLikingFields.updatedAt: updatedAt?.toIso8601String(),
//       UserLikingFields.isActive: isActive ? 1 : 0,
//     };
