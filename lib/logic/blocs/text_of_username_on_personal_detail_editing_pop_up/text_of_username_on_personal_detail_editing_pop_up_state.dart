part of 'text_of_username_on_personal_detail_editing_pop_up_bloc.dart';

// abstract class TextOfUsernameOnPersonalDetailEditingPopUpState extends Equatable {
//   const TextOfUsernameOnPersonalDetailEditingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextOfUsernameOnPersonalDetailEditingPopUpState extends Equatable {
  final String? username;

  const TextOfUsernameOnPersonalDetailEditingPopUpState({this.username = ''});

  TextOfUsernameOnPersonalDetailEditingPopUpState copyWith({String? username}) {
    return TextOfUsernameOnPersonalDetailEditingPopUpState(
        username: username ?? this.username);
  }

  @override
  List<Object?> get props => [username!];

  @override
  String toString() =>
      'TextOfUsernameOnPersonalDetailEditingPopUpState(username: $username)';
}
