part of 'user_bloc.dart';

class UserState extends Equatable {
  final List<User> userList;
  final String error;
  final Status status;

  const UserState({
    this.userList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  UserState copyWith({
    List<User>? userList,
    String? error,
    Status? status,
  }) {
    return UserState(
      userList: userList ?? this.userList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [userList, error, status];

  @override
  String toString() =>
      'UserState(UserList: $userList, error: $error, status: $status)';
}
