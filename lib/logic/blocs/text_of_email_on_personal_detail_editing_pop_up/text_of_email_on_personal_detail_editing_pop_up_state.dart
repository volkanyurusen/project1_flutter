part of 'text_of_email_on_personal_detail_editing_pop_up_bloc.dart';

// abstract class TextOfEmailOnPersonalDetailEditingPopUpState extends Equatable {
//   const TextOfEmailOnPersonalDetailEditingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextOfEmailOnPersonalDetailEditingPopUpState extends Equatable {
  final String? email;

  const TextOfEmailOnPersonalDetailEditingPopUpState({this.email = ''});

  TextOfEmailOnPersonalDetailEditingPopUpState copyWith({String? email}) {
    return TextOfEmailOnPersonalDetailEditingPopUpState(
        email: email ?? this.email);
  }

  @override
  List<Object?> get props => [email!];

  @override
  String toString() =>
      'TextOfEmailOnPersonalDetailEditingPopUpState(email: $email)';
}
