part of 'user_dynamic_bloc.dart';

class UserDynamicState extends Equatable {
  final List<UserDynamic> userDynamicList;
  final String error;
  final Status status;

  const UserDynamicState({
    this.userDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  UserDynamicState copyWith({
    List<UserDynamic>? userDynamicList,
    String? error,
    Status? status,
  }) {
    return UserDynamicState(
      userDynamicList: userDynamicList ?? this.userDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [userDynamicList, error, status];

  @override
  String toString() =>
      'UserDynamicState(UserDynamicList: $userDynamicList, error: $error, status: $status)';
}
