part of 'user_following_dynamic_by_user_bloc.dart';

abstract class UserFollowingDynamicByUserEvent extends Equatable {
  const UserFollowingDynamicByUserEvent();

  @override
  List<Object> get props => [];
}

class LoadUserFollowingDynamicByUserEvent
    extends UserFollowingDynamicByUserEvent {
  final int uId;

  const LoadUserFollowingDynamicByUserEvent({
    required this.uId,
  });

  @override
  List<Object> get props => [uId];
}
