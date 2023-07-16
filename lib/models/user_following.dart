// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

import 'package:my_project/models/models.dart';

part 'user_following.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblUserFollowings = 'tblUserFollowings';

class UserFollowingFields {
  static final List<String> values = [
    /// Add all fields here
    userFollowingId, requester, requestedUser, processDetailId, requestDate,
    approvedDate, deniedDate, recalledDate, updatedDate, isDenied, isApproved, isActive,
  ];

  static const String userFollowingId = 'user_following_id';
  static const String requester = 'requester';
  static const String requestedUser = 'requested_user';
  static const String processDetailId = 'process_detail_id';
  static const String requestDate = 'request_date';
  static const String approvedDate = 'approved_date';
  static const String deniedDate = 'denied_date';
  static const String recalledDate = 'recalled_date';
  static const String updatedDate = 'updated_date';
  static const String isDenied = 'is_denied';
  static const String isApproved = 'is_approved';
  static const String isActive = 'is_active';
}

/// this table as its name suggests keeps the list of users who follow each other.
///
/// requestedUser is the user who sends a request to another user to follow him/her.
/// requester is the user who is blocked by blocker.
///
// @JsonSerializable()
class UserFollowing extends Equatable {
  final int? userFollowingId;
  final User requester;
  final User requestedUser;
  final ProcessDetail processDetail;
  final DateTime requestDate;
  final DateTime? approvedDate;
  final DateTime? deniedDate;
  final DateTime? recalledDate;
  final DateTime? updatedDate;
  final bool isDenied;
  final bool isApproved;
  final bool isActive;

  UserFollowing({
    this.userFollowingId,
    required this.requester,
    required this.requestedUser,
    required this.processDetail,
    DateTime? requestDate,
    this.approvedDate,
    this.deniedDate,
    this.recalledDate,
    this.updatedDate,
    this.isDenied = false,
    this.isApproved = false,
    this.isActive = true,
  }) : requestDate = requestDate ?? DateTime.now();

  UserFollowing copy({
    int? userFollowingId,
    User? requester,
    User? requestedUser,
    ProcessDetail? processDetail,
    DateTime? requestDate,
    DateTime? approvedDate,
    DateTime? deniedDate,
    DateTime? recalledDate,
    DateTime? updatedDate,
    bool? isDenied,
    bool? isApproved,
    bool? isActive,
  }) =>
      UserFollowing(
        userFollowingId: userFollowingId ?? this.userFollowingId,
        requester: requester ?? this.requester,
        requestedUser: requestedUser ?? this.requestedUser,
        processDetail: processDetail ?? this.processDetail,
        requestDate: requestDate ?? this.requestDate,
        approvedDate: approvedDate ?? this.approvedDate,
        deniedDate: deniedDate ?? this.deniedDate,
        recalledDate: recalledDate ?? this.recalledDate,
        updatedDate: updatedDate ?? this.updatedDate,
        isDenied: isDenied ?? this.isDenied,
        isApproved: isApproved ?? this.isApproved,
        isActive: isActive ?? this.isActive,
      );

  factory UserFollowing.fromJson(Map<String, dynamic> json) =>
      _$UserFollowingFromJson(json);

  Map<String, dynamic> toJson() => _$UserFollowingToJson(this);

  @override
  List<Object?> get props => [
        userFollowingId,
        requester,
        requestedUser,
        processDetail,
        requestDate,
        approvedDate,
        deniedDate,
        recalledDate,
        updatedDate,
        isDenied,
        isApproved,
        isActive,
      ];



  @override
  String toString() {
    return 'UserFollowing(userFollowingId: $userFollowingId, requester: $requester, requestedUser: $requestedUser, processDetail: $processDetail, requestDate: $requestDate, approvedDate: $approvedDate, deniedDate: $deniedDate, recalledDate: $recalledDate, updatedDate: $updatedDate, isDenied: $isDenied, isApproved: $isApproved, isActive: $isActive)';
  }
}
