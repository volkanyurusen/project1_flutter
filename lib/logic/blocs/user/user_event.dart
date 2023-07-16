part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUserEvent extends UserEvent {
  final int uId;

  const LoadUserEvent({
    required this.uId,
  });

  @override
  List<Object> get props => [uId];
}

class RecallUserEvent extends UserEvent {}
