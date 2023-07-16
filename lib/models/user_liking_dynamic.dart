// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'user_liking_dynamic.g.dart';

const String tblUserLikings = 'tblUserLikings';

class UserLikingDynamicFields {
  static final List<String> values = [
    /// Add all fields here
    userLikingId, likingUser, likedUser,
  ];

  static const String userLikingId = 'user_liking_id';
  static const String likingUser = 'liking_user';
  static const String likedUser = 'liked_user';
}

@JsonSerializable()
class UserLikingDynamic extends Equatable {
  final int? userLikingId;
  final UserDynamic likingUser;
  final UserDynamic likedUser;

  const UserLikingDynamic({
    this.userLikingId,
    required this.likingUser,
    required this.likedUser,
  });

  UserLikingDynamic copy({
    int? userLikingId,
    UserDynamic? likingUser,
    UserDynamic? likedUser,
  }) =>
      UserLikingDynamic(
        userLikingId: userLikingId ?? this.userLikingId,
        likingUser: likingUser ?? this.likingUser,
        likedUser: likedUser ?? this.likedUser,
      );

  factory UserLikingDynamic.fromJson(Map<String, dynamic> json) =>
      _$UserLikingDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$UserLikingDynamicToJson(this);

  @override
  List<Object?> get props => [
        userLikingId,
        likingUser,
        likedUser,
      ];

  @override
  String toString() {
    return 'tblUserLikings(user_liking_id: $userLikingId, liking_user: $likingUser, liked_user: $likedUser)';
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
