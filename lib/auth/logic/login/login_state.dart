part of 'login_bloc.dart';

class LoginState {
  final String email;
  bool get isValidEmail => email.length > 3 && email.contains('@');

  final String password;
  bool get isValidPassword => password.length > 6;

  final FormSubmissionStatus formSubmissionStatus;

  LoginState({
    this.email = '',
    this.password = '',
    this.formSubmissionStatus = const InitialFormStatus(),
  });

  LoginState copyWith({
    String? email,
    String? password,
    FormSubmissionStatus? formSubmissionStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }
}
