part of 'user_liking_dynamic_by_user_bloc.dart';

class UserLikingDynamicByUserState extends Equatable {
  final List<UserLikingDynamic> userLikingDynamicList;
  final String error;
  final Status status;

  const UserLikingDynamicByUserState({
    this.userLikingDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  UserLikingDynamicByUserState copyWith({
    List<UserLikingDynamic>? userLikingDynamicList,
    String? error,
    Status? status,
  }) {
    return UserLikingDynamicByUserState(
      userLikingDynamicList:
          userLikingDynamicList ??
              this.userLikingDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props =>
      [userLikingDynamicList, error, status];

  @override
  String toString() =>
      'UserLikingDynamicByUserState(userLikingDynamicList: $userLikingDynamicList, error: $error, status: $status)';
}
