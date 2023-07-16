// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'user_blocking_dynamic.g.dart';

const String tblUserBlockings = 'tblUserBlockings';

class UserBlockingDynamicFields {
  static final List<String> values = [
    /// Add all fields here
    userBlockingId, blocker, blockedUser, blockingDate, recalledDate,
    updatedDate, isRecalled,
  ];
  static const String userBlockingId = 'user_blocking_id';
  static const String blocker = 'blocker';
  static const String blockedUser = 'blocked_user';
  static const String blockingDate = 'blocking_date';
  static const String recalledDate = 'recalled_date';
  static const String updatedDate = 'updated_date';
  static const String isRecalled = 'is_recalled';
}

@JsonSerializable()
class UserBlockingDynamic extends Equatable {
  final int? userBlockingId;
  final UserDynamic blocker;
  final UserDynamic blockedUser;
  final DateTime blockingDate;
  final DateTime? recalledDate;
  final DateTime? updatedDate;
  final bool isRecalled;

  UserBlockingDynamic({
    this.userBlockingId,
    required this.blocker,
    required this.blockedUser,
    DateTime? blockingDate,
    this.recalledDate,
    this.updatedDate,
    this.isRecalled = false,
  }) : blockingDate = blockingDate ?? DateTime.now();

  UserBlockingDynamic copy({
    int? userBlockingId,
    UserDynamic? blocker,
    UserDynamic? blockedUser,
    DateTime? blockingDate,
    DateTime? recalledDate,
    DateTime? updatedDate,
    bool? isRecalled,
  }) =>
      UserBlockingDynamic(
        userBlockingId: userBlockingId ?? this.userBlockingId,
        blocker: blocker ?? this.blocker,
        blockedUser: blockedUser ?? this.blockedUser,
        blockingDate: blockingDate ?? this.blockingDate,
        recalledDate: recalledDate ?? this.recalledDate,
        updatedDate: updatedDate ?? this.updatedDate,
        isRecalled: isRecalled ?? this.isRecalled,
      );

  factory UserBlockingDynamic.fromJson(Map<String, dynamic> json) =>
      _$UserBlockingDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$UserBlockingDynamicToJson(this);

  @override
  List<Object?> get props => [
        userBlockingId,
        blocker,
        blockedUser,
        blockingDate,
        recalledDate,
        updatedDate,
        isRecalled,
      ];

  @override
  String toString() {
    return 'tblUserBlockings(user_blocking_id: $userBlockingId, blocker: $blocker, blocked_user: $blockedUser, blocking_date: $blockingDate, recalled_date: $recalledDate, updated_date: $updatedDate, is_recalled: $isRecalled)';
  }
}
