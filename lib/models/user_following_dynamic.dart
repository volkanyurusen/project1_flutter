// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'user_following_dynamic.g.dart';

const String tblUserFollowings = 'tblUserFollowings';

class UserFollowingDynamicFields {
  static final List<String> values = [
    userFollowingId,
    requester,
    requestedUser,
    processDetailId,
    requestDate,
    approvedDate,
    deniedDate,
    recalledDate,
    updatedDate,
    isDenied,
    isApproved,
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
}

@JsonSerializable()
class UserFollowingDynamic extends Equatable {
  final int? userFollowingId;
  final UserDynamic requester;
  final UserDynamic requestedUser;
  final ProcessDetailDynamic processDetailDynamic;
  final DateTime requestDate;
  final DateTime? approvedDate;
  final DateTime? deniedDate;
  final DateTime? recalledDate;
  final DateTime? updatedDate;
  final bool isDenied;
  final bool isApproved;

  UserFollowingDynamic({
    this.userFollowingId,
    required this.requester,
    required this.requestedUser,
    required this.processDetailDynamic,
    DateTime? requestDate,
    this.approvedDate,
    this.deniedDate,
    this.recalledDate,
    this.updatedDate,
    this.isDenied = false,
    this.isApproved = false,
  }) : requestDate = requestDate ?? DateTime.now();

  UserFollowingDynamic copy({
    int? userFollowingId,
    UserDynamic? requester,
    UserDynamic? requestedUser,
    ProcessDetailDynamic? processDetailDynamic,
    DateTime? requestDate,
    DateTime? approvedDate,
    DateTime? deniedDate,
    DateTime? recalledDate,
    DateTime? updatedDate,
    bool? isDenied,
    bool? isApproved,
  }) =>
      UserFollowingDynamic(
        userFollowingId: userFollowingId ?? this.userFollowingId,
        requester: requester ?? this.requester,
        requestedUser: requestedUser ?? this.requestedUser,
        processDetailDynamic: processDetailDynamic ?? this.processDetailDynamic,
        requestDate: requestDate ?? this.requestDate,
        approvedDate: approvedDate ?? this.approvedDate,
        deniedDate: deniedDate ?? this.deniedDate,
        recalledDate: recalledDate ?? this.recalledDate,
        updatedDate: updatedDate ?? this.updatedDate,
        isDenied: isDenied ?? this.isDenied,
        isApproved: isApproved ?? this.isApproved,
      );

  factory UserFollowingDynamic.fromJson(Map<String, dynamic> json) =>
      _$UserFollowingDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$UserFollowingDynamicToJson(this);

  @override
  List<Object?> get props => [
        userFollowingId,
        requester,
        requestedUser,
        processDetailDynamic,
        requestDate,
        approvedDate,
        deniedDate,
        recalledDate,
        updatedDate,
        isDenied,
        isApproved,
      ];

  @override
  String toString() {
    return 'UserFollowingDynamic(userFollowingId: $userFollowingId, requester: $requester, requestedUser: $requestedUser, processDetailDynamic: $processDetailDynamic, requestDate: $requestDate, approvedDate: $approvedDate, deniedDate: $deniedDate, recalledDate: $recalledDate, updatedDate: $updatedDate, isDenied: $isDenied, isApproved: $isApproved)';
  }
}
