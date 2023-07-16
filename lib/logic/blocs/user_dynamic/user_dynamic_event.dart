part of 'user_dynamic_bloc.dart';

abstract class UserDynamicEvent extends Equatable {
  const UserDynamicEvent();

  @override
  List<Object> get props => [];
}

class LoadUserDynamicEvent extends UserDynamicEvent {
  final int uId;

  const LoadUserDynamicEvent({
    required this.uId,
  });

  @override
  List<Object> get props => [uId];
}

class RecallUserDynamicEvent extends UserDynamicEvent {}
