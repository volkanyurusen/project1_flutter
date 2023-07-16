import 'package:flutter_bloc/flutter_bloc.dart';
import '../../auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginState()) {
    on<LoginEvent>(
      (event, emit) async {
        /// email updated
        if (event is LoginEmailChangedEvent) {
          emit(state.copyWith(email: event.email));
        }

        /// password updated
        else if (event is LoginPasswordChangedEvent) {
          emit(state.copyWith(password: event.password));
        }

        /// form submitted
        else if (event is SubmissionSuccess) {
          emit(state.copyWith(formSubmissionStatus: FormSubmitting()));

          /// repository try catch
          try {
            await authRepository.login();
            emit(state.copyWith(formSubmissionStatus: SubmissionSuccess()));
          } catch (e) {
            emit(state.copyWith(
                formSubmissionStatus: SubmissionFailed(e: e as Exception)));
          }
        }
      },
    );
  }
}


  // @override
  // Stream<LoginState> mapEventToState(LoginEvent event) async* {
  //   /// email updated
  //   if (event is LoginEmailChangedEvent) {
  //     yield state.copyWith(email: event.email);
  //   }

  //   /// password updated
  //   else if (event is LoginPasswordChangedEvent) {
  //     yield state.copyWith(password: state.password);
  //   }

  //   /// form submitted
  //   else if (event is SubmissionSuccess) {
  //     yield state.copyWith(formSubmissionStatus: FormSubmitting());

  //     try {
  //       await formRepository.login();
  //       yield state.copyWith(formSubmissionStatus: SubmissionSuccess());
  //     } catch (e) {
  //       yield state.copyWith(
  //           formSubmissionStatus: SubmissionFailed(e as Exception));
  //     }
  //   }
  // }