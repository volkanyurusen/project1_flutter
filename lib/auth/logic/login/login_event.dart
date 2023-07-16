part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginEmailChangedEvent extends LoginEvent {
  final String email;

  LoginEmailChangedEvent({required this.email});
}

class LoginPasswordChangedEvent extends LoginEvent {
  final String password;

  LoginPasswordChangedEvent({required this.password});
}

class LoginSubmitted extends LoginEvent {}
