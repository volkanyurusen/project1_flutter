part of 'user_control_cubit.dart';

class UserControlState extends Equatable {
  final List<String> userControlList;

  const UserControlState({
    required this.userControlList,
  });

  UserControlState copyWith({
    List<String>? userControlList,
  }) {
    return UserControlState(
      userControlList: userControlList ?? this.userControlList,
    );
  }

  @override
  List<Object> get props => [userControlList];
}
