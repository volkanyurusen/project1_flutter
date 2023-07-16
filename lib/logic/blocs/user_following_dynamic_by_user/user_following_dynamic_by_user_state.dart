part of 'user_following_dynamic_by_user_bloc.dart';

class UserFollowingDynamicByUserState extends Equatable {
  final List<UserFollowingDynamic> userFollowingDynamicList;
  final String error;
  final Status status;

  const UserFollowingDynamicByUserState({
    this.userFollowingDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  UserFollowingDynamicByUserState copyWith({
    List<UserFollowingDynamic>? userFollowingDynamicList,
    String? error,
    Status? status,
  }) {
    return UserFollowingDynamicByUserState(
      userFollowingDynamicList:
          userFollowingDynamicList ?? this.userFollowingDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [userFollowingDynamicList, error, status];

  @override
  String toString() =>
      'UserFollowingDynamicByUserState(userFollowingDynamicList: $userFollowingDynamicList, error: $error, status: $status)';
}
