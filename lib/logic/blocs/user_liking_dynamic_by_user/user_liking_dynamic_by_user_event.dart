part of 'user_liking_dynamic_by_user_bloc.dart';

abstract class UserLikingDynamicByUserEvent extends Equatable {
  const UserLikingDynamicByUserEvent();

  @override
  List<Object> get props => [];
}

class LoadUserLikingDynamicByUserEvent
    extends UserLikingDynamicByUserEvent {
  final int uId;

  const LoadUserLikingDynamicByUserEvent({
    required this.uId,
  });

  @override
  List<Object> get props => [uId];
}
