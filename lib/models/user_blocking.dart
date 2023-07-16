// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:my_project/models/models.dart';

part 'user_blocking.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblUserBlockings = 'tblUserBlockings';

class UserBlockingFields {
  static final List<String> values = [
    /// Add all fields here
    userBlockingId, blocker, blockedUser, blockingDate, recalledDate,
    updatedDate, isRecalled, isActive,
  ];

  static const String userBlockingId = 'user_blocking_id';
  static const String blocker = 'blocker';
  static const String blockedUser = 'blocked_user';
  static const String blockingDate = 'blocking_date';
  static const String recalledDate = 'recalled_date';
  static const String updatedDate = 'updated_date';
  static const String isRecalled = 'is_recalled';
  static const String isActive = 'is_active';
}

/// this table as its name suggests keeps the list of users who block each other.
///
/// blocker is the user who blocks another user.
/// blockedUser is the user who is blocked by blocker.
///
// @JsonSerializable()
class UserBlocking extends Equatable {
  final int? userBlockingId;
  final User blocker;
  final User blockedUser;
  final DateTime blockingDate;
  final DateTime? recalledDate;
  final DateTime? updatedDate;
  final bool isRecalled;
  final bool isActive;

  UserBlocking({
    this.userBlockingId,
    required this.blocker,
    required this.blockedUser,
    DateTime? blockingDate,
    this.recalledDate,
    this.updatedDate,
    this.isRecalled = false,
    this.isActive = true,
  }) : blockingDate = blockingDate ?? DateTime.now();

  UserBlocking copy({
    int? userBlockingId,
    User? blocker,
    User? blockedUser,
    DateTime? blockingDate,
    DateTime? recalledDate,
    DateTime? updatedDate,
    bool? isRecalled,
    bool? isActive,
  }) =>
      UserBlocking(
        userBlockingId: userBlockingId ?? this.userBlockingId,
        blocker: blocker ?? this.blocker,
        blockedUser: blockedUser ?? this.blockedUser,
        blockingDate: blockingDate ?? this.blockingDate,
        recalledDate: recalledDate ?? this.recalledDate,
        updatedDate: updatedDate ?? this.updatedDate,
        isRecalled: isRecalled ?? this.isRecalled,
        isActive: isActive ?? this.isActive,
      );

  factory UserBlocking.fromJson(Map<String, dynamic> json) =>
      _$UserBlockingFromJson(json);

  Map<String, dynamic> toJson() => _$UserBlockingToJson(this);

  @override
  List<Object?> get props => [
        userBlockingId,
        blocker,
        blockedUser,
        blockingDate,
        recalledDate,
        updatedDate,
        isRecalled,
        isActive,
      ];

  @override
  String toString() {
    return 'tblUserBlockings(user_blocking_id: $userBlockingId, blocker: $blocker, blocked_user: $blockedUser, blocking_date: $blockingDate, recalled_date: $recalledDate, updated_date: $updatedDate, is_recalled: $isRecalled, is_active: $isActive)';
  }
}
